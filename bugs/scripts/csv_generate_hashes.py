import argparse
parser = argparse.ArgumentParser("Utility to generate hashes for a CSV file made by hand (useful for cppcheck, which doesn't emit JSON/XML files and thus the CSV has to be made by hand)")

parser.add_argument("infile", help="Input file")
parser.add_argument("outfile", help="Output file")

args=parser.parse_args()

import sys
import hashlib
import csv

# Open the csv file
try:
    csv_reader = csv.DictReader(open(args.infile), dialect="excel")
    csv_data = list()
    for record in csv_reader:
        csv_data.append(record)

    for d in csv_data:
        # Reduce to necessary fields
        relevant = {k: v for k,v in d.items() if k in {"file", "line", "message"}}
        # Hash
        d['hash'] = hashlib.md5(str(relevant).encode()).hexdigest()

    # Write to file
    import os
    if args.outfile in os.listdir('.'):
        if input("{} already exists. Overwrite? (Y/N) ".format(args.outfile)).upper() != 'Y':
            sys.exit(0)
    csv_writer = csv.DictWriter(open(args.outfile, 'w'), fieldnames=csv_data[0].keys())
    csv_writer.writeheader()
    for d in csv_data:
        csv_writer.writerow(d)
    print("Updated CSV written to %s" % args.outfile)

except OSError as ex:
    # Put different handling of file not found here if needed
    raise ex
    
        
