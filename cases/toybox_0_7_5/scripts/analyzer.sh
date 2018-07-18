#!/bin/bash

# adapted from david orzoco's class project script (05/2018), which
# was adapted from kconfig_case_studies's driver.sh

if [ $# -lt 2 ]; then
    echo "USAGE: $(basename ${0}) /path/to/configs /path/to/output"
    echo "NOTE: run from the toybox source code directory"
    exit 1
fi

configs_dir="${1}"
output_dir="${2}"

if [[ ! -e "${configs_dir}" ]]; then
    echo "configuration direction does not exist: ${configs_dir}"
    exit 1
fi

mkdir -p "${output_dir}"

scripts_dir="$(dirname ${0})"
src_dir="$(pwd)"  # assume we are in the toybox source directory

# setup other paths
config_file=".config";
# kconfig_root="Config.in";
# binaries="toybox";
# mkdir -p "${kconfig_out_dir}"
LIBFILES="$(ls lib/*.c | grep -v lib/help.c)"
TOYFILES="lib/help.c main.c $TOYFILES"

echo "using configs from ${configs_dir}"
echo "using kconfig_case_studies commit id $(git -C "${configs_dir}" rev-parse HEAD)"
CONFIG_COUNT=0
for i_base in $(ls ${configs_dir}/*.config | xargs -L 1 basename | sort -n); do
	cd "${src_dir}"
	i="${configs_dir}/${i_base}"
	echo "configuring $i";
	cat "${i}" | grep -v "SPECIAL_ROOT_VARIABLE" > "${config_file}";
	make oldconfig;
	echo "building $i";
	make clean;
  PRE_DIR="${output_dir}/${i_base}"
	export PRE_DIR
  echo $PRE_DIR
	time bash ${scripts_dir}/make_i.sh
  cd "${PRE_DIR}"
	# cppcheck ./*.i 2> cppcheck_all.txt | tee out.txt  # now done by bugs/cppcheck/scripts/run_cppcheck.sh
	((CONFIG_COUNT++));
done 
