# Step-by-Step Overview
1. Setup `python setup.py build`
2. Run the tool with `python -m deduplicate <options>`

*See below for more information*


## Options:
-c/--config: The config file to use (defaults to config/file_locations.json). The config file specifies the locations of the results to deduplicate.
-v: Specify level of verbosity (use more v's for more verbosity)
--cores: Specify the number of cores to use (should not exceed the number of cores of your VM. You can configure this manually through Virtualbox settings on the host machine).
-f/--force: Force the tool to overwrite existing results rather than failing.

# Remarks

This program and the scripts included with it are used to process the raw data obtained by running bug detectors on configurations of target programs. Since the raw data were huge (461GB), we are unable to provide it for download. We instead provide a virtual machine and scripts that can replicate all of our experiments (see ../run_tools).

# Directory Structure

deduplicate/ : the source code files for the main program

scripts/ : other helpful scripts for intermediate scripts

results/ : where the project places results it generates

artifact_results/ : where all of our results are. In the root are the deduplicated files, named with the tool and program combination

artifact_results/excel : the excel tables we used

artifact_results/comparison : the comparison files

artifact_results/comparison/base_minus_sample : the files including bugs that were found by the base cases (min/max/default) but not the sample. Sorted into min/max/default folders.

artifact_results/comparison/sample_minus_base : the files including bugs that were found by the sample but not by the base cases. Organized in the same way as above.

artifact_results/minimal : the files detailing the the minimal configuration sets we found, including information about each iteration of the algorithm

# Configurating the Program

From the root, config/ is the directory that holds the configuration files. These files are in JSON format. Please look at these files for an example of how to write one yourself, as they are very straightfoward.

To run the program, type

python -m deduplicate

from the root. You can pass the --help option to learn more about the command line options that the program takes. Of particular interest will be the --cores option, which will allow you to take advantage of multiple cores on your machine to perform the deduplication task more quickly.

# Output

The project outputs results in the ./results directory. For each tool/target combination, three artifacts are produced:

1. A .json file, which contains the deduplicated warnings in the unified JSON format.
2. A .csv file, which contains the same warnings as the associated .JSON file, but with fewer fields for easier viewing.
3. A hidden .json file, which is created as an intermediate result after reading the raw data so that the raw data doesn't need to be read again if the formatting or post-processing steps change.

# Other Scripts

The scripts/ directory contains the two python scripts that we used to generate the comparisons and the minimal set. Run them with

python <script_name>

Pass --help to either of them for more information about the parameters they take.

Additionally, the sort_json.py script is available to sort a JSON file by filename then by line number. 
