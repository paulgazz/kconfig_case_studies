import sys
import os
import glob
import natsort  # pip3 install natsort
from collections import defaultdict

# aggregate cppcheck results for a set of configurations.

# the following directory structured is assumed:
#   1.config/
#     subdir1/filename1.i.cppcheck.resolved
#     subdir2/subsubdir1/filename2.i.cppcheck.resolved
#     ...
#   2.config/
#   ...
#
# i.e., the state after running run_cppcheck.sh and resolved_lines.sh

outfilename = "report_unique.txt"
if os.path.isfile(outfilename):
  # not atomic, not thread-safe
  sys.stderr.write("refusing to overwrite existing report.\nplease move or delete report file first: %s\n" % (outfilename))
  exit(1)
with open(outfilename, 'w') as outfile:
  # for each configuration directory
  cumulative_errors = set([])
  error_counts = defaultdict(int)
  total_errors = 0
  min_errors = None
  min_error_configs = None
  max_errors = -1
  max_error_configs = []

  def update_min_max(config_errors):
    global min_errors, min_error_configs, max_errors,  max_error_configs 
    len_errors = len(config_errors)
    if min_errors == None:
      min_errors = len_errors
      min_error_configs = [config_dir]
    else:
      if len_errors < min_errors:
        min_errors = len_errors
        min_error_configs = [config_dir]
      elif len_errors == min_errors:
        min_error_configs.append(config_dir)
    if len_errors > max_errors:
      max_errors = len_errors
      max_error_configs = [config_dir]
    elif len_errors == max_errors:
      max_error_configs.append(config_dir)

  for config_dir in natsort.natsorted(glob.iglob('*.config', recursive=False)):
    config_errors = set([])
    sys.stderr.write("processing: %s\n" % (config_dir))
    # for each cppcheck result for a compilation unit
    for root, dirs, files in os.walk(config_dir):
      files = filter(lambda x : x.endswith(".cppcheck.resolved"), files)
      for cppcheck_result in files:
        cppcheck_result = os.path.join(root, cppcheck_result)
        with open(cppcheck_result) as f:
          errors = map(lambda x : x.strip().replace(os.getcwd(), '').replace(config_dir + '/', ''), f.readlines())
          # errors = f.readlines()  # temporary until rerunning cppcheck
          config_errors = config_errors.union(errors)
    sys.stderr.write("unique errors: %d\n" % (len(config_errors)))
    update_min_max(config_errors)
    cumulative_errors = cumulative_errors.union(config_errors)
    for error in config_errors:
      error_counts[error] += 1
    total_errors += len(config_errors)
    sys.stderr.write("unique/total errors: %d/%d\n" % (len(error_counts.keys()), total_errors))
    sys.stderr.write("min/max errors: %d/%d\n" % (min_errors, max_errors))

  outfile.write("unique_errors %d\n" % (len(error_counts.keys())))
  outfile.write("max_per_config: %d\n" % (max_errors))
  outfile.write("min_per_config: %d\n" % (min_errors))
  for error in sorted(error_counts.keys()):
    outfile.write('"%s", %d\n' % (error, error_counts[error]))

  sys.stderr.write("report written to %s\n" % (outfilename))