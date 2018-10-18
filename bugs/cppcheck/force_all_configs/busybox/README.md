These scripts study how long cppcheck takes to check all ifdefs of busybox.

These scripts assume that busybox has been preprocessed already using
`kconfig_case_studies/scripts/driver.sh preprocess busybox_1_28_0
bugs/configs /mnt/scratch/paul/varbugs/output/busybox_1_28_0/`.  The
latter directory contains all the `.i` and the `.cli` files, the
latter of which contains the necessary command-line to pass to gcc.

Example usage:

    bash gen_script.sh /mnt/scratch/paul/varbugs/src/busybox-1.28.0/ /mnt/scratch/paul/varbugs/output/busybox_1_28_0/ > cppcheck_without_force.sh
    bash gen_script.sh /mnt/scratch/paul/varbugs/src/busybox-1.28.0/ /mnt/scratch/paul/varbugs/output/busybox_1_28_0/ "--force" > cppcheck_with_force.sh

This will generate a script that will run cppcheck on all files of
busybox with the correct flags.

    bash cppcheck_without_force.sh 2>&1 | tee cppcheck_without_force.out
    bash cppcheck_with_force.sh 2>&1 | tee cppcheck_with_force.out
