# Case studies

## evaluation

1. check that `make oldconfig` accepts it
1. compare oldconfig .config and generated config for sameness (modulo comments, empty nonbools)
1. try building (modulo system-specific stuff

## Comparison with LVAT

Using versions from Berger et al, TSE 2013, as well as some newer
versions that will build on my current system.  In the future, using
VMs will enable building for older versions and on other platforms.

## axtls

Tried on two versions 1.2.7 and 2.4.1, and all sampled configurations configure properly.

This creates the dimacs constraint file for feature model.

    check_dep --dimacs config/Config.in | tee axtls_2_1_4.kmax | python ~/research/repos/kmax/kconfig/dimacs.py > axtls_2_1_4.dimacs

This checks the contraints for all generated sample configurations (contained in `generated_configs`).

    for i in generated_configs/*.config; do echo "configuring $i"; cat $i | grep -v "SPECIAL_ROOT_VARIABLE" > config/.config; make oldconfig; done > generated_configs/config_results.out 2>&1
    
This checks constraints for all generated samples and ensures they are the 

    for i in generated_configs/*.config; do echo "configuring $i"; cat $i | grep -v "SPECIAL_ROOT_VARIABLE" > config/.config; make oldconfig; /home/paul/research/repos/kmax/scripts/compare_configs.sh "${i}" config/.config; echo "diff result: ${?}"; done > generated_configs/config_diff_results.out 2>&1

This builds all configurations

    for i in generated_configs/*.config; do echo "configuring $i"; cat $i | grep -v "SPECIAL_ROOT_VARIABLE" > config/.config; make oldconfig; echo "building $i"; make; echo "return code $?"; done > generated_configs/build_results.out 2>&1

This builds only linux configurations

    for i in generated_configs/*.config; do grep "CONFIG_PLATFORM_LINUX=y" $i; if [ $? -eq 0 ]; then echo "configuring $i"; cat $i | grep -v "SPECIAL_ROOT_VARIABLE" > config/.config; make oldconfig; echo "building $i"; make; echo "return code $?"; fi done > generated_configs/build_results.out 2>&1

Older versions (1.2.7) don't build

Trying 2.4.1.  It required me to install the following extra libraries
to build it with `allyesconfig`:

    libreadline-dev
    


## busybox

Trying on 1.18.0

    git clone https://git.busybox.net/busybox
    git checkout 1_18_0

The Config.src files need to be preprocessed.  Use
`scripts/gen_build_files.sh` or run

    make allyesconfig
    
Get the dimacs file with

    check_dep --dimacs Config.in | tee busybox_1_18_0.kmax | python ~/research/repos/kmax/kconfig/dimacs.py > busybox_1_18_0.dimacs

apt-get install libselinux1-dev libsepol1-dev


## toybox

Trying on 0.7.5

Needs a generated config file, `generated/Config.probed`

    scripts/genconfig.sh
    
I don't know how platform-specific the generated configs are.

This collects the contraints

    check_dep --dimacs Config.in | tee ~/research/repos/kconfig_case_studies/cases/toybox_0_7_5/toybox_0_7_5.kmax | python ~/research/repos/kmax/kconfig/dimacs.py > ~/research/repos/kconfig_case_studies/cases/toybox_0_7_5/toybox_0_7_5.dimacs


## fiasco

https://os.inf.tu-dresden.de/download/snapshots/

Need to call `tool/gen_kconfig`

    tool/gen_kconfig src/Kconfig my_kconfig $(find src/ | grep Kconfig | grep -v src/Kconfig)

Collect constraints

    check_dep --dimacs build/Kconfig | tee fiasco_17_10.kmax | python ~/research/repos/kmax/kconfig/dimacs.py > fiasco_17_10.dimacs
