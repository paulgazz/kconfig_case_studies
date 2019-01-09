import math
import argparse

parser = argparse.ArgumentParser('Script to generate a verification sample for external verification of true bug reports')

parser.add_argument('infile', help='JSON results file to sample from')
parser.add_argument('-o','--outfile', help='Output file (default = verification.json)', default='verification.json')
parser.add_argument('--key', help='Also prints the verification set with the extant classifcations to a file <outfile>.classifed', action="store_true")
parser.add_argument('--seed', help='Sets the random seed for reproducibility (default = 64928367)', default = 649283670)
parser.add_argument('--false', default=0.3, type=float, help='Ratio of false bug reports to true bug reports (default = 0.25)')

args = parser.parse_args()

import json

# Open file and import reports
with open(args.infile, 'r') as f:
    reports = json.load(f)

# Check that classification exists
if 'investigation' not in reports[0]:
    print("'investigation' is not in this JSON file. The keys that exist are %s" % reports[0].keys())
    
# Filter to only true reports
only_true = list(filter((lambda x: x['investigation']['result'] == True), reports))

# Also get only false reports
only_false = list(filter((lambda x: x['investigation']['result'] == False), reports))

# Sample for the correct ratio
import random
random.seed(args.seed)
sample_size = int(len(only_true) * args.false)

false_reports = random.sample(only_false, sample_size if sample_size < len(only_false) else len(only_false))
to_write = only_true + false_reports
random.shuffle(to_write)

# If the key flag is on, then output here in addition to the one with the wiped classifications
if args.key:
    with open(args.outfile + '.classified', 'w') as f:
        json.dump(to_write, f)
        print("Printed key to %s.classified" % args.outfile)
    
# Wipe classification
for r in to_write:
    r['investigation']['result'] = None
    r['investigation']['comments'] = ''

# Write to file
with open(args.outfile, 'w') as f:
    json.dump(to_write, f)
    print("Outputted to %s" % args.outfile)
