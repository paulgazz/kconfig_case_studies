#!/bin/bash

# adapted from david orzoco's class project script (05/2018), which
# was adapted from kconfig_case_studies's driver.sh

# user-selectable paths
scripts_dir="/home/paul/research/repos/varbugs_sampling/scripts/toybox"
casename="toybox_0_7_5"
experiment_dir="/home/paul/research/repos/kconfig_case_studies/cases/${casename}/Configs"
# experiment_dir="/mnt/scratch/paul/varbugs/configs/${casename}"
src_dir="/mnt/scratch/paul/varbugs/src/toybox-0.7.5"
output_dir="/mnt/scratch/paul/varbugs/output/${casename}"

# setup other paths
config_file=".config";
# kconfig_root="Config.in";
# binaries="toybox";
# kconfig_out_dir="${experiment_dir}/kconfig_out"
# mkdir -p "${kconfig_out_dir}"
LIBFILES="$(ls lib/*.c | grep -v lib/help.c)"
TOYFILES="lib/help.c main.c $TOYFILES"

echo "using configs from ${experiment_dir}"
echo "using kconfig_case_studies commit id $(git -C "${experiment_dir}" rev-parse HEAD)"
CONFIG_COUNT=0
for i_base in $(ls ${experiment_dir}/*.config | xargs -L 1 basename | sort -n); do
	cd "${src_dir}"
	i="${experiment_dir}/${i_base}"
	echo "configuring $i";
    echo "${casename}" | grep -i "axtls" > /dev/null
	cat "${i}" | grep -v "SPECIAL_ROOT_VARIABLE" > "${config_file}";
	if [[ $? -eq 0 ]]; then
		mkdir -p /tmp/lua
		echo 'CONFIG_HTTP_LUA_PREFIX="/tmp/lua"' >> "${config_file}";
	fi
	make oldconfig;
	echo "building $i";
	make clean;
  PRE_DIR="${output_dir}/${i_base}"
	export PRE_DIR
  echo $PRE_DIR
	time ${scripts_dir}/make_i.sh
  cd "${PRE_DIR}"
	cppcheck ./*.i 2> err.txt | tee out.txt
	((CONFIG_COUNT++));
done 
