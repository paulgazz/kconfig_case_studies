# This program takes the results of run_cppcheck.sh and collects them
# into a single file per configurationcalled cppcheck_all.txt.

for i in *.config; do
  find -name "*.i.cppcheck" | xargs cat | grep "^\[" > ${i}/cppcheck_all.txt;
done
