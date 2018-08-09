# Written by Austin Mordahl
# 2018-07-04

import json
import argparse

parser = argparse.ArgumentParser(description='List unique JSON records')
parser.add_argument('-i','--input', type=str, default="master.json",
                    help='The master file containing the JSON records')
parser.add_argument('-o', '--output', type=str, default="unique.json",
                    help='The output file (default unique.json)')
args = parser.parse_args()

try:
    infile = open(args.input)
except IOError:
    print "There was an error opening " + args.input + ". Please check that the file exists."
    exit()
try:
    outfile = open(args.output, 'w')
except IOError:
    print "There was a problem opening " + args.output + "."
    exit()
    
# Get all the JSON objects from master
rawdata = json.load(infile)

# Filter rawdata to only include relevant information.
filtered = list()
for datum in rawdata:
    filtered.append(dict((key, value) for key, value in datum.iteritems() if key in ('key', 'bug_type','file','line','procedure','qualifier', 'hash')))

# Convert rawdata to strings so we can compare them.
data = [json.dumps(item) for item in filtered]

# Only bugs with unique hashes
unique = list()
unique_hashes = set()
for datum in filtered:
    if datum['hash'] not in unique_hashes:
        unique.append(datum)
        unique_hashes.add(datum['hash'])

# Add the number of occurrences
for datum in unique:
    datum['num_occurrences'] = len([x for x in filtered if x['hash'] == datum['hash']])
        
# Write the unique set to file.
print "Found " + str(len(unique)) + " unique reports."

json.dump(unique, outfile)
print "Written to " + args.output
    
infile.close()
outfile.close()
