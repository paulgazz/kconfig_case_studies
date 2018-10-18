These scripts study how long cppcheck takes to check all ifdefs of axtls.

These scripts assume that axtls has been preprocessed already using
`kconfig_case_studies/scripts/driver.sh preprocess axtls_2_1_4
bugs/configs /mnt/scratch/paul/varbugs/output/axtls_2_1_4/`.  The
latter directory contains all the `.i` and the `.cli` files, the
latter of which contains the necessary command-line to pass to gcc.

Example usage:

    bash gen_script.sh /mnt/scratch/paul/varbugs/src/axtls-code/ /mnt/scratch/paul/varbugs/output/axtls_2_1_4/ > cppcheck_without_force.sh
    bash gen_script.sh /mnt/scratch/paul/varbugs/src/axtls-code/ /mnt/scratch/paul/varbugs/output/axtls_2_1_4/ "--force" > cppcheck_with_force.sh

This will generate a script that will run cppcheck on all files of
axtls with the correct flags.

    bash cppcheck_without_force.sh 2>&1 | tee cppcheck_without_force.out
    bash cppcheck_with_force.sh 2>&1 | tee cppcheck_with_force.out
