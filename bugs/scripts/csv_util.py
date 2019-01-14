import argparse
parser = argparse.ArgumentParser('Utility to generate a new CSV file from a JSON file, or compare a JSON and CSV file for discrepancies.')

parser.add_argument('json', help='Input JSON file')
parser.add_argument('csv', help='Input CSV in compare mode, output CSV in generate mode.')
parser.add_argument('mode', choices=['generate', 'compare'])

args = parser.parse_args()

import logging
logging.basicConfig(level=logging.INFO)
# Check for mutually inclusive options
if args.mode == 'generate' and args.outcsv == None:
    parser.error('Must specify an output CSV file in generate mode.')
if args.mode == 'compare' and args.csv == None:
    parser.error('Must specify an input CSV file in compare mode.')

# Open files
import json
json_data = json.load(open(args.json))

import csv
if args.mode == 'compare':
    csv_reader = csv.DictReader(open(args.csv), dialect='excel')
    csv_data = list()
    for record in csv_reader:
        csv_data.append(record)

    # Let's just do compare mode first.
    print('Now iterating through records.')

    # Build the hash: result dictionary for both files and compare
    json_results = {d['hash']:d['investigation']['result'] for d in json_data}
    csv_results = {d['hash']:d['verdict'] for d in csv_data}

    # Make a copy of the dictionary to write back to the file
    import copy
    csv_results_copy = copy.deepcopy(csv_results)
    
    # Check for different record lengths
    if len(json_results) != len(csv_results):
        print('Different numbers of records: %s has %d records, and %s has %d records.' % (args.json, len(json_results), args.csv, len(csv_results)))
        
    for k, v in json_results.items():
        if k not in csv_results:
            print('Record %s is in %s but not in %s' % (k, args.json, args.csv))
        else:
            if csv_results[k].lower() != str(v).lower():
                print('Classification discrepancy: %s is %s in %s, but %s in %s' % (k, str(v).upper(), args.json, csv_results[k].upper(), args.csv))
        csv_results.pop(k)

    if len(csv_results) > 0:
        for k, v in csv_results.items():
            print('Record %s with classification %s is in %s but not in %s.' % (k, v, args.csv, args.json))
else: # If we're in generate mode
    print('Not implemented yet, sorry :(')

    
