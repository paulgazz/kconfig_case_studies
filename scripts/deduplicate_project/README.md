# REMARKS

This program and the scripts included with it are used to process the raw data obtained by running bug detectors on configurations of target programs. Since the raw data were huge (461GB), we are unable to provide it for download. We will prepare a virtual machine that will replicate all of our experiments and share it in the future. For now, we provide this program and the results of the postprocessing, including all deduplicated warnings sets, all comparisons we computed between those datasets, the computation of the subset configuration sets that cover all bugs, and the scripts that produce these results.

# DIRECTORY STRUCTURE

deduplicate/ : the source code files for the main program
scripts/ : other helpful scripts for intermediate scripts
results/ : where all of our results are. In the root are the deduplicated files, named with the tool and program combination
results/excel : the excel tables we used
results/comparison : the comparison files
results/comparison/base_minus_sample : the files including bugs that were found by the base cases (min/max/default) but not the sample. Sorted into min/max/default folders.
results/comparison/sample_minus_base : the files including bugs that were found by the sample but not by the base cases. Organized in the same way as above.
results/minimal : the files detailing the the minimal configuration sets we found, including information about each iteration of the algorithm

# SETUP

First, start the python virtual environment (Python 3.7.0 required). This will include all dependencies you need for the program.
Making sure you have pyvenv installed, run:

source ./bin/activate

from the root of the project directory to activate the python virtual environment. Then run

python setup.py build

To build the program.

# CONFIGURING THE PROGRAM

From the root, config/ is the directory that holds the configuration files. These files are in JSON format. Please look at these files for an example of how to write one yourself, as they are very straightfoward.

You also may want to change NUM_CORES in deduplicate/deduplicate_utils.py. This governs how many child processes are created for reading files and for the CPU-heavy configuration list building task.

To run the program, type

python -m deduplicate

from the root. You can pass the --help option to learn more about the command line options that the program takes.

# OTHER SCRIPTS

The scripts/ directory contains the two python scripts that we used to generate the comparisons and the minimal set. Run them with

python <script_name>

Pass --help to either of them for more information about the parameters they take.

Additionally, the sort_json.py script is available to sort a JSON file by filename then by line number. 