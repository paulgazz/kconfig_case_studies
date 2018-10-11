import json
import statistics as sts

import argparse
parser = argparse.ArgumentParser()
parser.add_argument('input', help='input file', default='unique.json.results.filtered')
parser.add_argument('--trueonly', '-t', help='compute statistics only for reports classified as true', action='store_true')
parser.add_argument('--features', '-f', help='compute statistics for featurs, as well', action='store_true')
parser.add_argument('--nogeneric', '-g', help='do not include generic bugs', action='store_true')

args = parser.parse_args()

if (args.nogeneric and not args.trueonly):
    print('WARNING: Enabling --nogeneric automatically enables --trueonly')
    
# Import data
with open(args.input) as f:
    data = json.load(f)

# Handle aggregated bug reports
import copy
static_data = copy.deepcopy(data)
for datum in static_data:
    bugs = len(datum['matching_description']['__value__'])
    if bugs > 1:
        for x in range(1, bugs):
            data.append(datum)

# Handle reports where every bug isn't classified
data = [x for x in data if 'classification' in x.keys()]
        
if (args.trueonly):
    data = [x for x in data if str(x['classification']).upper() == 'TRUE']

if (args.nogeneric):
    data = [x for x in data if (x['features'] != '' and x['features'].upper() != 'GENERIC')]
            
nums = list()
features = list()

for datum in data:
    nums.append(int(datum['num_occurrences']))
    if args.features:
        features.append(datum['features'])



print('Statistics:')
print('Total Number of Reports: %d' % (len(nums)))
print('Mean: %f' % (sts.mean(nums)))
print('Median: %f' % (sts.median(nums)))
print('Standard Deviation: %f' % (sts.pstdev(nums)))
if args.features:
    num_features = [len(str.split(f, ',')) for f in features if f.lower() != 'generic']
    print('Num non-generic true features: %d' % (len(num_features)))
    print('Max Features: %d' %(max(num_features)))
    print('Min Features: %d' % (min(num_features)))
    print('Mean Features: %f' % (sts.mean(num_features)))
    print('Median Features: %d' % (sts.median(num_features)))
    print('Standard Deviation of Features: %f' % (sts.pstdev(num_features)))
    
