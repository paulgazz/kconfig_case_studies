import sys
import os
import errno
import subprocess

# This script takes the build output from a call to kbuild make with
# KBUILD_VERBOSE=1 enabled. It then extracts each call to gcc and
# reruns it, but using the preprocessor, storing it according to the
# name of the build output's configuration number.

# This script must be run from the root of the case's source code
# repository.

# The default name of the compiler for use in processing the commands.
cc_cmd = "gcc"

# This script depends on SuperC's GCCShunt program being available.
script_path = os.path.dirname(os.path.realpath(__file__))
def gccshunt_cmd(cli_args, out_file):
  return "java -cp %s GCCShunt --shunt-kbuild --shunt-config %s %s" % (script_path, out_file, cli_args)

if len(sys.argv) < 3:
  print("%s build_out out_dir" % (os.path.basename(sys.argv[0])))
  print("build_out is the result of building one config, i.e., cases/CASE_NAME/SAMPLE_DIR/build_out/CONFIG_NUM.config")
  print("out_dir is the path to store the preprocessed files")
  exit(1)

def cpp_cmd(cli_args_file, source_filename, preprocessed_out):
  return "gcc -E $(cat %s) %s > %s" % (cli_args_file, source_filename, preprocessed_out)

def mkdir_p(path):
    try:
        os.makedirs(path)
    except OSError as exc:  # Python >2.5
        if exc.errno == errno.EEXIST and os.path.isdir(path):
            pass
        else:
            raise

def verbose_call(cmd):
  print(" [CALL] %s" % (cmd))
  subprocess.call(cmd, shell=True)
  
build_out = sys.argv[1]
out_dir = sys.argv[2]

if not os.path.exists(build_out):
  print("%s does not exist" % (build_out))
  exit(1)

# go through each line of the build output, collecting calls to gcc,
# and rerun them with the preprocessor
with open(build_out) as f:
  for line in f:
    line = line.strip()
    if line.startswith(cc_cmd):
      gcc_args = line[len(cc_cmd):]  # chop off the gcc part

      # get the filename.  WARNING: assumes last argument is
      # filename. gcc does not require this, but kbuild makefiles
      # ensure it.
      _, filename = gcc_args.rsplit(" ", 1)

      cli_args_file = os.path.join(out_dir, "%s.cli" % (filename))
      preprocessed_file = os.path.join(out_dir, "%s.i" % (os.path.splitext(filename)[0]))

      mkdir_p(os.path.dirname(preprocessed_file))

      verbose_call(gccshunt_cmd(gcc_args, cli_args_file))
      verbose_call(cpp_cmd(cli_args_file, filename, preprocessed_file))
