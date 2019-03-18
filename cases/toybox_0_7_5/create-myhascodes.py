#!/usr/bin/env python2.7

"""
"""
import argparse
import os.path
import subprocess as sp
import hashlib
import json


jsonFile='/Users/ukoc/kconfig_master/bugs/infer/toybox/unique.json.results.filtered'
jsonFile = open(jsonFile, 'r')
values = json.load(jsonFile)
jsonFile.close()
fields_to_hash = {'bug_type', 'file', 'line'}
hashCodes = ['allreachable']
for bug in values:
    fields2hash={}
    for field in fields_to_hash:
        fields2hash[field] = bug[field]
    print(bug['hash']+' : '+hashlib.md5(str(fields2hash).encode()).hexdigest())
#     hashCodes.append()

# print('\n'.join(hashCodes))