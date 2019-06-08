###########
# Code samples from Chris Warrick's tutorial on setting up a Python project
# with Setuptools. URL: https://chriswarrick.com/blog/2014/09/15/
# python-apps-the-right-way-entry_points-and-scripts/
# Accessed 2019-06-04 12:28 CDT
###########

import sys
import json
import subprocess
import logging
import multiprocessing
logging.basicConfig(level=logging.DEBUG)
## import my modules
import argparse

def validate(data):
    runId = 0
    for run in data:
        runId = runId + 1
        ## configuration file should be a list of runs to do
        
        ## Verification step
        tool = run["tool"]
        if tool not in ["infer", "cbmc", "clang", "cppcheck"]:
            logging.critical(f"Run {runID} not valid: {tool} is not one of [infer, cppcheck, clang, cbmc]. Skipping this run.")
            continue
        target = run["target"]
        if target not in ["axtls", "toybox", "busybox", "axtls_2_1_4", "toybox_0_7_5", "busybox_1_28_0"]:
            logging.critical(f"Run {runId} not valid: {target} is not one of [axtls, toybox, busybox, axtls_2_1_4, toybox_0_7_5, busybox_1_28_0]")
            continue
        source = run["source"]
        if not os.path.isdir(source):
            logging.critical(f"Run {runId} not valid: {source} is not a valid directory. Skipping this run.")
            continue
        configs = run["configs"]
        if not os.path.isdir(configs):
            logging.critical(f"Run {runId} not valid: {configs} is not a valid directory. Skipping this run.")
            continue
        ## If valid
        if "preprocess_dir" in run and not os.path.isdir(run["preprocess_dir"]):
            logging.critical(f"Run {runId} not valid: {run['preprocess_dir']} is not a valid directory. Skipping this run.")
            continue
        logging.info(f"Run {runId} passed validation check. Running now....")
        yield run
        
def map_to_version(target):
    if target == "toybox":
        return "toybox_0_7_5"
    if target == "axtls":
        return "axtls_2_1_4"
    if target == "busybox":
        return "busybox_1_28_0"
    else:
        return target # assuming validate has been run, this means that the
    # target string is already formatted correctly

def handle(run):
    # Save current working directory to access scripts
    cwd = os.getcwd()
    scripts_dir = f"{cwd}/.scripts"
    os.chdir["source"]
    logging.debug(f"scripts are in {scripts_dir}")
    if run["tool"] == "infer":
        subprocess.run([f"{scripts_dir}/driver_infer.sh", "build",
                        map_to_version(run["target"]), target["configs"]])
    elif run["tool"] == "cbmc":
        subprocess.run(["{scripts_dir}/driver_cbmc.sh", "build",
                        map_to_version(run["target"]), target["configs"]])
    elif run["tool"] == "cppcheck" or run["tool"] == "clang":
        if "preprocess_dir" in run:
            preprocess_dir = run["preprocess_dir"]
            os.chdir(run["preprocess_dir"])
        else:
            # preprocess
            logging.info("Preprocessing code....")
            os.mkdir("./preprocess")
            if map_to_version(run["target"] == "toybox_0_7_5"):
                # use analyzer.sh
                subprocess.run([f"{scripts_dir}/analyzer.sh", run["configs"],
                                "./preprocess"])
                # Once preprocessing is done, we have to fix all the .i files
                os.chdir("./preprocess")
                preprocess_dir = os.cwd()
                subprocess.run(["python", "fix_files.py"])
            else: # for anything other than toybox
                subprocess.run([f"{scripts_dir}/driver.sh", "preprocess",
                                map_to_version(run["target"]), run["configs"],
                                "./preprocess"])
                os.chdir("./preprocess")
        if run["tool"] == "cppcheck":
            subprocess.run([f"{scripts_dir}/run_cppcheck.sh"])
            subprocess.run(["python", f"{scripts_dir}/resolve_cppcheck_lines.py"])
        else:
            subprocess.run([f"{scripts_dir}/run_clang.sh"])
            subprocess.run([f"python", "{scripts_dir}/resolve_clang_lines.py"])
        
def main(args=None):
    """The main routine."""
    if args is None:
        args = sys.argv[1:]

    parser = argparse.ArgumentParser("Tool to run analysis tools")
    parser.add_argument("config", help="configuration file")
    parser.add_argument("--interactive", "-i", help="run in interactive mode instead of from a configuration file")
    args = parser.parse_args()

    # Open the configuration file
    runID = 1
    with open(args.config) as f:
        data = json.load(f)
        for run in validate(data):
            ## To-do: support parallel runs
            handle(run)
        
    
    # Do argument parsing here (eg. with argparse) and anything else
    # you want your project to do.

if __name__ == "__main__":
    main()
