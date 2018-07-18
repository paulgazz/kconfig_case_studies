import sys
import os
import glob
import natsort  # pip3 install natsort
import re

error_pattern = re.compile("^(\[)(.*)(:)(.*)(\]:.*)$")

for config_dir in natsort.natsorted(glob.iglob('*.config', recursive=False)):
  config_errors = set([])
  sys.stderr.write("processing: %s\n" % (config_dir))
  # for each cppcheck result for a compilation unit
  for root, dirs, files in os.walk(config_dir):
    files = filter(lambda x : x.endswith(".cppcheck"), files)
    for cppcheck_result in files:
      # sys.stderr.write("%s\n" % (cppcheck_result))
      cppcheck_result = os.path.join(root, cppcheck_result)
      cppcheck_resolved = cppcheck_result + ".resolved"
      with open(cppcheck_resolved, 'w') as outfile:
        with open(cppcheck_result) as f:
          for line in f:
            line = line.strip()
            result = error_pattern.match(line)
            if result != None:
              old_file = result.group(2)
              old_line = int(result.group(4))
              ref_file = old_file
              ref_line = 1
              with open(old_file) as g:
                g_i = 0
                for line in g:
                  line = line.strip()
                  g_i += 1
                  ref_line += 1
                  if line.startswith("# "): # a preprocessor output line ref
                    split_line_ref = line.split()
                    # 0 is the hash
                    ref_line = int(split_line_ref[1]) - 1 # substract one b/c the _next_ line in the .i file is the referenced line
                    ref_file = split_line_ref[2][1:-1] # remove quotes
                    # 3 and above are flags not relevant for line resolution
                  if (g_i == old_line):
                    # sys.stderr.write(("translating %s:%s to %s:%s\n" % (old_file, old_line, ref_file, ref_line)))
                    break
              new_error = "%s%s%s%d%s" % (result.group(1), ref_file, result.group(3), ref_line, result.group(5))
              outfile.write("%s\n" % new_error)
