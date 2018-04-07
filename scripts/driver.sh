#!/bin/bash

if [[ $# -lt 1 ]]; then
    echo "USAGE: $(basename $0) action casename [samples]"
    echo ""
    echo "   action may be one of the following"
    echo "     dimacs - generate dimacs file"
    echo "     config - configure the system for each sampled config"
    echo "     build  - build the system for each sampled config"
    echo ""
    echo "    casename  - the subdirectory of the case in the kconfig_case_studies repo"
    echo "    samples - the subdirectory containing samples, relative to case dir (default: Configs)"
    echo ""
    echo "USAGE: $(basename $0) list"
    echo ""
    echo "  list the active cases"
    echo ""
    echo "USAGE: $(basename $0) randconfigs casename out_dir num"
    echo ""
    echo "  use kconfig's randconfig to generate a set of random .config files for the given case"
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

if [[ $# -ge 3 ]]; then
    sample_dir="${3}"
else
  sample_dir="Configs"
fi

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
binaries=""
get_reverse_dep=""
echo "${casename}" | grep -i "axtls" > /dev/null
if [[ $? -eq 0 ]]; then
    config_file="config/.config"
    kconfig_root="config/Config.in"
    binaries="_stage/"
    get_reverse_dep="true"
fi
echo "${casename}" | grep -i "toybox" > /dev/null
if [[ $? -eq 0 ]]; then
    config_file=".config"
    kconfig_root="Config.in"
    binaries="toybox"
    get_reverse_dep="true"
fi
echo "${casename}" | grep -i "busybox" > /dev/null
if [[ $? -eq 0 ]]; then
    config_file=".config"
    kconfig_root="Config.in"
    binaries="busybox"
    get_reverse_dep="true"
fi
echo "${casename}" | grep -i "fiasco" > /dev/null
if [[ $? -eq 0 ]]; then
    config_file="build/globalconfig.out"
    kconfig_root="build/Kconfig"
    # perhaps just use "*.{o,a}"
    binaries="build/*.o build/*.a"
    # if [[ "${action}" == "build" ]]; then
    #     # looks like boot_image.{x1,x2}
    #     echo "ERROR: please figure out what to use to measure the binary size" >&2
    #     exit 1 
    # fi
    get_reverse_dep="true"
fi
echo "${casename}" | grep -i "uClibc-ng" > /dev/null
if [[ $? -eq 0 ]]; then
    config_file=".config"
    kconfig_root="extra/Configs/Config.in"
    binaries="*"
    get_reverse_dep=""
fi

if [[ "${config_file}" == "" || "${kconfig_root}" == "" ]]; then
    echo "unknown case '${casename}. please add it to this script '${0}'"
    exit 1
fi

experiment_dir=${case_dir}/${sample_dir}

if [[ "${action}" == "randconfigs" ]]; then
    if [[ $# -ge 4 ]]; then
        num="${4}"
        if [ -d "${experiment_dir}" ]; then
            echo "error: the out_dir '${sample_dir}' already exists.  please remove it or give a nonexistent directory"
            exit 1
        fi
        mkdir -p ${experiment_dir}
        for i in $(seq $((num - 1))); do
          make randconfig
          cp "${config_file}" "${experiment_dir}/${i}.config"
        done
        exit 0
    else
      echo "missing arguments for randconfigs"
      exit 1
    fi
fi

if [[ "${action}" == "config" || "${action}" == "build" ]]; then
    kconfig_out_dir="${experiment_dir}/kconfig_out"
    mkdir -p "${kconfig_out_dir}"

    # configure or build each sample
    if [[ ! -e "${experiment_dir}" ]]; then
        echo "${experiment_dir} does not exist."
        exit 1
    fi
    
    if [[ "${action}" == "config" ]]; then
        for i_base in $(ls ${experiment_dir}/*.config | xargs -L 1 basename | sort -n); do
          i="${experiment_dir}/${i_base}"
          echo "configuring $i";
          cat $i | grep -v "SPECIAL_ROOT_VARIABLE" > "${config_file}";
          time make oldconfig;
          cp "${config_file}" "${kconfig_out_dir}/$(basename ${i})"
          cat "${config_file}" | md5sum > "${kconfig_out_dir}/$(basename ${i}).md5"
          python "${KCONFIG_CASE_STUDIES}/scripts/compare_configs.py" "${case_dir}/${casename}_sans_reverse.kmax" "${i}" "${config_file}";
          echo "diff result: ${?}";
        done 2>&1 | tee "${experiment_dir}/config_diff_results.out" | egrep "^(configuring)"

        cat "${kconfig_out_dir}/"*.md5 | sort | uniq -d > "${experiment_dir}/uniq_config_comparison.out"

        echo "has $(cat "${experiment_dir}/uniq_config_comparison.out" | wc -l) duplicate config files" | tee -a "${experiment_dir}/config_diff_results.out"

    elif [[ "${action}" == "build" ]]; then
        for i_base in $(ls ${experiment_dir}/*.config | xargs -L 1 basename | sort -n); do
          i="${experiment_dir}/${i_base}"
          echo "configuring $i";
          cat $i | grep -v "SPECIAL_ROOT_VARIABLE" > "${config_file}";
          echo "${casename}" | grep -i "axtls" > /dev/null
          if [[ $? -eq 0 ]]; then
              mkdir -p /tmp/lua
              echo 'CONFIG_HTTP_LUA_PREFIX="/tmp/lua"' >> "${config_file}";
          fi
          echo "${casename}" | egrep -i "uClibc-ng" >/dev/null
          if [[ $? -eq 0 ]]; then
              mv "${config_file}" "${config_file}.tmp"
              cat "${config_file}.tmp" | grep -v "^KERNEL_HEADERS=" > "${config_file}"; echo 'KERNEL_HEADERS="/home/vagrant/linux-headers/include"' >> "${config_file}"
          fi
          make oldconfig;
          echo "building $i";
          make clean;
          echo "${casename}" | grep -i "axtls" > /dev/null
          if [[ $? -eq 0 ]]; then
              mkdir -p /tmp/local
              time make PREFIX="/tmp/local"
          else
            time make;
          fi
          echo "return code $?";
          echo "binary size (in bytes): $(du -bc ${binaries} | tail -n1 | cut -f1)"
        done 2>&1 | tee "${experiment_dir}/build_results.out" | egrep "^(building)"
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
    extra_args=""
    echo "${casename}" | egrep -i "axtls" >/dev/null
    if [[ $? -eq 0 ]]; then
        extra_args="-p"
    fi
    # don't add extra CONFIG_ prefix for uClibc-ng.  also set default
    # environment variables with -d.
    echo "${casename}" | egrep -i "uClibc-ng" >/dev/null
    if [[ $? -eq 0 ]]; then
        extra_args="-p -d"
    fi

    # without reverse dependencies
    time "${KMAX_ROOT}/kconfig/check_dep" ${extra_args} -D --dimacs "${kconfig_root}" | tee "${case_dir}/${casename}_sans_reverse.kmax" | python "${KMAX_ROOT}/kconfig/dimacs.py" > "${case_dir}/${casename}_sans_reverse.dimacs"

    # get the dimacs file by running kmax's check_dep
    if [[ "${get_reverse_dep}" != "" ]]; then
        time "${KMAX_ROOT}/kconfig/check_dep" ${extra_args} --dimacs "${kconfig_root}" | tee "${case_dir}/${casename}_with_reverse.kmax" | python "${KMAX_ROOT}/kconfig/dimacs.py" > "${case_dir}/${casename}_with_reverse.dimacs"
    fi
else
  echo "invalid action"
  exit 1
fi
