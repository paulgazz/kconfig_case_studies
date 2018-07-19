#!bin/bash

grep "error:" config_diff_results.out > errors.txt
grep "warning:" config_diff_results.out > warnings.txt
grep "errors" config_diff_results.out > error_count.txt
