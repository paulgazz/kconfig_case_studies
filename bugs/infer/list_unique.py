# Written by Austin Mordahl
# 2018-07-04

import json
import argparse

parser = argparse.ArgumentParser(description='List unique JSON records')
parser.add_argument('input', type=str, default="master.json",
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
    filtered.append(dict((key, value) for key, value in datum.iteritems() if key in ('bug_type','file','line','procedure','qualifier')))
    
# Convert rawdata to strings so we can compare them.
data = [json.dumps(item) for item in filtered]

# Add a field to bug reports for number of occurrences.
for datum in filtered:
    datum['num_occurrences'] = data.count(json.dumps(datum))
    
# Convert filtered to strings, again, so 
data = list()
data = [json.dumps(item) for item in filtered]

# Filter unique items
unique = set()
for item in data:
    if item not in unique:
        unique.add(item)
                         
# Write the unique set to file.
print "Found " + str(len(unique)) + " unique reports."
outfile.write('[')

for item in unique:
    outfile.write(item + ',')
outfile.write(']')
print "Written to " + args.output
    
infile.close()
outfile.close()
