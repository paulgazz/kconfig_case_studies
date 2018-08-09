# Written by Austin Mordahl
# 2018-07-20

import json
import argparse

parser = argparse.ArgumentParser(description='Filter bug reports to a unique bug type.')
parser.add_argument('-i','--input', type=str, default="unique.json",
                    help='The file to be filtered (default unique.json)')
parser.add_argument('-o', '--output', type=str, default="filtered.json",
                    help='The output file (default filtered.json)')
parser.add_argument('bugs', nargs="+", help="The list of bug types to filter to")
parser.add_argument('-r','--reverse', action="store_true",
                    help="Reverses the behavior of the script (i.e. filter to " +
                    "exclude the bugs in the bugs list, rather than including them.")

args = parser.parse_args()

try:
    infile = open(args.input)
except IOError:
    print "There was an error opening " + args.input + ". Please check that the file exists."
    exit()


# Get all of the JSON objects
rawdata = json.load(infile)
infile.close()

# Filter to include bug types listed in bugs
filtered = filter(lambda item: item['bug_type'] in args.bugs, rawdata) if not args.reverse else filter(lambda item: item['bug_type'] not in args.bugs, rawdata)

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
