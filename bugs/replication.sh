########################
###### PREPROCESS ######
########################

# Some tools, e.g., cppcheck, require first generating the preprocessed version of each
# configuration.  (Other tools like infer do not require this, instead inserting themselves
# into the build process.)
# These commands will generate a set of preprocessor output files for each configuration.

# compile the gcc shunt program
(cd scripts/; javac GCCShunt.java)

######## axtls #########

# PREPROCESS
cd /path/to/axtls/sourcecode/
/path/to/kconfig_case_studies/scripts/driver.sh preprocess axtls_2_1_4 /path/to/output/axtls_2_1_4

######## toybox ########

# PREPROCESS
cd /path/to/toybox/sourcecode/
# (slow) preprocess each configuration, saving the .i files, and run cppcheck on each configuration,
# saving the output for each configuration to a file called cppcheck_all.txt.
/path/to/kconfig_case_studies/cases/toybox_0_7_5/bugs/scripts/analyzer.sh /path/to/kconfig_case_studies/cases/toybox_0_7_5/Configs/ /path/to/output/toybox_0_7_5
# be sure to edit the variables at the top of the script to point to your local filesystem's paths (/path/to/output/toybox_0_7_5).
# this script uses make_i.sh (also from .../scripts) to do its job


######## fiasco #######

# PREPROCESS
# (slow) preprocess each configuration of busybox for use in bug-finding
cd /path/to/fiasco/src/kernel/fiasco
/path/to/kconfig_case_studies/scripts/driver.sh preprocess fiasco_17_10 build/configs /path/to/output/fiasco_17_10
# Note that this step requires certain system dependencies to be installed to compile
# fiasco, particularly for other architectures.
# The easiest is to use vagrant to do the build/preprocess steps (see kconfig_case_studies/README.md).
# In order to save files outside the VM, map an output dir in the VM to  location
# on the host system by adding a line to the Vagrantfile:
#    config.vm.synced_folder "/mnt/scratch/paul/varbugs/output", "/output"

######## busybox #######

# PREPROCESS
# (slow) preprocess each configuration of busybox for use in bug-finding
cd /path/to/busybox
/path/to/kconfig_case_studies/scripts/driver.sh preprocess busybox_1_28_0 build/configs /path/to/output/busybox_1_28_0

######## linux #######

# PREPROCESS
# (slow) preprocess each configuration of busybox for use in bug-finding
cd /path/to/linux_4_17_6
/path/to/kconfig_case_studies/scripts/driver.sh preprocess linux_4_17_6 randconfigs /path/to/output/linux_4_17_6


########################
####### CPPCHECK #######
########################

# get dependencies
pip3 install natsort # for natural sorting in aggregate_results.py

######## axtls #########

# RUN CPPCHECK
/path/to/kconfig_case_studies/bugs/cppcheck/scripts/run_cppcheck.sh /path/to/output/axtls_2_1_4
cd /path/to/output/axtls_2_1_4
python3 ~/research/repos/kconfig_case_studies/bugs/cppcheck/scripts/resolve_lines.py
python3 ~/research/repos/kconfig_case_studies/bugs/cppcheck/scripts/aggregate_results.py

######## toybox ########

# RUN CPPCHECK
# (slow) run cppcheck on each preprocessed compilation unit (.i files), giving the 
/path/to/kconfig_case_studies/bugs/cppcheck/scripts/run_cppcheck.sh /path/to/output/toybox_0_7_5
# this produces a .cppcheck file for each compilation unit

# AGGREGATE BUG REPORTS
# cd to the path set in analyzer.sh that has one directory per configuration containing the preprocessed
# code and cppcheck output
cd /path/to/output/toybox_0_7_5
# this script resolves the preprocessed line numbers back to the original file, resulting in a file called .i.cppcheck.resolved
# file for each .i.cppcheck file.  it uses node to call resolve_lines.js in the same scripts/ directory.
python3 ~/research/repos/kconfig_case_studies/bugs/cppcheck/scripts/resolve_lines.py
# this script aggregates the bug results from cppcheck into two reports report.json and report_unique.json,
# the latter aggregating the unique bugs found across configurations
python3 ~/research/repos/kconfig_case_studies/bugs/cppcheck/scripts/aggregate_results.py

######## fiasco #######

# RUN CPPCHECK
# (slow) run cppcheck on each preprocessed compilation unit (.i files)
/path/to/kconfig_case_studies/bugs/cppcheck/scripts/run_cppcheck.sh /path/to/output/fiasco_17_10
# the output of cppcheck is in each corresponding .i.cppcheck file

# AGGREGATE
# see toybox for description of these scripts
cd /path/to/output/fiasco_17_10
# aggregate bug results from cppcheck
python3 ~/research/repos/kconfig_case_studies/bugs/cppcheck/scripts/resolve_lines.py  # produce .i.cppcheck.resolved files
python3 ~/research/repos/kconfig_case_studies/bugs/cppcheck/scripts/aggregate_results.py

######## busybox #######

