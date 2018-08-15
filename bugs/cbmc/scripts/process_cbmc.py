# Script to Process CBMC Records (and maybe all other XML files as well)

import os
import xmltodict
import re
import hashlib
import logging
import argparse
import json

parser = argparse.ArgumentParser('Script to deduplicate XML bug reports.')
# Implemented verbose as a count in case we want to add more levels of verbosity later."
parser.add_argument('-v', '--verbose', action='count', default=0,
                    help='Level of verbosity. Include more v\' s for more verbosity (current only one level of verbosity is supported)')
parser.add_argument('-t', '--target', default='.',
                    help='Directory in which XML files are located (default .)')
parser.add_argument('-o', '--output', default='unique.json')
args=parser.parse_args()

if args.verbose < 1:
    logging.basicConfig(level=logging.INFO)
else:
    logging.basicConfig(level=logging.DEBUG)

# Iterate through files in target directory
target_dir = args.target
outfile = args.output

master = list()

# hash_master is a set of all hashes, so that we can determine whether a report is unique
hash_master = set()
# hash_index is a dictionary of hashes by file, so that we can determine the configuration list later on
hash_index = dict()

logging.info("Now starting processing. This may take some time.")

for file in os.listdir(target_dir):
    # Skip non-xml files
    if not file.endswith('.config.xml'):
        continue

    # Grab XML records, add to master
    with open(file) as infile:
        logging.info('Now processing file ' + file)
        data = xmltodict.parse(infile.read())

        # Make a list of hashes for keeping track of configurations later
        hashes = list()
        hash_index[file] = list()
        # Record configuration
        logging.debug(str(len(data['cprover']['property'])) + ' reports found.')
        for property in data['cprover']['property']:

            # Add a hash to the property so we can compare them later.
            property['hash'] = hashlib.md5(str(property).encode()).hexdigest()

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

    for record in hash_index:
        logging.debug('Finding configuration list for report ' + property['hash'])
        if property['hash'] in hash_index[record]:
            property['configurations'].extend(re.findall(r'[0-9]{1,3}', record))
    logging.info('Report ' + property['hash'] + ' was present in ' + str(len(property['configurations'])) + ' configurations.')

# Write output to file
with open(outfile, 'w') as out:
    json.dump(master,out)
