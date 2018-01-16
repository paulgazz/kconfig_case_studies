import sys
import os
import argparse
import re

config_regex = "[^\s#]+"
set_pattern = re.compile("^(%s)=(.*)$" % (config_regex))
unset_pattern = re.compile("^# (%s) is not set" % (config_regex))

argparser = argparse.ArgumentParser(
    description="""\
Compare two .config files.
    """
    )
argparser.add_argument('kmax_file', help="""a Kmax file that contains types of configuration variables""")
argparser.add_argument('sampled_config', help="""the first config file""")
argparser.add_argument('kconfig_config', help="""the second config file""")
args = argparser.parse_args()

class ConfigVar:
  def __init__(self, is_bool, typename, is_selectable):
    self.is_bool = is_bool
    self.typename = typename
    self.is_selectable = is_selectable

config_types = {}
with open(args.kmax_file) as f:
  for line in f:
    instr, data = line.strip().split(" ", 1)
    if (instr == "bool"):
      varname, selectability = data.split(" ", 1)
      selectable = True if selectability == "selectable" else False
      config_types[varname] = ConfigVar(True, None, selectable)
    elif (instr == "nonbool"):
      varname, selectability, type_name = data.split(" ", 2)
      selectable = True if selectability == "selectable" else False
      config_types[varname] = ConfigVar(False, type_name, selectable)

# Return two dictionaries.  The first maps config names to True for
# set ones and False for not set ones.  The second maps set config
# names to their value.
def get_configs(f):
  lines = f.readlines()
  configs = {}
  config_vals = {}
  for line in lines:
    set_results = set_pattern.match(line)
    unset_results = unset_pattern.match(line)
    # they shouldn't both match
    assert not (set_results != None and unset_results != None)
    if set_results:
      name = set_results.group(1)
      val = set_results.group(2)
      assert name not in configs.keys()
      configs[name] = True
      config_vals[name] = val
    elif unset_results:
      name = unset_results.group(1)
      assert name not in configs.keys()
      configs[name] = False
    else:
      # ignore comments and empty lines
      pass
  return configs, config_vals

with open(args.sampled_config) as f:
  configs1, config_vals1 = get_configs(f)

with open(args.kconfig_config) as f:
  configs2, config_vals2 = get_configs(f)

keys1 = set(configs1.keys())
keys2 = set(configs2.keys())
common_configs = keys1.intersection(keys2)
unique1 = keys1.difference(common_configs)
unique2 = keys2.difference(common_configs)

num_errors = 0
num_warnings = 0

# check equivalence for variables that are in both config files
for name in common_configs:
  type_info = config_types[name]
  assert type_info != None
  if type_info.is_bool:
    if  configs1[name] == True and configs2[name] == True:
      val1 = config_vals1[name]
      val2 = config_vals2[name]
      if (val1 == "y" or val1 == "m") and (val2 == "y" or val2 == "m"):
        # both are enabled
        pass
      elif (val1 == "n") and (val2 == "n"):
        # both are disabled
        pass
      else:
        sys.stderr.write("error: %s differs between configs.  they have different boolean value settings.\n" % name)
        num_errors = num_errors + 1
    elif configs1[name] == False and configs2[name] == False:
      # both are unset
      pass
    elif configs1[name] == False and configs2[name] == True and not type_info.is_selectable:
      # assume it was set by a select statement or a default
      sys.stderr.write("warning: %s is bool and being set to some value in kconfig output, but is not user-selectable anyway.\n" % name)
      num_warnings = num_warnings + 1
      pass
    else:
      sys.stderr.write("error: %s differs between configs.  bool value is being unset by kconfig.\n" % name)
      num_errors = num_errors + 1
  else: # non booleans
    if configs1[name] == configs2[name]:
      # having both set to _something_ is sufficient
      if config_vals1[name] != config_vals2[name]:
        sys.stderr.write("warning: %s has different nonboolean values\n" % name)
        num_warnings = num_warnings + 1
      pass
    elif configs1[name] == False and configs2[name] == True:
      # assume the nonbool was set to a default
      sys.stderr.write("warning: %s is being set to some value in kconfig output\n" % name)
      num_warnings = num_warnings + 1
      pass
    else:
      sys.stderr.write("error: %s differs between configs.  nonbool value is being unset by kconfig\n" % name)
      num_errors = num_errors + 1

# make sure that any variables not in the kconfig are disabled in the kconfig file
for name in unique1:
  type_info = config_types[name]
  assert type_info != None
  if type_info.is_bool:
    if configs1[name] == False and name not in configs2:
      # unset in the generated config, and non-existent in the kconfig config is okay
      pass
    elif configs1[name] == True and name not in configs2:
      sys.stderr.write("error: %s is true in generated, but not set in kconfig output.\n" % name)
      num_errors = num_errors + 1
    else:
      assert True # should not reach here
  else: # non booleans
    if configs1[name] == False and name not in configs2:
      # disabled in generated, unset in kconfig is equivalent
      pass
    elif configs1[name] == True and name not in configs2:
      # unsetting a nonboolean is fine, since we don't support nonbooleans
      sys.stderr.write("error: %s differs between configs.  nonbool value is not set in kconfig\n" % name)
      num_errors = num_errors + 1
      pass
    else:
      assert True # should not reach here

# make sure that any set variables in the kconfig file are non-user-selectable variables
for name in unique2:
  type_info = config_types[name]
  assert type_info != None
  if not type_info.is_selectable:
    # we don't care how non-selectable variables are set, since they can have defaults or be set with "select"
    sys.stderr.write("warning: %s is being set to some value in kconfig output, but is not user-selectable anyway.\n" % name)
    num_warnings = num_warnings + 1
    pass
  else:
    sys.stderr.write("error: %s is set in kconfig output, but not in the generated config.\n" % name)
    num_errors = num_errors + 1
      
sys.stderr.write("%d errors\n" % num_errors)
sys.stderr.write("%d warnings\n" % num_warnings)
if num_errors == 0:
  # signal succesful comparison
  exit(0)
else:
  # signal diffs
  exit(1)
