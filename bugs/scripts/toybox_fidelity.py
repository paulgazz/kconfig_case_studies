# Written by Austin Mordahl
# 2018-07-06

import argparse
import json

parser = argparse.ArgumentParser(description='Check fidelity between number of reported bugs and the number of files they are in.')
parser.add_argument('-u', '--unique', default='unique.json')
parser.add_argument('-m', '--mapping', default='mapping.json')

args = parser.parse_args()

with open(args.unique) as uf:
    with open(args.mapping) as mf:
        unique = json.load(uf)
        mapping = json.load(mf)

        for item in unique:
            for imap in mapping:
                if imap['hash'] == item['hash']:
                    if len(imap['configs']) != item['num_occurrences']:
                        print('Mapping error:\n\tbug: %s\n\thash: %s\n\tnum configs: %d\n\tnum occurrences: %d\n\n' % (item['key'], item['hash'], len(imap['configs']), item['num_occurrences']))
