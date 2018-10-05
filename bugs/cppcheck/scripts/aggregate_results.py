import sys
import os
import glob
import natsort  # pip3 install natsort
from collections import defaultdict
import operator
import pickle

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
  error_counts = defaultdict(set)
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

  config_dirs = natsort.natsorted(glob.iglob('*.config', recursive=False))
  num_processed = 0
  for config_dir in config_dirs:
    num_processed += 1
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
      error_counts[error].add(config_dir)
    total_errors += len(config_errors)
    sys.stderr.write("unique/total errors: %d/%d\n" % (len(error_counts.keys()), total_errors))
    sys.stderr.write("min/max errors: %d/%d\n" % (min_errors, max_errors))
    # if num_processed > 20: break  # used for testing


  pfilename = "error_counts.tmp"
  with open(pfilename, "wb") as f:
    pickle.dump((num_processed, error_counts, total_errors, max_errors, min_errors), f)
  pfilename = "error_counts.tmp"
  with open(pfilename, "rb") as f:
    (num_processed, error_counts, total_errors, max_errors, min_errors) = pickle.load(f)
   
  outfile.write("num_configs %d\n" % (num_processed))
  outfile.write("unique_errors %d\n" % (len(error_counts.keys())))
  outfile.write("total_errors %d\n" % (total_errors))
  outfile.write("max_per_config %d\n" % (max_errors))
  outfile.write("min_per_config %d\n" % (min_errors))
  config_sets = {}
  for error in sorted(error_counts.keys()):
    num_configs = len(error_counts[error])
    if num_configs == num_processed:
      including_configs = "all"
    else:
      config_nums = [ x.split(".")[0] for x in error_counts[error] ]
      config_nums = [ int(x) for x in config_nums ]
      config_set_string = " ".join([ str(x) for x in sorted(config_nums) ])
      if config_set_string in config_sets.keys():
        set_id = config_sets[config_set_string]
      else:
        set_id = len(config_sets.keys())
        config_sets[config_set_string] = set_id
      including_configs = "set%d" % (set_id)
    outfile.write('"%s",%d,%s\n' % (error, num_configs, including_configs))
  for (config_set_string , set_id) in sorted(config_sets.items(), key=operator.itemgetter(1)):
    outfile.write("set%d,%s\n" % (set_id, config_set_string))

  sys.stderr.write("report written to %s\n" % (outfilename))
