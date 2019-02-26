# Script to Process CBMC Records (and maybe all other XML files as well)

import os
import re
import hashlib
import logging
import argparse
import jsonplus as json

parser = argparse.ArgumentParser('Script to deduplicate JSON bug reports.')
# Implemented verbose as a count in case we want to add more levels of verbosity later."
parser.add_argument('-v', '--verbose', action='count', default=0,
                    help='Level of verbosity. Include more v\' s for more verbosity (current only one level of verbosity is supported)')
parser.add_argument('-t', '--target', default='.',
                    help='Directory in which XML files are located (default .)')
parser.add_argument('-o', '--output', default='unique.json')
args=parser.parse_args()

if args.verbose < 1:
    logging.basicConfig(level=logging.WARNING)
elif args.verbose == 1:
    logging.basicConfig(level=logging.INFO)
else:
    logging.basicConfig(level=logging.DEBUG)

# Iterate through files in target directory
target_dir = args.target
outfile = args.output
fields_to_hash = {'full_msg', 'location'}
master = list()

# hash_master is a set of all hashes, so that we can determine whether a report is unique
hash_master = set()
# hash_index is a dictionary of hashes by file, so that we can determine the configuration list later on
hash_index = dict()

print "Now starting processing. This may take some time."

for file in os.listdir(target_dir):
    # Skip non-xml files
    if not file.endswith('.db.json'):
        continue

    # Grab XML records, add to master
    with open(file) as infile:
        logging.info('Now processing file ' + file)

        incontent = infile.read()
        try:
            data = json.loads(incontent)
        except ValueError:
            logging.warning('Unable to parse file %s as JSON' % (file))
            continue

        # Make a list of hashes for keeping track of configurations later
        hashes = list()
        hash_index[file] = list()
        # Record configuration
        logging.debug(str(len(data)) + ' reports found.')
        for property in data:
        # Add a hash to the property so we can compare them later. Only hash the subset of property, datum
            property['location'] = {k: v for k,v in property['location'].items() if k not in {'stmt_uid'}}
            to_hash = {k: v for k,v in property.items() if k in fields_to_hash}
            property['hash'] = hashlib.md5(str(to_hash).encode()).hexdigest()

            # Add the hash to this file's hash dictionary
            hash_index[file].append(property['hash'])
            
            # Add to master file if it is unique
            if property['hash'] not in hash_master:
                logging.debug('Report ' + property['hash'] + ' is unique; adding to master.')
                hash_master.add(property['hash'])
                master.append(property)
            else:
                logging.debug('Report ' + property['hash'] + ' is not unique.')

# Now, use the hash_index list to find the number of configurations in which each bug is present.
logging.info("Now compiling lists of configurations.")
for property in master:
    property['configurations'] = list()
    count = 0
    for record in hash_index:
        logging.debug('Finding configuration list for report ' + property['hash'])
        if property['hash'] in hash_index[record]:
            property['configurations'].extend(re.findall(r'[0-9]{1,3}', re.findall('[0-9]{1,3}.config', record)[0]))
            count = count + 1
    property['num_occurrences'] = count
    logging.info('Report ' + property['hash'] + ' was present in ' + str(len(property['configurations'])) + ' configurations.')

print str(len(master)) + ' unique bugs found.'

# Write output to file
with open(outfile, 'w') as out:
    content = json.dumps(master,out)
    out.write(content)
    print 'Output written to ' + outfile
