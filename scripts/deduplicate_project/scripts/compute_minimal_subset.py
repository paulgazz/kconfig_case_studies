import csv
import json

import argparse
parser = argparse.ArgumentParser("Computes the minimum set of configurations to find every warning.")
parser.add_argument("infile")
args = parser.parse_args()

def compute_config_counts(dataset):
    counts = dict()
    for d in dataset:
        for n in d['configs']:
            if n not in counts:
                counts[n] = 1
            else:
                counts[n] = counts[n] + 1
    return counts

def remove_matching_warnings(config, dataset: list):
    for d in dataset:
        if config in d['configs']:
            dataset.remove(d)

# Open dataset
with open(args.infile) as f:
    dataset = json.load(f)

table = list()
total = len(dataset)
minimal = list()
print(f"Opened {args.infile}, with {total} warnings.")
tablerow = {"iteration": 0,
            "configuration selected": None,
            "% warnings removed (cumulative)": 0,
            "number of warnings remaining": total,
            "minimal set": str(minimal)
            }
table.append(tablerow)
row = 1
while len(dataset) > 0:
    counts = compute_config_counts(dataset)
    greedy_config = max(counts, key=lambda x: counts[x])
    print(f"Choosing config {greedy_config} next")
    minimal.append(greedy_config)
    remove_matching_warnings(greedy_config, dataset)
    print(f"{((total-len(dataset))/total)*100}% of warnings found with {len(minimal)} configurations, ",
          f"configuration list so far is {minimal}")
    
    # Generate table row
    tablerow = {"iteration": row,
                "configuration selected": greedy_config,
                "% warnings removed (cumulative)": (total-len(dataset))/total*100,
                "number of warnings remaining": len(dataset),
                "minimal set": str(minimal)
                }

    table.append(tablerow)
    row = row + 1
           
print(f"Minimum config list is {minimal}, with {len(minimal)} configurations.")
outcsv = "{}.minimal.csv".format(args.infile)
print(f"Writing results to {outcsv}")
with open(outcsv, 'w') as f:
    writer = csv.DictWriter(f, fieldnames=table[0].keys())

    writer.writeheader()
    for r in table:
        writer.writerow(r)
    
    
