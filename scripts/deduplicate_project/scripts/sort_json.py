import json
import argparse

parser = argparse.ArgumentParser("Sorts JSON files by 1) file name then 2) line number")
parser.add_argument("input", nargs="*", help="list of files to sort")
args = parser.parse_args()

for file in args.input:
    with open(file) as f:
        data = json.load(f)

    sortedlist = sorted(data, key=lambda x: (x["filename"], x["line"]))

    with open(file, 'w') as f:
        json.dump(sortedlist, f)
