#!/bin/bash

# Run cppcheck on all .i files in a given directory, saving the
# cppcheck output to .i.cppcheck files for each one.

if [ $# -lt 1 ]; then
    echo "USAGE: $(basename $0) preprocessed_source_dir"
    exit 1
fi

path_to_i_files="${1}"

echo "running cppcheck on all .i files in ${path_to_i_files}"
cd "${path_to_i_files}"
ls -d *.config | sort -h | while read config_dir; do
  cd "${config_dir}"
  # run cppcheck from the root of the config_dir to avoid full path in error reports
  find ./ -type f -name "*.i" | while read i; do
    iout="${i}.cppcheck"
    if [[ -e "${iout}" ]]; then
       echo "skipping existing cppcheck run: ${config_dir}/${iout}"
    else
      echo "checking ${config_dir}/${i} and writing to ${config_dir}/${iout}"
      cppcheck "${i}" > "${iout}.tmp" 2>&1
      mv "${iout}.tmp" "${iout}"
    fi
  done
  cd ../
done
