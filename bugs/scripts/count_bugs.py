# Program to count the number of bug reports per configuration and output the results to a .csv file

import argparse
parser = argparse.ArgumentParser(description='A program to generate a .csv file with information about the number of bug reports per file.')
parser.add_argument('--target', '-t', default='.', help='Target directory (default = \'.\')')
parser.add_argument('--output', '-o', default='counts.csv', help='Output file (default = counts.csv)')
parser.add_argument('--verbose', '-v', action='count', help='Verbosity level')
parser.add_argument('format', choices=['cbmc', 'clang', 'infer', 'cppcheck', 'ikos'])
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
import json
import plistlib

file_list = list()
# Set file extension based on format
if args.format == 'cbmc':
    file_extension = '.config.xml'
elif args.format == 'infer':
    logging.debug('Format is infer')
    file_extension = 'report.json'
elif args.format == 'clang':
    file_extension = '.plist'
elif args.format == 'ikos':
    file_extension = 'db.json'
elif args.format == 'cppcheck':
    file_extension = ('cppcheck.resolved', 'err.txt')
else:
    file_extension = 'none'


# Get a list of all relevant files (i.e. those with file_extension as the ending
for root, dirs, files in os.walk(args.target):
    for f in files:
        if f.endswith(file_extension):
            file_list.append(os.path.join(root, f))

# Set up list containing counts
counts = [0 for x in xrange(0,1000)]

# Iterate over files and count
logging.info('Processing files....')
for entry in file_list:
    logging.debug('Processing file ' + entry)
    with open(entry) as f:
        count = 0
        # Determine which configuration this file refers to.
        config_number = int(re.findall('[0-9]{1,3}', re.findall('[0-9]{1,3}.config', entry)[0])[0])
        logging.debug('Config number %d' % (config_number))
        if args.format == 'cbmc':
            # Properties is the list of bug reports
            data = xmltodict.parse(f)['cprover']
            if 'property' in data:
                count = len(data['property'])
        elif args.format == 'infer' or args.format == 'ikos':
            try:
                data = json.load(f)
            except ValueError:
                continue;
            count = len(data)
        elif args.format == 'clang':
            data  = plistlib.readPlist(f)
            count = len(data['diagnostics'])
        elif args.format == 'cppcheck':
            count = sum(1 for line in f)

        logging.debug('%d bugs found' % (count))
        counts[config_number] += count
# Write to csv file
logging.info('Now writing to ' + args.output)
with open(args.output, 'wb') as out:
    out_writer = csv.writer(out, dialect='excel')
    for record in xrange(0,1000):
        out_writer.writerow([record, counts[record]])
        logging.debug('Wrote record %d, %d' % (record, counts[record]))
        
logging.info('Done. Output written to ' + args.output)
