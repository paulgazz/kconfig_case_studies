import sys
import os
import errno
import subprocess
import re

# This script takes the build output from a call to kbuild make with
# KBUILD_VERBOSE=1 enabled. It then extracts each call to gcc and
# reruns it, but using the preprocessor, storing it according to the
# name of the build output's configuration number.

# This script must be run from the root of the case's source code
# repository.

# The name of the compiler for use in processing the commands.
cc_cmd_regex = r'^(gcc|g\+\+) (.*)$'
cc_cmd_match = re.compile(cc_cmd_regex)

# make[2]: Entering directory '/home/vagrant/fiasco_17_10/src/kernel/fiasco/tool/kconfig'
make_cd_regex = ".*(Entering|Leaving) directory '([^']+)'"
make_cd_match = re.compile(make_cd_regex)

# path to project source code, should be current directory
cur_src_dir = os.getcwd()

# keep track of nested makefiles.  the paths in this stack are all
# relative the the current directory (not to each other)
cur_make_dir = ["./"]

# remove current source directory from a file
def rem_src_dir(filename):
  global cur_src_dir
  return filename.replace(cur_src_dir + "/", '')

# This script depends on SuperC's GCCShunt program being available.
def gccshunt_cmd(cli_args, out_file):
  kconfig_case_studies = os.path.dirname(os.path.realpath(__file__))
  return "java -cp %s GCCShunt --shunt-kbuild --shunt-config %s %s" % (kconfig_case_studies, out_file, cli_args)

if len(sys.argv) < 3:
  print "%s build_out out_dir" % (os.path.basename(sys.argv[0]))
  print "build_out is the result of building one config, i.e., cases/CASE_NAME/SAMPLE_DIR/build_out/CONFIG_NUM.config"
  print "out_dir is the path to store the preprocessed files"
  exit(1)

def cpp_cmd(gcc_cmd, cli_args_file, source_filename, preprocessed_out):
  return "%s -E $(cat %s) %s > %s" % (gcc_cmd, cli_args_file, source_filename, preprocessed_out)

def mkdir_p(path):
    try:
        os.makedirs(path)
    except OSError as exc:  # Python >2.5
        if exc.errno == errno.EEXIST and os.path.isdir(path):
            pass
        else:
            raise

def verbose_call(cmd):
  print " [CALL] %s" % (cmd)
  subprocess.call(cmd, shell=True)
  
build_out = sys.argv[1]
out_dir = sys.argv[2]

if not os.path.exists(build_out):
  print "%s does not exist" % (build_out)
  exit(1)

# go through each line of the build output, collecting calls to gcc,
# and rerun them with the preprocessor
full_line = ""  # use this to handle line continuations
with open(build_out) as f:
  for line in f:
    line = line.strip()

    make_cd_result = make_cd_match.search(line)
    if make_cd_result:
      print line
      # process directory changes
      cd_type = make_cd_result.group(1)
      cd_dir = make_cd_result.group(2)
      # filter out the current source dir
      cd_dir = rem_src_dir(cd_dir)
      if (cd_type == "Entering"):
        cur_make_dir.append(cd_dir)
      elif (cd_type == "Leaving"):
        cur_make_dir.pop()
      else:
        # our regex should only match Entering or Leaving
        assert(False)
    elif line.endswith("\\"):
      full_line += line[:-1]  # merge line continuations
    else:
      full_line += line  # merge line continuations
      match_result = cc_cmd_match.search(full_line)
      full_line = ""
      if match_result:
        gcc_cmd = match_result.group(1)  # get the command name
        gcc_args = match_result.group(2)  # remove the gcc command

        # get the filename.  WARNING: assumes last argument is
        # filename. gcc does not require this, but kbuild makefiles
        # ensure it.
        _, filename = gcc_args.rsplit(" ", 1)
        if not os.path.isabs(filename):
          filename = os.path.join(cur_make_dir[-1], filename)  # add make's current path

        cli_args_file = os.path.join(out_dir, "%s.cli" % (filename))
        preprocessed_file = os.path.join(out_dir, "%s.i" % (os.path.splitext(filename)[0]))

        mkdir_p(os.path.dirname(preprocessed_file))

        verbose_call(gccshunt_cmd(gcc_args, cli_args_file))
        verbose_call(cpp_cmd(gcc_cmd, cli_args_file, filename, preprocessed_file))
