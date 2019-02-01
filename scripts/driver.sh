#!/bin/bash

if [[ $# -lt 1 ]]; then
    cat <<EOF
USAGE SCHEMA: $(basename $0) action arg1 arg2 ...

ACTIONS:

list
  list the active cases

dimacs casename
  generate the dimacs file for the case

    casename  - the subdirectory of the case in the kconfig_case_studies repo

(config|build) casename samples
  config     - configure the system for each sampled config
  build      - build the system for each sampled config

    casename  - the subdirectory of the case in the kconfig_case_studies repo
    samples   - the subdirectory containing samples, relative to case dir (default: Configs)

preprocess casename samples outdir
  preprocess each config.  due to generated headers, must also build.

    casename   - as usual
    samples    - as usual
    outdir     - the path to store the preprocessed files (won't fit in github repo)

randconfigs casename out_dir num
  use kconfig's randconfig to generate a set of random .config files for the given case

NOTES:
  - Run this script from directory in which the project's root Makefile is located.
  - Be sure that KCONFIG_CASE_STUDIES has been set to the repo.
  - For 'dimacs' be sure that KMAX_ROOT has been set to the kmax repo.
EOF
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
    echo $(ls ${KCONFIG_CASE_STUDIES}/cases/ | grep -v README.md)
    exit 1
fi

if [[ $# -ge 3 ]]; then
    sample_dir="${3}"
else
  sample_dir="Configs"
fi  

if [[ "${action}" == "build" || "${action}" == "config" || "${action}" == "preprocess" ]]; then
    if [[ $# -lt 3 ]]; then
      echo "please specify the subdirectory (relative to casedir) containing the samples"
      exit 1
    fi
fi
if [[ "${action}" == "preprocess" ]]; then
    if [[ $# -ge 4 ]]; then
        preprocessed_outdir="${4}"
    else
      echo "please specify outdir to store preprocessed files"
      exit 1
    fi
fi
# setup case-specific properties
config_file=""
kconfig_root=""
binaries=""
check_dep_extra_args=""
dimacs_extra_args="-d"
make_extra_args=""
# dimacs_extra_args="--remove-bad-selects" # allow bad selects, since fiasco using them intentionally
echo "${casename}" | grep -i "axtls" > /dev/null
if [[ $? -eq 0 ]]; then
    config_file="config/.config"
    kconfig_root="config/Config.in"
    binaries="_stage/"
    # axtls variables already include the the CONFIG_ prefix and it's
    # kconfig system is modified not to.  add a flag to check_dep to
    # disable the prefix for axtls.
    check_dep_extra_args="-p"
fi
echo "${casename}" | grep -i "toybox" > /dev/null
if [[ $? -eq 0 ]]; then
    config_file=".config"
    kconfig_root="Config.in"
    binaries="toybox"
fi
echo "${casename}" | grep -i "busybox" > /dev/null
if [[ $? -eq 0 ]]; then
    config_file=".config"
    kconfig_root="Config.in"
    binaries="busybox"
fi
echo "${casename}" | grep -i "fiasco" > /dev/null
if [[ $? -eq 0 ]]; then
    config_file="build/globalconfig.out"
    kconfig_root="build/Kconfig"
    # perhaps just use "*.{o,a}"
    binaries="build"
    # if [[ "${action}" == "build" ]]; then
    #     # looks like boot_image.{x1,x2}
    #     echo "ERROR: please figure out what to use to measure the binary size" >&2
    #     exit 1 
    # fi
fi
echo "${casename}" | grep -i "uClibc-ng" > /dev/null
if [[ $? -eq 0 ]]; then
    config_file=".config"
    kconfig_root="extra/Configs/Config.in"
    binaries="lib/*.a" # no need for lib/*.so without HAVE_SHARED
    # don't add extra CONFIG_ prefix for uClibc-ng.  also set default
    # environment variables with -d.
    check_dep_extra_args="-p -d"
fi
echo "${casename}" | grep -i "buildroot" > /dev/null
if [[ $? -eq 0 ]]; then
    config_file=".config"
    kconfig_root="Config.in"
    binaries="*"  # TODO: set binaries
    # don't add CONFIG_ prefix, already uses BR2 itself.  must set a build path.
    check_dep_extra_args="-e BUILD_DIR=."
    touch .br2-external.in  # this file is necessary in order to process the Config.in
fi
echo "${casename}" | grep -i "linux" > /dev/null
if [[ $? -eq 0 ]]; then
    config_file=".config"
    kconfig_root="Kconfig"
    binaries="arch/x86/boot/bzImage"  # TODO: set binaries
    check_dep_extra_args="-e SRCARCH=x86"  # run on x86 version of Linux
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
        done | tee ${experiment_dir}/seeds
        exit 0
    else
      echo "missing arguments for randconfigs"
      exit 1
    fi
fi

if [[ "${action}" == "config" || "${action}" == "build" || "${action}" == "preprocess" ]]; then
    if [[ ! -d ${experiment_dir} ]]; then
        echo "the samples directory does not exist or is not a directory"
        exit 1
    fi
    
    kconfig_out_dir="${experiment_dir}/kconfig_out"
    mkdir -p "${kconfig_out_dir}"
    build_out_dir="${experiment_dir}/build_out"
    mkdir -p "${build_out_dir}"
    preprocess_out_dir="${experiment_dir}/preprocess_out"
    mkdir -p "${preprocess_out_dir}"

    # configure or build each sample
    if [[ ! -e "${experiment_dir}" ]]; then
        echo "${experiment_dir} does not exist."
        exit 1
    fi
    
    if [[ "${action}" == "config" ]]; then
        for i_base in $(ls ${experiment_dir}/*.config | xargs -L 1 basename | sort -n); do
          i="${experiment_dir}/${i_base}"
          echo "configuring $i";
          date;
          cat $i | grep -v "SPECIAL_ROOT_VARIABLE" > "${config_file}";
          time make oldconfig;
          cp "${config_file}" "${kconfig_out_dir}/$(basename ${i})"
          cat "${config_file}" | md5sum > "${kconfig_out_dir}/$(basename ${i}).md5"
          python "${KCONFIG_CASE_STUDIES}/scripts/compare_configs.py" "${case_dir}/kconfig.kmax" "${i}" "${config_file}";
          echo "diff result: ${?}";
        done 2>&1 | tee "${experiment_dir}/config_diff_results.out" | egrep "^(configuring)"

        cat "${kconfig_out_dir}/"*.md5 | sort | uniq -d > "${experiment_dir}/uniq_config_comparison.out"

        echo "has $(cat "${experiment_dir}/uniq_config_comparison.out" | wc -l) duplicate config files" | tee -a "${experiment_dir}/config_diff_results.out"

    elif [[ "${action}" == "build" || "${action}" == "preprocess" ]]; then
        for i_base in $(ls ${experiment_dir}/*.config | xargs -L 1 basename | sort -n); do
          i="${experiment_dir}/${i_base}"
          build_out_file="${build_out_dir}/$(basename ${i}).out"
          preprocess_out_file="${preprocess_out_dir}/$(basename ${i}).preprocess.out"
          preprocess_build_out_file="${preprocess_out_dir}/$(basename ${i}).build.out"

          if [[ "${action}" == "build" ]]; then
              save_file="${build_out_file}"
          elif [[ "${action}" == "preprocess" ]]; then
              save_file="${preprocess_build_out_file}"
          else
            print "unknown action for compilation"
            exit 1
          fi

          if [[ "${action}" == "build" && (-e "${save_file}" || -e "${save_file}.bz2") ]]; then
              echo "skipping existing build: ${save_file}"
          elif [[ "${action}" == "preprocess" && (-e "${save_file}" || -e "${save_file}.bz2") && (-e "${preprocess_out_file}" || -e "${preprocess_out_file}.bz2") ]]; then
              echo "skipping existing preprocess: ${preprocess_out_file}"
          else
            for dummy in $(seq 1 1); do  # single-iteration loop to make saving output easier
              echo "${casename}" | grep -i "linux" > /dev/null
              if [[ $? -eq 0 ]]; then
                  # complete cleanup for linux
                  make mrproper
              fi
              echo "${casename}" | egrep -i "uClibc-ng" >/dev/null
              if [[ $? -eq 0 ]]; then
                  # complete cleanup for uClib-ng
                  make realclean
                  make distclean
              fi
              
              echo "configuring $i";
              date;
              cat $i | grep -v "SPECIAL_ROOT_VARIABLE" > "${config_file}";

              # case-specific build scripts
              echo "${casename}" | grep -i "axtls" > /dev/null
              if [[ $? -eq 0 ]]; then
                  mkdir -p /tmp/lua
                  echo 'CONFIG_HTTP_LUA_PREFIX="/tmp/lua"' >> "${config_file}";
              fi
              echo "${casename}" | egrep -i "uClibc-ng" >/dev/null
              if [[ $? -eq 0 ]]; then
                  mv "${config_file}" "${config_file}.tmp"
                  cat "${config_file}.tmp" | grep -v "^KERNEL_HEADERS=" > "${config_file}"; echo 'KERNEL_HEADERS="/home/vagrant/linux-headers/include"' >> "${config_file}"
                  # # temporarily until constraint is set
                  # mv "${config_file}" "${config_file}.tmp"
                  # cat "${config_file}.tmp" | grep -v "^HAVE_SHARED=y" > "${config_file}"; echo '# HAVE_SHARED is not set' >> "${config_file}"
              fi

              time make oldconfig;

              if [[ "${action}" == "preprocess" ]]; then
                  # emit entire gcc commands
                  echo "${casename}" | egrep -i "fiasco" >/dev/null
                  if [[ $? -eq 0 ]]; then
                      # fiasco's flag for verbose mode
                      preprocess_args_opt="V=1"
                  else
                    echo "${casename}" | egrep -i "axtls" >/dev/null
                    if [[ $? -eq 0 ]]; then
                        # axtls already prints out the commands, but
                        # use gcc, because preprocess_configs_make.py
                        # already matches it.
                        preprocess_args_opt="CC=gcc"
                    else
                      echo "${casename}" | egrep -i "toybox" >/dev/null
                      if [[ $? -eq 0 ]]; then
                          # fiasco's flag for verbose mode
                          preprocess_args_opt="V=1 CC=gcc"
                      else
                        # kbuild-based build system flag for verbose mode
                        preprocess_args_opt="KBUILD_VERBOSE=1"
                      fi
                    fi
                  fi
              else
                preprocess_args_opt=""
              fi

              echo "building $i";
              echo "${casename}" | egrep -i "fiasco" >/dev/null
              if [[ $? -eq 0 ]]; then
                  make -C build/ clean
                  # make -C build/ cleanall
              fi
              make clean;
              echo "${casename}" | grep -i "axtls" > /dev/null
              if [[ $? -eq 0 ]]; then
                  mkdir -p /tmp/local
                  time make ${preprocess_args_opt} ${make_extra_args} PREFIX="/tmp/local"
              else
                time make ${preprocess_args_opt} ${make_extra_args};
              fi
              echo "return code $?";
              echo "binary size (in bytes): $(du -bc ${binaries} | tail -n1 | cut -f1)"
            done 2>&1 | tee "${save_file}.tmp" | egrep "^(building)"
            mv ${save_file}.tmp ${save_file}
            bzip2 -f "${save_file}"

            if [[ "${action}" == "preprocess" ]]; then
                echo "preprocessing $i"
                bunzip2 -f "${save_file}.bz2"
                echo "${casename}" | egrep -i "fiasco|axtls|toybox" >/dev/null
                if [[ $? -eq 0 ]]; then
                    preprocess_script="preprocess_config_make.py"
                else
                  preprocess_script="preprocess_config.py"
                fi
                python "${KCONFIG_CASE_STUDIES}/scripts/${preprocess_script}" "${save_file}" "${preprocessed_outdir}/${i_base}" > "${preprocess_out_file}.tmp" 2>&1
                bzip2 "${save_file}"
                mv ${preprocess_out_file}.tmp ${preprocess_out_file}
                bzip2 -f "${preprocess_out_file}"
            fi
          fi
        done

        if [[ "${action}" == "build" ]]; then
            echo "generating build summaries (this may take a couple minutes)"
            binary_sizes="${experiment_dir}/binary_sizes.txt"
            for i_base in $(ls ${experiment_dir}/*.config | xargs -L 1 basename | sort -n); do
              i="${experiment_dir}/${i_base}"
              build_out_file="${build_out_dir}/$(basename ${i}).out"
              bzcat "${build_out_file}.bz2" | egrep "binary size"
            done > "${binary_sizes}"
            return_codes="${experiment_dir}/return_codes.txt"
            for i_base in $(ls ${experiment_dir}/*.config | xargs -L 1 basename | sort -n); do
              i="${experiment_dir}/${i_base}"
              build_out_file="${build_out_dir}/$(basename ${i}).out"
              bzcat "${build_out_file}.bz2" | egrep "return code"
            done > "${return_codes}"
            build_times="${experiment_dir}/build_times.txt"
            for i_base in $(ls ${experiment_dir}/*.config | xargs -L 1 basename | sort -n); do
              i="${experiment_dir}/${i_base}"
              build_out_file="${build_out_dir}/$(basename ${i}).out"
              bzcat "${build_out_file}.bz2" | egrep "^real[[:space:]]" | tail -n1
            done > "${build_times}"
        fi
    fi

elif [[ "${action}" == "dimacs" ]]; then
    if [[ ! -e "${KMAX_ROOT}" ]]; then
        echo "please set KMAX_ROOT in your environment to the path of the kmax repo"
        echo "the repo may be found at https://github.com/paulgazz/kmax"
        exit 1
    fi

    # extract kconfig constraints to kmax intermediate format
    "${KMAX_ROOT}/kconfig/check_dep" ${check_dep_extra_args} --dimacs "${kconfig_root}" | tee "${case_dir}/kconfig.kmax"

    # complete
    # time cat "${case_dir}/kconfig.kmax" | python "${KMAX_ROOT}/kconfig/dimacs.py" --remove-bad-selects --include-nonvisible-bool-defaults --remove-orphaned-nonvisibles --remove-independent-nonvisibles > "${case_dir}/kconfig.dimacs"
    # time cat "${case_dir}/kconfig.kmax" | python "${KMAX_ROOT}/kconfig/dimacs.py" --remove-bad-selects --include-nonvisible-bool-defaults --remove-orphaned-nonvisibles > "${case_dir}/kconfig.dimacs"
    time cat "${case_dir}/kconfig.kmax" | python "${KMAX_ROOT}/kconfig/dimacs.py" ${dimacs_extra_args} --include-nonvisible-bool-defaults --remove-orphaned-nonvisibles > "${case_dir}/kconfig.dimacs"
    time cat "${case_dir}/kconfig.kmax" | python "${KMAX_ROOT}/kconfig/dimacs.py" ${dimacs_extra_args} --include-nonvisible-bool-defaults --remove-orphaned-nonvisibles --comment-format-v2 > "${case_dir}/kconfig.dimacs_v2"
    
    # # without reverse dependencies
    # time cat "${case_dir}/kconfig.kmax" | python "${KMAX_ROOT}/kconfig/dimacs.py" --remove-reverse-dependencies --remove-all-nonvisibles > "${case_dir}/sans_reverse_sans_nonselectable.dimacs"
    # time cat "${case_dir}/kconfig.kmax" | python "${KMAX_ROOT}/kconfig/dimacs.py" --remove-reverse-dependencies > "${case_dir}/sans_reverse_with_nonselectable.dimacs"
else
  echo "invalid action"
  exit 1
fi
