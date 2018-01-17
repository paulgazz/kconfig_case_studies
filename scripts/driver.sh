#!/bin/bash

if [[ $# -lt 1 ]]; then
    echo "USAGE: $(basename $0) action casename"
    echo ""
    echo "   action may be one of the following"
    echo "     dimacs - generate dimacs file"
    echo "     config - configure the system for each sampled config"
    echo "     build  - build the system for each sampled config"
    echo ""
    echo "    casename - the subdirectory of the case in the kconfig_case_studies repo"
    echo ""
    echo "USAGE: $(basename $0) list"
    echo ""
    echo "  list the active cases"
    echo ""
    echo "NOTES:"
    echo "  - Run this script from root of a project's source directory."
    echo "  - Be sure that KCONFIG_CASE_STUDIES has been set to the repo."
    echo "  - For 'dimacs' be sure that KMAX_ROOT has been set to the kmax repo."
    exit 1
fi

if [[ ! -e "${KCONFIG_CASE_STUDIES}" ]]; then
    echo "please set KCONFIG_CASE_STUDIES in your environment to the path of the repo"
    echo "the repo may be found at https://github.com/paulgazz/kconfig_case_studies"
    exit 1
fi

action="${1}"
casename="${2}"

case_dir="${KCONFIG_CASE_STUDIES}/cases/${casename}"

if [[ ! -e "${case_dir}" ]]; then
    echo "${case_dir} does not exist."
    action="list"
fi

if [[ "${casename}" == "" || "${action}" == "list" ]]; then
    echo "Please choose from the following:"
    ls ${KCONFIG_CASE_STUDIES}/cases/
    exit 1
fi


# setup case-specific properties
config_file=""
kconfig_root=""
echo "${casename}" | grep -i "axtls" > /dev/null
if [[ $? -eq 0 ]]; then
    config_file="config/.config"
    kconfig_root="config/Config.in"
fi
echo "${casename}" | grep -i "toybox" > /dev/null
if [[ $? -eq 0 ]]; then
    config_file=".config"
    kconfig_root="Config.in"
fi
echo "${casename}" | grep -i "fiasco" > /dev/null
if [[ $? -eq 0 ]]; then
    config_file="build/globalconfig.out"
    kconfig_root="build/Kconfig"
fi

if [[ "${config_file}" == "" || "${kconfig_root}" == "" ]]; then
    echo "unknown case '${casename}. please add it to this script '${0}'"
    exit 1
fi

kconfig_out_dir="${case_dir}/kconfig_out"
mkdir -p "${kconfig_out_dir}"
if [[ "${action}" == "config" || "${action}" == "build" ]]; then
    # configure or build each sample
    if [[ "${action}" == "config" ]]; then
        for i in ${case_dir}/Configs/*.config; do
          echo "configuring $i";
          cat $i | grep -v "SPECIAL_ROOT_VARIABLE" > "${config_file}";
          make oldconfig;
          cp "${config_file}" "${kconfig_out_dir}/$(basename ${i})"
          cat "${config_file}" | md5sum > "${kconfig_out_dir}/$(basename ${i}).md5"
          python "${KCONFIG_CASE_STUDIES}/scripts/compare_configs.py" "${case_dir}/${casename}.kmax" "${i}" "${config_file}";
          echo "diff result: ${?}";
        done 2>&1 | tee "${case_dir}/config_diff_results.out"

        cat "${kconfig_out_dir}/"*.md5 | sort | uniq -d > "${case_dir}/uniq_config_comparison.out"

        echo "has $(cat "${case_dir}/uniq_config_comparison.out" | wc -l) duplicate config files" | tee -a "${case_dir}/config_diff_results.out"

    elif [[ "${action}" == "build" ]]; then
        for i in ${case_dir}/Configs/*.config; do
          echo "configuring $i";
          cat $i | grep -v "SPECIAL_ROOT_VARIABLE" > "${config_file}";
          make oldconfig;
          echo "building $i";
          make;
          echo "return code $?";
        done 2>&1 | tee "${case_dir}/build_results.out"
    fi

elif [[ "${action}" == "dimacs" ]]; then
    if [[ ! -e "${KMAX_ROOT}" ]]; then
        echo "please set KMAX_ROOT in your environment to the path of the kmax repo"
        echo "the repo may be found at https://github.com/paulgazz/kmax"
        exit 1
    fi

    # axtls variables already include the the CONFIG_ prefix and it's
    # kconfig system is modified not to.  add a flag to check_dep to
    # disable the prefix for axtls.
    echo "${casename}" | grep -i "axtls" >/dev/null
    if [[ $? -eq 0 ]]; then
        extra_args="-p"
    else
      extra_args=""
    fi

    # get the dimacs file by running kmax's check_dep
    "${KMAX_ROOT}/kconfig/check_dep" ${extra_args} --dimacs "${kconfig_root}" | tee "${case_dir}/${casename}.kmax" | python "${KMAX_ROOT}/kconfig/dimacs.py" > "${case_dir}/${casename}.dimacs"

    # without reverse dependencies
    "${KMAX_ROOT}/kconfig/check_dep" ${extra_args} -D --dimacs "${kconfig_root}" | tee "${case_dir}/${casename}_sans_reverse.kmax" | python "${KMAX_ROOT}/kconfig/dimacs.py" > "${case_dir}/${casename}_sans_reverse.dimacs"
fi
