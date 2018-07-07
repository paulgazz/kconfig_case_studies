# Written by Austin Mordahl
# 2018-07-06

import argparse
import os
import json

parser = argparse.ArgumentParser(description='Generate mapping from unique bug reports to the configurations in which they are present')

parser.add_argument('--input', '-i', type=str, default='unique.json',
                    help='The list of unique bug reports as JSON records (default unique.json')
parser.add_argument('--output', '-o', type=str, default='mapping.json',
                    help='The output file (default mapping.json)')
args = parser.parse_args()

# Import unique list
try:
    infile = open(args.input)
except IOError:
    print('There was an error opening %s. Please make sure it exists or try another input.' % args.input)
    exit()

# Read JSON records
unique = json.load(infile)

# Iterate through unique and only grab keys and hashes.
hashes = list()
for item in unique:
    hashes.append((item['key'], item['hash'], item['line'], item['file']))

# Find report files.
reports = list()
for root, dirs, files in os.walk('.'):
    if 'report.json' in files:
        reports.append(root + '/report.json')

mappings = list()

# Create an entry for each bug:
for bug in hashes:
    mappings.append({'key':bug[0], 'hash':bug[1], 'line':bug[2], 'file':bug[3], 'configs':list()})

# Iterate through report files and generate the mapping
for bug in mappings:
    for report in reports:
        with open(report) as lines:
            for line in lines:
                if bug['hash'] in line:
                    bug['configs'].append(report)
                    break
                
infile.close()

# Write report to file
with open(args.output, 'w') as output:
    json.dump(mappings, output)
