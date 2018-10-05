# Script to run IKOS analysis against preprocessed .bc files
# Written by Austin Mordahl
# 2018-08-03

# I used chamila's very helpful tutorial on using the python signal module to setup timeouts
#  on functions. As of 2018-08-03 14:09 this was available at
#  http://chamilad.github.io/blog/2015/11/26/timing-out-of-long-running-methods-in-python/
import argparse

target_dir = '.'
logFile = 'process_bc.log'
# Arguments go here

import time
import signal
import subprocess
import os
import logging
from subprocess import CalledProcessError
# Custom exception for timing out of a function.
class TimeoutError(Exception):
    pass

# Function to time out processing.
def timeout_handler(num, stack):
    raise TimeoutError

# Setup timeout_handler as the alarm handler.
signal.signal(signal.SIGALRM, timeout_handler)

# Setup log file
logging.basicConfig(filename=__file__ + '.log', filemode='w', level=logging.INFO)

# Actually do processing of files
for bcFile in os.listdir(target_dir):

    if not bcFile.endswith('.bc'):
        continue
    
    print "Now processing " + bcFile
    signal.alarm(60*30) # Allow 30 minutes for the process to run.
    os.mkdir('results')
    try:
        output = subprocess.check_output(['ikos', '--ikos-pp', bcFile, '-o', './results/' + bcFile + '.db'])
        logging.info(output)
        if os.path.isfile(bcFile + '.db'):
            print "Processing " + bcFile + " succeeded. Result available at " + bcFile + '.db'
        else:
            print "Failed to process " + bcFile + ". Moving on to the next one."
    except TimeoutError as ex:
        logging.error('Processing ' + bcFile + ' timed out.')
        continue
    except CalledProcessError as ex:
        logging.error(('IKOS failed to run on configuration ' + bcFile + ':{0}').format(ex))
    finally:
        signal.alarm(0) # Reset previous alarm
