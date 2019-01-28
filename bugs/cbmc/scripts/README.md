# cbmc scrips

## Setup

Before attempting to run CBMC, make sure you have CBMC installed on your system. Instructions for doing so are at http://www.cprover.org/cprover-manual/installation/.

## run_cbmc.py

This script iteratively runs CBMC over a preprocessed files directory. From the preprocessed directory, simply run `python3 run_cbmc.py` at the root of your preprocessed directory (i.e. in the directory containing directories containing preprocessed files.

After this script is done, use the `deduplicate_bugs.py` script in the bugs/scripts directory to deduplicate bug reports.

## old

This directory contains scripts that are no longer in use.