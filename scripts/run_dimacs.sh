#!/bin/bash

(cd ${HOME}/src/axtls-code && ${HOME}/research/repos/kconfig_case_studies/scripts/driver.sh dimacs axtls_2_1_4)
(cd ${HOME}/src/toybox && ${HOME}/research/repos/kconfig_case_studies/scripts/driver.sh dimacs toybox_0_7_5)
# (cd ${HOME}/src/toybox-0.7.5 && ${HOME}/research/repos/kconfig_case_studies/scripts/driver.sh dimacs toybox_0_7_5)
(cd ${HOME}/src/fiasco-17.10/src/kernel/fiasco && ${HOME}/research/repos/kconfig_case_studies/scripts/driver.sh dimacs fiasco_17_10)
(cd ${HOME}/src/busybox && ${HOME}/research/repos/kconfig_case_studies/scripts/driver.sh dimacs busybox_1_28_0)
# (cd ${HOME}/src/busybox-1.28.0 && ${HOME}/research/repos/kconfig_case_studies/scripts/driver.sh dimacs busybox_1_28_0)
(cd ${HOME}/src/uClibc-ng-1.0.29 && ${HOME}/research/repos/kconfig_case_studies/scripts/driver.sh dimacs uClibc-ng_1_0_29)
(cd ${HOME}/src/buildroot-2018.02 && ${HOME}/research/repos/kconfig_case_studies/scripts/driver.sh dimacs buildroot_2018_02)

# for case in axtls_2_1_4 toybox_0_7_5 busybox_1_28_0 fiasco_17_10 uClibc-ng_1_0_29; do
#       (cd /home/vagrant/${case} && /vagrant/scripts/driver.sh dimacs ${case})
#     done
