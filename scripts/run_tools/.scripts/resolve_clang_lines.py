#!/usr/bin/python3

import sys
import os
import glob
import natsort  # pip3 install natsort
import re
import plistlib


for config_dir in natsort.natsorted(glob.iglob('*.config', recursive=False)):
  config_errors = set([])
  sys.stderr.write("processing: %s\n" % (config_dir))
  # for each clang result for a compilation unit
  for root, dirs, files in os.walk(config_dir):
    files = filter(lambda x : x.endswith(".plist"), files)
    for clang_file in files:
      # sys.stderr.write("%s\n" % (clang_result))
      clang_result = os.path.join(root, clang_file)
      clang_resolved = clang_result + ".resolved"
      with open(clang_resolved, 'wb') as outfile:
        new_errors = list()
        with open(clang_result, 'rb') as f:
          content = plistlib.readPlist(f)
          reports = content['diagnostics']
          for ix in range(len(reports)):
#            import pdb; pdb.set_trace()
            old_line = reports[ix]['location']['line']
            # assume that clang errors are relative to the config directory

            old_file = None
            # Check that the file exists
            if os.path.isfile(clang_result.replace('.plist', '.i')):
              old_file = clang_result.replace('.plist', '.i')
            else:
              # Find the file
              # Old_file is the entire path so we'll just use clang_file
              for root, dirs, files in os.walk('.'):
                for f in files:
                  if f == clang_file.replace('.plist', '.i'):
                    old_file = os.path.join(root, f)
                    break

            if old_file == None:
              raise FileNotFoundError("Couldn't find .i file for %s" % clang_file)
            
            ref_file = clang_file.replace('.plist', '.c')
            content['files'][0] = ref_file
            ref_line = 1
            found = False
            with open(old_file) as g:
              g_i = 0
              for line in g:
                line = line.strip()
                g_i += 1
                ref_line += 1
                if line.startswith("# "): # a preprocessor output line ref
                  split_line_ref = line.split()
                  # 0 is the hash symbol
                  try:
                    ref_line = int(split_line_ref[1]) - 1 # substract one b/c the _next_ line in the .i file is the referenced line
                    ref_file = split_line_ref[2][1:-1] # remove quotes
                  except:
                    sys.stderr.write("could not resolve %s from %s\n" % (line, clang_result))
                    # 3 and above are flags not relevant for line resolution
                if (g_i == old_line):
                  # sys.stderr.write(("translating %s:%s to %s:%s\n" % (old_file, old_line, ref_file, ref_line)))
#                  import pdb; pdb.set_trace()
                  found = True
                  break
              if found:
                reports[ix]['location']['line'] = ref_line
                new_errors.append(content)

        # Write to file in same format
        content['diagnostics'] = reports
        plistlib.dump(content, outfile)
      
