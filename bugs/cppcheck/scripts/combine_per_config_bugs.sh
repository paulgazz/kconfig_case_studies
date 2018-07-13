for i in *.config; do
  find -name "*.i.cppcheck" | xargs cat | grep "^\[" > ${i}/cppcheck_all.txt;
done
