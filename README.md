# Case studies

## Environment Setup

Please set your environment to point to the root of the repository, e.g.,

    export KCONFIG_CASE_STUDIES=/home/USER/src/kconfig_case_studies

## VM setup

Install vagrant and virtual box:

    apt install vagrant virtualbox
    
(Note that Debian 9 does not have virtualbox, so [use backports](https://wiki.debian.org/VirtualBox#Debian_9_.22Stretch.22]))

Start the VM.  This will install dependencies and get source code
automatically.

    vagrant up
    
Enter the VM.

    vagrant ssh

## Evaluation

1. check that `make oldconfig` accepts it
1. compare oldconfig .config and generated config for sameness (modulo comments, empty nonbools)
1. try building (modulo system-specific stuff)

## Comparison with LVAT

Using versions from Berger et al, TSE 2013, as well as some newer
versions that will build on my current system.  In the future, using
VMs will enable building for older versions and on other platforms.

## axtls

Tried on two versions 1.2.7 and 2.1.4, and all sampled configurations configure properly.

This creates the dimacs constraint file for feature model.

    check_dep --dimacs -p config/Config.in | tee ~/research/repos/kconfig_case_studies/cases/axtls_2_1_4/axtls_2_1_4.kmax | python ~/research/repos/kmax/kconfig/dimacs.py > ~/research/repos/kconfig_case_studies/cases/axtls_2_1_4/axtls_2_1_4.dimacs

This checks the contraints for all generated sample configurations (contained in `generated_configs`).

    for i in generated_configs/*.config; do echo "configuring $i"; cat $i | grep -v "SPECIAL_ROOT_VARIABLE" > config/.config; make oldconfig; done > generated_configs/config_results.out 2>&1
    
This checks constraints for all generated samples and ensures they are the same.

    for i in generated_configs/*.config; do echo "configuring $i"; cat $i | grep -v "SPECIAL_ROOT_VARIABLE" > config/.config; make oldconfig; /home/paul/research/repos/kmax/scripts/compare_configs.sh "${i}" config/.config; echo "diff result: ${?}"; done > generated_configs/config_diff_results.out 2>&1

This builds all configurations

    for i in generated_configs/*.config; do echo "configuring $i"; cat $i | grep -v "SPECIAL_ROOT_VARIABLE" > config/.config; make oldconfig; echo "building $i"; make; echo "return code $?"; done > generated_configs/build_results.out 2>&1

This builds only linux configurations

    for i in generated_configs/*.config; do grep "CONFIG_PLATFORM_LINUX=y" $i; if [ $? -eq 0 ]; then echo "configuring $i"; cat $i | grep -v "SPECIAL_ROOT_VARIABLE" > config/.config; make oldconfig; echo "building $i"; make; echo "return code $?"; fi done > generated_configs/build_results.out 2>&1

Older versions (1.2.7) don't build

Trying 2.1.4.  It required me to install the following extra libraries
to build it with `allyesconfig`:

    libreadline-dev
    
### System-specific changes

Forcing linux on (to avoid having to build on windows and cygwin platforms)

nTurning off language extensions (because of a variability bug)
    
### Kconfig semantics differences

- axtls seems to disable the automatic CONFIG_ prefix and instead it
is in the name of the variables in the Kconfig files.
- Non-booleans seem to be always included in the `.config` file even
  when the dependencies for them are not met.

### Building
    
    apt-get install libselinux1-dev libsepol1-dev

For building, we constrain are samples to PLATFORM_LINUX, since
cross-compiling for other systems is difficult.  We also constrain
language bindings, since there is a bug with that configuration
variable, as well as lua, since we lack system support.

## busybox

    
Trying on 1.28.0

    git clone https://git.busybox.net/busybox
    git checkout 1_28_0

The Config.src files need to be preprocessed.  Use
`scripts/gen_build_files.sh` or run

    make allyesconfig
    
Get the dimacs file with

    check_dep --dimacs Config.in | tee ~/research/repos/kconfig_case_studies/cases/busybox_1_28_0/busybox_1_28_0.kmax | python ~/research/repos/kmax/kconfig/dimacs.py > ~/research/repos/kconfig_case_studies/cases/busybox_1_28_0/busybox_1_28_0.dimacs

### Building

    apt-get install libpam0g-dev

## toybox

Trying on 0.7.5

Needs a generated config file, `generated/Config.probed`

    scripts/genconfig.sh
    
I don't know how platform-specific the generated configs are.

This collects the contraints

    check_dep --dimacs Config.in | tee ~/research/repos/kconfig_case_studies/cases/toybox_0_7_5/toybox_0_7_5.kmax | python ~/research/repos/kmax/kconfig/dimacs.py > ~/research/repos/kconfig_case_studies/cases/toybox_0_7_5/toybox_0_7_5.dimacs

Comparing 0.0.9.2

    check_dep --dimacs Config.in | tee ~/research/repos/kconfig_case_studies/cases/toybox_0_0_9_2/toybox_0_0_9_2.kmax | python ~/research/repos/kmax/kconfig/dimacs.py > ~/research/repos/kconfig_case_studies/cases/toybox_0_0_9_2/toybox_0_0_9_2.dimacs


## fiasco

https://os.inf.tu-dresden.de/download/snapshots/

Need to call `tool/gen_kconfig`

    tool/gen_kconfig src/Kconfig my_kconfig $(find src/ | grep Kconfig | grep -v src/Kconfig)

Collect constraints

    check_dep --dimacs build/Kconfig | tee  ~/research/repos/kconfig_case_studies/cases/fiasco_17_10/fiasco_17_10.kmax | python ~/research/repos/kmax/kconfig/dimacs.py >  ~/research/repos/kconfig_case_studies/cases/fiasco_17_10/fiasco_17_10.dimacs

### Building

For building, we constrain are samples to IA32, since cross-compiling
for other systems is difficult.
