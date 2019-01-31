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
    json_results = {d['hash']:str(d['investigation']['result']).lower() for d in json_data}
    csv_results = {d['hash']:str(d['verdict']).lower() for d in csv_data}

    # Make a copy of the dictionary to write back to the file
    import copy
    csv_results_copy = copy.deepcopy(csv_results)
    
    # Check for different record lengths
    if len(json_results) != len(csv_results):
        print('Different numbers of records: %s has %d records, and %s has %d records.' % (args.json, len(json_results), args.csv, len(csv_results)))
        # Print records that are different
        if len(json_results) > len(csv_results):
            for k, v in json_results.items():
                if k not in csv_results:
                    print('%s is in %s but not in %s' % (k, args.json, args.csv))
        else:
            for k, v in csv_results.items():
                if k not in csv_results:
                    print('%s is in %s but not in %s' % (k, args.csv, args.json))

    json_dirty = False
    csv_dirty = False
    # Compare element by element
    for k, v in json_results.items():
        if k in csv_results:
            if v != csv_results[k]:
                print('Discrepancy: %s is %s in %s but %s in %s' % (k, v, args.json, csv_results[k], args.csv))
                # Correct records
                print('Would you like to correct the (C)SV file, the (J)SON file, or move on (any other character)?')
                choice = input()
                if choice.upper() == 'C':
                    csv_dirty = True
                    for d in csv_data:
                        if d['hash'] == k:
                            d['verdict'] = '' if v.lower() == 'none' else v.upper()
                            break
                if choice.upper() == 'J':
                    json_dirty = True
                    for d in json_data:
                        if d['hash'] == k:
                            d['investigation']['result'] = '' if csv_results[k].lower() == 'none' else csv_results[k]
                

    # Finally, write updated results to file
    if json_dirty:
        with open(args.json+'.new', 'w') as f:
            json.dump(json_data, f)
            print('Updated JSON written to %s' % args.json+'.new')
    if csv_dirty:
        with open(args.csv+'.new', 'w') as f:
            csv_writer = csv.DictWriter(f, fieldnames=csv_data[0].keys())
            csv_writer.writeheader()
            for d in csv_data:
                csv_writer.writerow(d)
            print('Updated CSV written to %s' % args.csv+'.new')
else: # If we're in generate mode
    try:
        raise NotImplementedError
        # Open the CSV file specified; if it already exists exit without overwriting
        from pathlib import Path
        csv_path = Path(args.csv)
        if csv_path.is_file():
            raise FileExistsError
    except NotImplementedError:
        print("This section isn't implemented yet :(")
    except FileExistsError:
        print("File %s already exists, refusing to overwrite it.")
    else:
        print("Keys in %s: %s" % (args.json, json_data[0].keys()))
        for k in json_data[0].keys():

