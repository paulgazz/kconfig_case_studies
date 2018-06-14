#!/bin/bash

# adapted from david orzoco's class project script (05/2018), which
# was adapted from kconfig_case_studies's driver.sh

set -x

# SET YOUR LOCAL PATH HERE
varbugs="/mnt/scratch/paul/varbugs"

# setup paths
casename="toybox_0_7_5"
i_dir="${varbugs}/output/${casename}"
results_dir="${varbugs}/results/${casename}"
mkdir -p "${results_dir}"

for config_name in $(ls -d ${i_dir}/*.config | xargs -L 1 basename | sort -n); do
  config_i_src="${i_dir}/${config_name}"
  cd "${config_i_src}"
  config_results_out="${results_dir}/${config_name}.out"
  echo "processing ${config_name} to ${config_results_out}"
	cppcheck ./*.i 2>&1 | tee "${config_results_out}"
done 
