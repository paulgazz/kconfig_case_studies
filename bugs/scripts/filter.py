# Written by Austin Mordahl
# 2018-07-20

import json
import argparse

parser = argparse.ArgumentParser(description='Filter bug reports to remove dead stores.')
parser.add_argument('-i','--input', type=str, default="unique.json.results",
                    help='The file to be filtered (default unique.json.results)')
parser.add_argument('-o', '--output', type=str, default="unique.json.results.filtered", help='The output file (default unique.json.results.filtered)')
parser.add_argument('program', choices=['clang', 'infer'])

args = parser.parse_args()

try:
    infile = open(args.input)
except IOError:
    print "There was an error opening " + args.input + ". Please check that the file exists."
    exit()


# Get all of the JSON objects
rawdata = json.load(infile)
infile.close()

if args.program == 'infer':
    category = 'bug_type'
    name = 'DEAD_STORE'
elif args.program == 'clang':
    category = 'category'
    name = 'Dead store'

# Filter to include bug types listed in bugs
filtered = filter(lambda item: item[category] != name, rawdata)

# Write to file
try:
    outfile = open(args.output, 'w')
except IOError:
    print "There was a problem opening " + args.output + "."
    exit()

print "Filtered to " + str(len(filtered)) + " bug reports."
json.dump(filtered, outfile)
print "Written to " + args.output
outfile.close()
