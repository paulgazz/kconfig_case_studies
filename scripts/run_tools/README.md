# Step-by-Step Overview
1. Setup with `python setup.py build`
2. Run with `python -m run_tools <config file>`

## Configuration Files

Some prefabricated configuration files are provided for your use:
- `config/runs.json`: Does a small (5 config) run of each program/tool combination we performed (except for busybox/cbmc, because deduplication of just these results increases the time it takes  to deduplicate the results by many times). Estimated 2 hour runtime.
- `config/full_runs.json`: Does the full experiments (see note on parallelization below). Estimated 16 day runtime.
- `config/toybox_clang.json`: Runs clang on 5 configurations of toybox. Estimated 8 minute runtime.
- `config/toybox_clang_full.json` Runs clang on 1000 configurations of toybox. Estimated 25 hour runtime.

If you'd like to run other experiments, see the [README.md](config/README.md) in [config/](config) for a description of the structure of the configuration files.

# Results

All results will be written to /vagrant/results (note that on a Vagrant VM, /vagrant/ is a link to where the VM exists on the host machine, so /vagrant/results is a folder at the root of your host's clone of the repository). The tool is conservative and will not overwrite any results if the parent directory exists (for example, if /vagrant/results/toybox_0_7_5/cppcheck_results exists, even if the directory is empty or has incomplete results, the tool will not write there and will skip a cppcheck on toybox run).

# A Note on Parallelization

These experiments run slowly, which is why we provide smaller sample runs to experiment with (even the small runs.json takes approximately two hours to run on our machine). The run_tools project does not currently support automatic parallelization, due to issues stemming from running multiple instances of a tool at once.

The run_tools project is a wrapper for lower-level scripts, which are available in ./.scripts. See ./.scripts/replication.sh for more information on how to run these scripts. We have had success running tools in parallel manually using multiple sessions of GNU screen and the lower-level scripts.

# Code Organization

The artifact is split into two main code fragments. The run_tools/__main__.py is a wrapper for the C scripts in [the scripts directory](./.scripts), which interprets command line parameters, verifies correct input, and calls the appropriate script based on the selection.

The scripts in [the scripts directory](./.scripts) handle the actual execution of the analysis programs. Specifications on running the scripts themselves [are included](./.scripts/replication.txt).

The run_tools/__init__.py file is empty, but is necessary to avoid build errors when building the tool.