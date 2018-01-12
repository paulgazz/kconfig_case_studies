#!/bin/bash

if [[ $# -lt 3 && $1 != "dimacs" || $# -lt 2 && $1 == "dimacs" ]]; then
    echo "USAGE: $(basename $0) config|build casename config_file"
    echo ""
    echo "  This configures or builds the project for each sampled configuration"
    echo ""
    echo "    config|build case subdir in the repo"
    echo "    casename     case subdir in the repo"
    echo "    config_file  relative path to config file in current project"
    echo ""
    echo "USAGE: $(basename $0) dimacs casename"
    echo ""
    echo "  This collects the dimacs version of the Kconfig constraints"
    echo ""
    echo "    casename     case subdir in the repo"
    echo ""
    echo "NOTES:"
    echo "  - Run this script from root of a project's source directory."
    echo "  - Be sure that KCONFIG_CASE_STUDIES has been set to the repo."
    echo "  - For 'collect' be sure that KMAX_ROOT has been set to the kmax repo."
    exit 1
fi

if [[ ! -e "${KCONFIG_CASE_STUDIES}" ]]; then
    echo "please set KCONFIG_CASE_STUDIES in your environment to the path of the repo"
    echo "the repo may be found at https://github.com/paulgazz/kconfig_case_studies"
    exit 1
fi

action="${1}"
casename="${2}"
config_file="${3}"

case_dir="${KCONFIG_CASE_STUDIES}/cases/${casename}"

if [[ ! -e "${case_dir}" ]]; then
    echo "${case_dir} does not exist."
    echo "Please choose from the following:"
    ls ${KCONFIG_CASE_STUDIES}/cases/
    exit 1
fi

if [[ "${action}" == "config" ]]; then
    for i in ${case_dir}/Configs/*.config; do
      echo "configuring $i";
      cat $i | grep -v "SPECIAL_ROOT_VARIABLE" > "${config_file}";
      make oldconfig;
      "${KCONFIG_CASE_STUDIES}/scripts/compare_configs.sh" "${i}" "${config_file}";
      echo "diff result: ${?}";
    done 2>&1 | tee "${case_dir}/config_diff_results.out"

elif [[ "${action}" == "build" ]]; then
    for i in ${case_dir}/Configs/*.config; do
      echo "configuring $i";
      cat $i | grep -v "SPECIAL_ROOT_VARIABLE" > "${config_file}";
      make oldconfig;
      echo "building $i";
      make;
      echo "return code $?";
    done 2>&1 | tee "${case_dir}/build_results.out"

elif [[ "${action}" == "dimacs" ]]; then
    if [[ ! -e "${KMAX_ROOT}" ]]; then
        echo "please set KMAX_ROOT in your environment to the path of the kmax repo"
        echo "the repo may be found at https://github.com/paulgazz/kmax"
        exit 1
    fi

    # axtls variables already include the the CONFIG_ prefix and it's
    # kconfig system is modified not to.
    echo "${casename}" | grep -i "axtls"
    echo $?
    if [[ $? -eq 0 ]]; then
        extra_args="-p"
    else
      extra_args=""
    fi

    "${KMAX_ROOT}/kconfig/check_dep" ${extra_args} --dimacs config/Config.in | tee "${case_dir}/${casename}.kmax" | python "${KMAX_ROOT}/kconfig/dimacs.py" > "${case_dir}/${casename}.dimacs"

    # without reverse dependencies
    "${KMAX_ROOT}/kconfig/check_dep" ${extra_args} -D --dimacs config/Config.in | tee "${case_dir}/${casename}_sans_reverse.kmax" | python "${KMAX_ROOT}/kconfig/dimacs.py" > "${case_dir}/${casename}_sans_reverse.dimacs"
fi