# RUN CPPCHECK
# (slow) run cppcheck on each preprocessed compilation unit (.i files)
/path/to/kconfig_case_studies/bugs/cppcheck/scripts/run_cppcheck.sh /path/to/output/linux_4_17_6
# the output of cppcheck is in each corresponding .i.cppcheck file

# AGGREGATE
# (slow) run cppcheck on each preprocessed compilation unit (.i files)
/path/to/kconfig_case_studies/bugs/cppcheck/scripts/run_cppcheck.sh /path/to/output/busybox_1_28_0
# the output of cppcheck is in each corresponding .i.cppcheck file

# AGGREGATE
# see toybox for description of these scripts
cd /path/to/output/busybox_1_28_0
# aggregate bug results from cppcheck
python3 ~/research/repos/kconfig_case_studies/bugs/cppcheck/scripts/resolve_lines.py  # produce .i.cppcheck.resolved files
python3 ~/research/repos/kconfig_case_studies/bugs/cppcheck/scripts/aggregate_results.py


######## linux #######
cd /path/to/output/linux_4_17_6
# aggregate bug results from cppcheck
python3 ~/research/repos/kconfig_case_studies/bugs/cppcheck/scripts/resolve_lines.py  # produce .i.cppcheck.resolved files
python3 ~/research/repos/kconfig_case_studies/bugs/cppcheck/scripts/aggregate_results.py

###############################################
####### RUNNING OTHER ANALYSIS TOOLS ##########
###############################################

# {program_name} is one of axtls_2_1_4, toybox_0_7_5, busybox_1_28_0, fiasco_17_10, linux_4_17_6
# {program_prefix} is one of axtls, toybox, busybox, fiasco, linux matching {program_name}

######## INFER #######

#### COMPATIBILITY (as of 2018-10-05): axtls, toybox ####

#### RUN ON ALL CONFIGURATIONS ####
cd /path/to/program/sourcecode/

/path/to/kconfig_case_studies/cases/{program_name}/bugs/scripts/driver_variants/driver_infer.sh build {program_prefix}
# output will be in ${results_dir}/${casename}/{program_prefix}_results/

#### RUN ONCE ####
cd /path/to/program/sourcecode/
make clean
make XXXconfig # oldconfig for config/.config, otherwise some default config XXX = {allyes, allno, def, etc.}
infer run -- make
# Results are in ./infer_out

####### SCAN-BUILD-4.0 #######

#### COMPATIBILITY (as of 2018-10-05): axtls, busybox, fiasco, toybox

#### RUN ON ALL CONFIGURATIONS ####
cd /path/to/program/sourcecode

/path/to/kconfig_case_studies/cases/{program_name}/bugs/scripts/driver_variants/driver_clang-4.0.sh build {program_prefix}
# output will be in ${results_dir}/${casename}/{program_prefix}_results/

#### RUN ONCE ####
cd /path/to/program/sourcecode
make clean
make XXXconfig
scan-build-4.0 -o . -plist-html make
# Tool will print the output directory

####### IKOS #######

#### COMPATIBILITY (as of 2018-10-05): axtls, toybox ####

#### RUN ON ALL CONFIGURATIONS ####
cd /path/to/program/sourcecode/

# Sets up the environmental variables needed
. KCONFIG_CASE_STUDIES/bugs/ikos/scrips/ikos_setup.sh

/path/to/kconfig_case_studies/cases/{program_name}/bugs/scripts/driver_variants/driver_ikos.sh build {program_prefix}
# .bc files will be in ${results_dir}/${casename}/{program_prefix}_results/
cd ${results_dir}/${casename}/ikos_results/
python KCONFIG_CASE_STUDIES/bugs/ikos/scripts/process_bc.py
# Will process all bc files and output .json results

#### RUN ONCE ####
cd path/to/program/sourcecode
make clean
make XXXconfig
. KCONFIG_CASE_STUDIES/bugs/ikos/scrips/ikos_setup.sh
make
extract-bc {executable}
ikos --ikos-pp {executable}.bc
ikos-render --export --export-format=xml {executable}.bc > results.xml

####### CBMC #######

#### COMPATIBILITY (as of 2018-10-05): axtls, toybox

#### RUN ON ALL CONFIGURATIONS ####
cd /path/to/program/sourcecode/

# Sets up the environmental variables needed (uses almost the same setup as ikos)
. KCONFIG_CASE_STUDIES/bugs/ikos/scrips/ikos_setup.sh
export CC=goto-cc

/path/to/kconfig_case_studies/cases/{program_name}/bugs/scripts/driver_variants/driver_cbmc.sh build {program_prefix}
# output will be in ${results_dir}/${casename}/{program_prefix}_results/

#### RUN ONCE ####
cd /path/to/program/sourcecode/
. KCONFIG_CASE_STUDIES/bugs/ikos/scrips/ikos_setup.sh
export CC=goto-cc
make clean
make XXXconfig
make
cbmc ${executable} --show-properties --bounds-check --pointer-check --signed-overflow-check --unsigned-overflow-check --nan-check --xml-ui
# This prints the output to the console, use stream redirection to save to a file
