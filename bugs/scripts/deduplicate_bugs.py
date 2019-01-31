import argparse
parser = argparse.ArgumentParser(description='Postprocesses bug reports, finds unique bug reports.')
parser.add_argument('--target', '-t', default='.', help='Target directory (default = \'.\')')
parser.add_argument('--output', '-o', default='unique.json.results', help='Output file (default = unique.json.results)')
parser.add_argument('--verbose', '-v', action='count', help='Verbosity level')
parser.add_argument('format', choices=['cbmc', 'clang', 'infer', 'cppcheck', 'ikos', 'clang7'])
args = parser.parse_args()

import logging
if args.verbose < 1:
    logging.basicConfig(level=logging.WARNING)
elif args.verbose == 1:
    logging.basicConfig(level=logging.INFO)
else:
    logging.basicConfig(level=logging.DEBUG)

import hashlib
import os
import xmltodict
import re
import csv
import jsonplus as json
import plistlib

file_list = list()
fields_to_hash = None
# Set file extension based on format
if args.format == 'cbmc':
    file_extension = 'cbmc_exec.xml'
    fields_to_hash = {'@class', 'location'}
    description = 'description'
elif args.format == 'infer':
    file_extension = 'report.json'
    fields_to_hash = {'bug_type', 'file', 'line'}
    #fields_to_hash = {'hash'}
    description = 'qualifier'
elif args.format == 'clang':
    file_extension = '.plist'
    fields_to_hash = {'category', 'location', 'file'}
    description = 'description'
elif args.format == 'clang7':
    file_extension = '.plist.resolved'
    fields_to_hash = {'category', 'location', 'file'}
    description = 'description'
elif args.format == 'ikos':
    file_extension = 'db.json'
    fields_to_hash = {'status', 'location','short_msg'}
    description = 'short_msg'
else:
    logging.critical('Format %s not recognized, exiting' % (args.format))
    exit()

# Get a list of all relevant files (i.e. those with file_extension as the ending
for root, dirs, files in os.walk(args.target):
    for f in files:
        if f.endswith(file_extension):
            file_list.append(os.path.join(root, f))

# SETUP DATA STRUCTURES
master = list()
hash_master = set()
hash_index = dict()
description_index = dict()
hashes = list()

# Iterate over files and count
logging.info('Processing files....')
for entry in file_list:
    logging.debug('Processing file ' + entry)
    with open(entry) as f:
        count = 0
        # Determine which configuration this file refers to.
        config_number = int(re.findall('[0-9]{1,3}', re.findall('[0-9]{1,3}.config', entry)[0])[0])
        logging.debug('Config number %d' % (config_number))

        # FOR ANY NEW TOOL:
        #  `property_list` must refer to the list of bug reports in the file
        #  `description` must refer to the name of the field in a bug report containing the description of the bug
        if args.format == 'cbmc':
            data = xmltodict.parse(f.read())

            # Skip files with no bugs
            if 'property' not in data['cprover']:
                logging.warning('File %s has no bugs' % (f))
                continue
            
            # Record the number of bugs found
            logging.debug('%s reports found' % len(data['cprover']['property']))
            property_list = data['cprover']['property']
        elif args.format == 'infer':
            try:
                content = f.read()
                property_list = json.loads(content)
            except ValueError:
                continue;
        elif args.format == 'clang' or args.format == 'clang7':
            clang_data = plistlib.readPlist(f)
            property_list  = clang_data['diagnostics']
            for property in property_list:
                property['source_file'] = clang_data['files'][0]
                # REMOVES PATH INFO, BECAUSE IT'S VERY LONG AND MAKES JSON REPORTS HARD TO READ
                del property['path']
        elif args.format == 'ikos':
            try:
                property_list = json.loads(f.read())
            except:
                logging.warning('File %s has no entries' % (entry))
                continue

        # Deduplicate property_list
        for property in property_list:
            # Hash property
            datum = {k: v for k,v in property.items() if k in fields_to_hash}
            
            datum['location'] = {k:v for k,v in datum['location'].items() if k not in {'stmt_uid'}}
            property['hash'] = hashlib.md5(str(datum).encode()).hexdigest()

            # Add the description to the hash's description list
            if property['hash'] not in description_index:
                description_index[property['hash']] = set()
            description_index[property['hash']].add(property[description])

            # Add the hash to this file's hash dictionary
            if entry not in hash_index:
                hash_index[entry] = list()
            hash_index[entry].append(property['hash'])

            # Add to the master file if it's not unique
            if property['hash'] not in hash_master:
                logging.debug('Report ' + property['hash'] + ' is unique; adding to master.')
                hash_master.add(property['hash'])
                master.append(property)
            else:
                logging.debug('Report ' + property['hash'] + ' is not unique.')

# Use the hash_index list to find the number of configurations in which each bug is present
logging.info("Now compiling lists of configurations.")
for property in master:
    property['configurations'] = set()
    logging.debug('Finding configuration list for report ' + property['hash'])
    for record in hash_index:
        if property['hash'] in hash_index[record]:
            property['configurations'].add(int(re.findall('[0-9]{1,3}', re.findall('[0-9]{1,3}.config', record)[0])[0]))
            count = count + 1
    property['configurations'] = list(property['configurations'])
    property['configurations'].sort()
    property['num_occurrences'] = len(property['configurations'])
    logging.info('Report ' + property['hash'] + ' was present in ' + str(len(property['configurations'])) + ' configurations.')

    # Also add the description list to the property
    property['matching_description'] = description_index[property['hash']]

    # Add empty investigation results field
    property['investigation'] = {'result': None, 'comments':''}
    
print str(len(master)) + ' unique bugs found.'

# Write output to file
with open(args.output, 'w') as out:
    content = json.dumps(master,out)
    out.write(content)
    print 'Output written to ' + args.output