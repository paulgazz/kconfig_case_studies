# Installation and Usage Instructions

The framework is split into two main programs: ./scripts/run_tools, which runs the analysis tools, and ./scripts/deduplicate_project, which performs the deduplication, formatting, and automatic feature extraction. After following the instructions in the "Environment Setup" section below, go to /vagrant/scripts/run_tools (from inside the virtual machine), and follow the instructions in the README.md included there to run our experiments. We provide configurations both to run all of our experiments and to run a small subset of them.

Once you have generated the raw data, go to /vagrant/scripts/deduplicate_project and follow the instructions in the README.md there to perform all postprocessing steps.

## Expected Outputs

We have included both the full results from our experiments and the expected output from the small sample run we include. These are, respectively, located in ./scripts/deduplicate_project/artifact_results, ./scripts/deduplicate_project/small_runs_result (the result of the toybox_clang.json run should be the same as the relevant parts of the artifact_results results). 

## Environment Setup

Please set your environment to point to the root of the repository, e.g.,

    export KCONFIG_CASE_STUDIES=/home/USER/src/kconfig_case_studies

## VM setup

Install vagrant and virtual box:

    apt install vagrant virtualbox
    
(Note that Debian 9 does not have virtualbox, so [use backports](https://wiki.debian.org/VirtualBox#Debian_9_.22Stretch.22]))

(Note that Ubuntu 16 has a broken version of virtualbox as of
01/24/2018.  It is advised to download the virtualbox 5.1
[not the latest virtualbox, since it doesn't work with the apt version of vagrant],
or download the latest versions of virtualbox and vagrant.)

Start the VM.  This will install dependencies and get source code
automatically.

    vagrant up
    
Enter the VM.

    vagrant ssh

## Updating the VM

When necessary (e.g., `scripts/vm_setup.sh` changes), reprovision the
VM to install any new dependencies by running

    vagrant provision

## Samples

Configuration samples are contained in: `kconfig_case_studies/cases/*/bugs/configs/*.config`

## Comparison with LVAT

Using versions from Berger et al, TSE 2013, as well as some newer
versions that will build on my current system.  In the future, using
VMs will enable building for older versions and on other platforms.
