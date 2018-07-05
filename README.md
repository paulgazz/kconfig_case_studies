# Case studies

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

Configuration samples are contained in: `kconfig_case_studies/cases/*/Configs/*.config`

## Evaluation

1. check that `make oldconfig` accepts it
1. compare oldconfig .config and generated config for sameness (modulo comments, empty nonbools)
1. try building (modulo system-specific stuff)

## Comparison with LVAT

Using versions from Berger et al, TSE 2013, as well as some newer
versions that will build on my current system.  In the future, using
VMs will enable building for older versions and on other platforms.
