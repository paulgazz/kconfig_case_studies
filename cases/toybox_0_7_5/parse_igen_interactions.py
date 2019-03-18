#!/usr/bin/env python2.7

"""
"""
import argparse
import os.path
import subprocess as sp
import hashlib
import json
import re

kconfigConst=['!UNSHARE','!TOYBOX_ANDROID_SCHEDPOLICY','!MKNOD_Z','!SETPROP','TOYBOX_FORK','!LOAD_POLICY','!GETPROP','!SENDEVENT','!ID_Z','TOYBOX_SHADOW','!EXIT','!START','TOYBOX','!RUNCON','!TOYBOX_SELINUX','!TOYBOX_PRLIMIT','!CD','FGREP','!RESTORECON','!NSENTER','TOYBOX_FLOAT','!SHA384SUM','SORT_BIG','TOYBOX_FIFREEZE','TOYBOX_FALLOCATE','!SHA224SUM','SLEEP','!TOYBOX_MUSL_NOMMU_IS_BROKEN','EGREP','!SHA256SUM','SORT_FLOAT','TOYBOX_UID_SYS=1','!MKDIR_Z','!TOYBOX_ON_ANDROID','!MKFIFO_Z','TOYBOX_UID_USR=1','GREP','SLEEP_FLOAT','!STOP','TOYBOX_UTMPX','TOYBOX_ICONV','!ULIMIT','!SETENFORCE','!CHCON','SORT','!TOYBOX_CONTAINER','!GETENFORCE','!LOG']

def processMix(inter):
	sub_inters = inter.split(') & (')
	conj=[]
	disj=[]
	for sinter in sub_inters:
		if ' & ' in sinter:
			conj.extend(sinter.split(' & '))
		elif ' | ' in sinter:
			disj.extend(sinter.split(' | '))
	disjStr = '('+' | '.join([term for term in disj if term not in kconfigConst])+')'
	conjStr = '('+' & '.join([term for term in conj if term not in kconfigConst])+')'
	return disjStr, conjStr

f = open('toybox-infer-exploration.txt','r')
lines = f.read().split('\n')
f.close()
for line in lines:
	if line == '':
		break
	bugs=len(line.split(') ')[-1].split(','))
	inter = line.split(') (')[1:-1]
	if len(inter)>0:
		allOptions=[]
		if 'conj' in line:
			opts = inter[0].split(' & ')
			print ' & '.join([opt for opt in opts if opt not in kconfigConst]), bugs
		elif 'mix' in line:
			conj, disj = processMix(inter[0])
			print (conj + ' & ' + disj), bugs
	elif '***' in line:
		alts = line.split('),(')
		conj1, disj1 = processMix(alts[0].split(') (')[1])
		conj2, disj2 = processMix(alts[0].split(') (')[1])
		print (conj1 + ' & ' + disj1 + '::' + conj2 + ' & ' + disj2), bugs