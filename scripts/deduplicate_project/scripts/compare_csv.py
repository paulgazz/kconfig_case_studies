import csv
import argparse

parser = argparse.ArgumentParser("Compares two or more CSV files to determine overlap")
parser.add_argument("sample", help="Sample CSV file to compare (I suggest this be the sample dataset)")
parser.add_argument("others", nargs="+", help="One or more files to compare against (I suggest be one of the min/max/default sets). If more than one file is provided, base file will be compared against the union of the rest of the files.")
parser.add_argument("-o", "--outfile", help="prefix of output csvs")

args = parser.parse_args()

class BugRecord:
    """
    A very compressed version of the deduplicate.BugReport class.
    All we need from this is for it to define __eq__ and __hash__
    so we can take advantage of Python's set operations.
    """

    def __init__(self, record: dict):
        
        data = {k:v for k,v in record.items()
                if k in {'line', 'filename', 'tool', 'target', 'type', 'num_configs', 'variability'}}
        self.data = data
        
    def __eq__(self, other):
        return self.data['line'] == other.data['line'] and self.data['filename'] == other.data['filename']

    def __hash__(self):
        return hash((self.data['line'], self.data['filename']))

## ENTRY POINT ##

def read_from_csv(filename):
    resultsset = set()
    with open(filename) as f:
        reader = csv.DictReader(f)

        for r in reader:
            b = BugRecord(r)
            resultsset.add(b)

    return resultsset

# First, open all files and add their record to the list.
sampleset = read_from_csv(args.sample)

baseset = set()
for f in args.others:
    intermediary = read_from_csv(f)
    baseset = baseset.union(intermediary)

# Compute the number of bugs that are in both:
print(f"{len(sampleset.intersection(baseset))} bugs are in both reports.")
baseminussample = list(baseset - sampleset)
sampleminusbase = list(sampleset - baseset)
print(f"{len(baseminussample)} bugs found by base but not by sample.")
print(f"{len(sampleminusbase)} bugs found by sample but not by base.")
if len(baseminussample) > 0:
    print(f"Writing the bug reports that were in base but not in sample to {'{}_base_minus_sample.csv'.format(args.outfile)}.")
    with open('{}_base_minus_sample.csv'.format(args.outfile), 'w') as f:
        writer = csv.DictWriter(f, fieldnames=baseminussample[0].data.keys())

        for row in baseminussample:
            writer.writerow(row.data)

if len(sampleminusbase) > 0:
    print(f"Writing the bug reports that were in sample but not in base to {'{}_sample_minus_base.csv'.format(args.outfile)}.")
    with open('{}_sample_minus_base.csv'.format(args.outfile), 'w') as f:
        writer = csv.DictWriter(f, fieldnames=sampleminusbase[0].data.keys())

        for row in sampleminusbase:
            writer.writerow(row.data)
