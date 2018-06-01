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
environment_vars = set()
with open(args.kmax_file) as f:
  for line in f:
    instr, data = line.strip().split(" ", 1)
    if (instr == "config"):
      varname, typename = data.split(" ", 1)
      config_types[varname] = ConfigVar(typename == "bool", typename, False)
    elif (instr == "prompt"):
      varname, condition = data.split(" ", 1)
      config_types[varname].is_selectable = True
    elif (instr == "env"):
      varname = data
      environment_vars.add(varname)
      config_types[varname].is_selectable = True

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
    if configs1[name] == True and configs2[name] == True:
      val1 = config_vals1[name]
      val2 = config_vals2[name]
      if (val1 == "y" or val1 == "m") and (val2 == "y" or val2 == "m"):
        # both are enabled
        pass
      elif (val1 == "n") and (val2 == "n"):
        # both are disabled
        pass
      else:
        sys.stderr.write("error: %s differs between configs.  they have different bool value settings.\n" % name)
        num_errors = num_errors + 1
    elif configs1[name] == False and configs2[name] == False:
      # both are unset
      pass
    elif not type_info.is_selectable:
      if configs1[name] == False and configs2[name] == True:
        sys.stderr.write("warning: %s is a nonselectable bool and being set to some value in kconfig output, but is not user-selectable anyway.\n" % name)
        num_warnings = num_warnings + 1
      elif configs1[name] == True and configs2[name] == False:
        # assume it was set by a select statement or a default
        sys.stderr.write("error: %s is a nonselectable bool and being turned off by kconfig.\n" % name)
        num_warnings = num_errors + 1
    else:
      sys.stderr.write("error: %s differs between configs.  bool value is selectable being unset by kconfig.\n" % name)
      num_errors = num_errors + 1
  else: # non booleans
    if configs1[name] == configs2[name]:
      # having both set to _something_ is sufficient
      if config_vals1[name] != config_vals2[name]:
        selectability = "selectable" if type_info.is_selectable else "nonselectable"
        sys.stderr.write("warning: %s has different %s nonboolean values\n" % (name, selectability))
        num_warnings = num_warnings + 1
      pass
    elif configs1[name] == False and configs2[name] == True:
      # assume the nonbool was set to a default
      selectability = "selectable" if type_info.is_selectable else "nonselectable"
      sys.stderr.write("warning: %s nonbool %s is being set to some value in kconfig output\n" % (selectability, name))
      num_warnings = num_warnings + 1
      pass
    elif configs1[name] == True and configs2[name] == False:
      if config_vals1[name] == "\"\"" or config_vals1[name] == "0":
        # our sampler sets these to empty values, "\"\"" for string and 0 for ints
        sys.stderr.write("warning: %s differs between configs, but only because an empty value is being unset by kconfig\n" % name)
        num_warnings = num_warnings + 1
      else:
        sys.stderr.write("error: %s differs between configs.  nonbool value is being unset by kconfig\n" % name)
        num_errors = num_errors + 1
    else:
      assert True

# make sure that any variables not in the kconfig are disabled in the kconfig file
for name in unique1:
  type_info = config_types[name]
  assert type_info != None
  if type_info.is_bool:
    if configs1[name] == False and name not in configs2:
      # unset in the generated config, and non-existent in the kconfig config is okay
      pass
    elif configs1[name] == True and name not in configs2:
      if name in environment_vars:
        # environment variables are not set by kconfig
        selectability = "selectable" if type_info.is_selectable else "nonselectable"
        sys.stderr.write("warning: %s bool %s is not set by kconfig, because it is set by environment variable\n" % (selectability, name))
        num_warnings = num_warnings + 1
        pass
      else:
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
      sys.stderr.write("warning: %s differs between configs.  nonbool value is not set in kconfig\n" % name)
      num_warnings = num_warnings + 1
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
    typename = "bool" if type_info.is_bool else "nonbool"
    sys.stderr.write("error: selectable %s variable %s is set in kconfig output, but not in the generated config.\n" % (typename, name))
    num_errors = num_errors + 1
      
sys.stderr.write("%d errors\n" % num_errors)
sys.stderr.write("%d warnings\n" % num_warnings)
if num_errors == 0:
  # signal succesful comparison
  exit(0)
else:
  # signal diffs
  exit(1)
