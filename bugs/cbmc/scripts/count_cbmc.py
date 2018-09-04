# Program to count the number of bug reports per configuration and output the results to a .csv file

import argparse
parser = argparse.ArgumentParser(description='A program to generate a .csv file with information about the number of bug reports per file.')
parser.add_argument('--target', '-t', default='.', help='Target directory (default = \'.\')')
parser.add_argument('--output', '-o', default='counts.csv', help='Output file (default = counts.csv)')
parser.add_argument('--verbose', '-v', action='count', help='Verbosity level')
args = parser.parse_args()

import logging
if args.verbose < 1:
    logging.basicConfig(level=logging.WARNING)
elif args.verbose == 1:
    logging.basicConfig(level=logging.INFO)
else:
    logging.basicConfig(level=logging.DEBUG)

import os
import xmltodict
import re
import csv

file_extension = '.config.xml'

# Get a list of all relevant files (i.e. those with file_extension as the ending
file_list = [x for x in os.listdir(args.target) if x.endswith(file_extension)]

# Set up list containing counts
counts = [0 for x in xrange(0,1000)]

# Iterate over files and count
logging.info('Processing files....')
for entry in file_list:
    logging.debug('Processing file ' + entry)
    with open(entry) as f:
        # Properties is the list of bug reports
        properties = xmltodict.parse(f)['cprover']['property']
        # Determine which configuration this file refers to.
        config_number = int(re.findall('[0-9]{1,3}', entry)[0])
        counts[config_number] = len(properties)

# Write to csv file
logging.info('Now writing to ' + args.output)
with open(args.output, 'wb') as out:
    out_writer = csv.writer(out, dialect='excel')
    for record in xrange(0,1000):
        out_writer.writerow([record, counts[record]])
        logging.debug('Wrote record %d, %d' % (record, counts[record]))
        
logging.info('Done. Output written to ' + args.output)
