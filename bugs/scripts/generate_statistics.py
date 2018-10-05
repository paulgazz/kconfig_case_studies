import json
import statistics as sts

import argparse
parser = argparse.ArgumentParser()
parser.add_argument('input', help='input file', default='unique.json.results.filtered')
parser.add_argument('--trueonly', help='compute statistics only for reports classified as true', action='store_true')

args = parser.parse_args()

# Import data
with open(args.input) as f:
    data = json.load(f)

nums = list()
nums_true = list()

for datum in data:
    if (args.trueonly):
        if datum['classification']:
            nums.append(datum['num_occurrences'])
    else:
        nums.append(datum['num_occurrences'])
                

print('Statistics:')
print('Total Number of Reports: %d' % (len(nums)))
print('Mean: %f' % (sts.mean(nums)))
print('Median: %f' % (sts.median(nums)))
print('Standard Deviation: %f' % (sts.pstdev(nums)))
