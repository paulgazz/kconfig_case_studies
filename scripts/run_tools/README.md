# Setup

IMPORTANT: Make sure your Python version is 3.7.0 (see the README.md in /home/vagrant)
Refer to the section "Python Dependencies" to install all required dependencies with pip.

Run the following command to setup the script:

`python setup.py build`

Now, you can run the run_tools project as a python module with

`python -m run_tools <config file>`

Some prefabricated configuration files are provided for your use:
- config/runs.json: Does a small (5 config) run of each program/tool combination we performed.
- config/full_runs.json: Does the full experiments (see note on parallelization below)
- config/toybox_clang.json: Runs clang on all 1000 configurations of toybox.

If you'd like to run other experiments, see the README.md in config/ for a description of the structure of the configuration files.

# Running Experiments

Given a configuration file, from the /vagrant/scripts/run_tools directory, run

`python -m run_tools <config_file>`

The config file should be specified relative to the current directory. For example:

`python -m run_tools config/runs.json`

All results will be written to /vagrant/results (note that this is a location on your host machine). The tool is conservative and will not overwrite any results if the parent directory exists (for example, if /vagrant/results/toybox_0_7_5/cppcheck_results exists, even if the directory is empty or has incomplete results, the tool will not write there and will skip a cppcheck on toybox run).

# A Note on Parallelization

These experiments run slowly, which is why we provide smaller sample runs to experiment with (even the small runs.json will take on the order of hours to run). The run_tools project does not currently support automatic parallelization, due to issues stemming from running multiple instances of a tool at once.

The run_tools project is a wrapper for lower-level scripts, which are available in ./.scripts. See ./.scripts/replication.sh for more information on how to run these scripts. We have had success running tools in parallel manually using multiple sessions of GNU screen and the lower-level scripts.

## Python dependencies

Install the following dependencies with pip:

`python -m pip install natsort`