#!/bin/bash

# run cppcheck on all .i files in a given directory, saving the
# cppcheck output to .i.cppcheck files for each one

if [ $# -lt 1 ]; then
    echo "USAGE: $(basename $0) preprocessed_source_dir"
    exit 1
fi

path_to_i_files="${1}"

echo "running cppcheck on all .i files in ${path_to_i_files}"
find "${path_to_i_files}" -type f -name "*.i" | while read i; do
  iout="${i}.cppcheck"
  echo "checking ${i} and writing to ${iout}"
  cppcheck "${i}" > "${iout}" 2>&1
done
