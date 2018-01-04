#!/bin/bash

if [ $# -lt 3 ]; then
    echo "USAGE: $(basename $0) config|build casename config_file"
    echo ""
    echo "    config|build case subdir in the repo"
    echo "    casename     case subdir in the repo"
    echo "    config_file  relative path to config file in current project"
    echo ""
    echo "NOTES:"
    echo "  - Run this script from root of a project's source directory."
    echo "  - Be sure that KCONFIG_CASE_STUDIES has been set to the repo."
    exit 1
fi

if [[ ! -e "${KCONFIG_CASE_STUDIES}" ]]; then
    echo "please set KCONFIG_CASE_STUDIES in your environment to the path of the repo"
    echo "the repo may be found at https://github.com/paulgazz/kconfig_case_studies/"
    exit 1
fi

action="${1}"
case_dir="${KCONFIG_CASE_STUDIES}/cases/${2}"
config_file="${3}"

if [[ ! -e "${case_dir}" ]]; then
    echo "${case_dir} does not exist."
    echo "Please choose from the following:"
    ls ${KCONFIG_CASE_STUDIES}/cases/
    exit 1
fi

set -x

if [[ "${action}" -eq "config" ]]; then
    for i in ${case_dir}/Configs/*.config; do
      echo "configuring $i";
      cat $i | grep -v "SPECIAL_ROOT_VARIABLE" > "${config_file}";
      make oldconfig;
      "${KCONFIG_CASE_STUDIES}/scripts/compare_configs.sh" "${i}" "${config_file}";
      echo "diff result: ${?}";
    done 2>&1 | tee "${case_dir}/config_diff_results.out"
elif [[ "${action}" -eq "build" ]]; then
    for i in ${case_dir}/Configs/*.config; do
      echo "configuring $i";
      cat $i | grep -v "SPECIAL_ROOT_VARIABLE" > "${config_file}";
      make oldconfig;
      echo "building $i";
      make;
      echo "return code $?";
    done 2>&1 | tee "${case_dir}/build_results.out"
fi
