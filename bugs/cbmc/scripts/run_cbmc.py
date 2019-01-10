import argparse

parser = argparse.ArgumentParser("This program runs CBMC by compiling .i files and linking them together, then running CBMC on the result.")

parser.add_argument("--inputdir", '-i', default=".", help="root directory of preprocessed files (default is '.')")

args = parser.parse_args()

# The process is as follows:
# For each config directory:
#  compile all .i files into object files (.o)
#  link all .o files together into 'executables'
#  run CBMC on this executable

import os
import subprocess
import logging
import pdb
logging.basicConfig(level=logging.INFO)

# First, get list of directories to traverse (end in .config)

print("Finding the .i files....")
configs = [x[0] for x in os.walk(args.inputdir) if x[0].endswith('.config')]

# Next, for each directory in there, we walk and get all of the .i files
for c in configs:

    pres = list()
    for root, dirs, files in os.walk(c):
        pres.extend([os.path.join(root, x) for x in files if x.endswith('.i')])
    # At this point, pres should hold all of the .i files
    # We can now iterate over the .i files and preprocess them
    print("Found %d preprocessed files in config %s." % (len(pres), c))
    print("Now compiling files....")

    # Now, given all of the .i files, we can preprocess them
    args = ["goto-cc", "-c"]
    for f in pres:
        args.extend([f, "-o", f.replace(".i",".o")])
        cp = subprocess.run(args, stdout=subprocess.PIPE)
    # We should now have .o files for each .i file.
    #  We now have .o files. Ideally one for each .i file.
    #  In fact, we should error check and verify that each .o file exists
#    pdb.set_trace()
    objs = [x.replace(".i", ".o") for x in pres]
    for o in objs:
        if not os.path.isfile(o):
            logging.critical("%s did not successfully compile into an object file" % o.replace(".o", ".i"))

    # Now we link all of the files together into a single executable file
    print("Linking objects files into one executable....")
    args = ["goto-cc", "-o", os.path.join(c,"cbmc_exec")]
    args.extend(objs)
    subprocess.run(args, stdout=subprocess.PIPE)
    logging.info(cp.stdout)

    # Check that the file exists before running cbmc
    executable = os.path.join(c, "cbmc_exec")
    if(os.path.isfile(executable)):
        print("Executable created. Running CBMC....")
        with open((executable + ".xml"), 'w') as f:
                  cp = subprocess.run(["cbmc", executable, "--show-properties", "--bounds-check", "--pointer-check", "--signed-overflow-check", "--unsigned-overflow-check", "--nan-check", "--xml-ui"], stdout = f)
    else:
        logging.critical("CBMC executable was not generated.")

