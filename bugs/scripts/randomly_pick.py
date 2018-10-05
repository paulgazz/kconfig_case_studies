# Austin Mordahl
# 2018-10-5

import argparse
parser = argparse.ArgumentParser(description='Randomly pick a certain amount of bug reports from a bug report file.')

parser.add_argument('input', help='input file (currently only supports JSON)')
parser.add_argument('number', type=int, help='number of bug reports to choose')
parser.add_argument('-s', '--seed', default=6472982120194379559, help='seed to give to random number generator (default = 6472982120194379559). Under normal circumstances, you should not specify your own seed for the sake of the replicability of this script\'s output. If you do supply your own seed, RECORD IT.')
parser.add_argument('-o', '--output', default='picked.json', help='Output file (default picked.json)')

args = parser.parse_args()

import json
import random

# Get file
with open(args.input) as f:
    data = json.load(f)
random.seed(args.seed)

picked = random.sample(data, args.number)

with open(args.output, 'w') as f:
    json.dump(picked, f)

print('Check %s for picked bug reports.' % (args.output))
