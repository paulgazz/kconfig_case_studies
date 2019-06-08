##########
# Code samples from Chris Warrick's tutorial on setting up a Python project
# with Setuptools. URL: https://chriswarrick.com/blog/2014/09/15/
# python-apps-the-right-way-entry_points-and-scripts/
# Accessed 2019-06-04 12:28 CDT
###########
from datetime import datetime
import shutil
import sys
import os
import json
import subprocess
import tempfile
import logging
from multiprocessing import Pool
logging.basicConfig(level=logging.DEBUG)
## import my modules
import argparse

## global variables
NUM_CORES = 24

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
            logging.critical(f"Run {runId} not valid: {source} is not a valid directory Skipping this run.")
            continue
        kconfig_root = os.environ["KCONFIG_CASE_STUDIES"]
        configs = os.path.join(kconfig_root, "cases", map_to_version(run["target"]),
                               run["configs"])
        if not os.path.isdir(configs):
            logging.critical(f"Run {runId} not valid: {configs} is not a valid directory. Skipping this run.")
            continue
        ## If valid
        if "preprocess_dir" in run and not os.path.isdir(run["preprocess_dir"]):
            logging.critical(f"Run {runId} not valid: {run['preprocess_dir']} is not a valid directory. Skipping this run.")
            continue

        # If there is a configuration range, then we support that.
        if "config_range" in run:
            # First, check that the range is valid
            if len(run["config_range"]) != 2:
                logging.warning(f"{run['config_range']} has more than two ",\
                "elements. Correct format is [min, max] (inclusive)")
            else:
                min = run["config_range"][0]
                max = run["config_range"][1]
                range_list = list(range(min, max+1))
                files = list(map(lambda x : f"{x}.config", range_list))

                # Change to the config directory
                current = os.getcwd()
                os.chdir(configs)
                # Verify the range was valid
                file_list = os.listdir(".")
                invalid_flag = False
                for f in files:
                    if f not in file_list:
                        invalid_flag = True
                        break
                if invalid_flag:
                    logging.critical(f"{f} not in {configs}. Defaulting to using"\
                                     " all configurations.")
                else:
                    ## Need to make a new directory instead of
                    ##  using a temporary directory because we want to retain the
                    ##  logging information generated
                    new_config = f"{min}_{max}_configs_{str(datetime.now()).replace(' ','_')}"
                    new_dir = os.path.join(configs, new_config)
                    logging.debug(f"New_config: {new_config}; New_dir: {new_dir}")
                    os.mkdir(new_dir)
                    logging.info("Created new directory")
                    # Copy configurations over
                    logging.debug(f"Files: {files}")
                    for f in files:
                        shutil.copy2(f"./{f}", new_dir)
                    run["configs"] = os.path.join(run["configs"], new_config)
                    logging.debug(f"New config path: {run['configs']}")
                os.chdir(current)
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
    # Clone code to temporary directory so as not to interfere with other
    #  scripts potentially running in parallel.
    temp = tempfile.TemporaryDirectory(None, "/vagrant/temporary")
    temp_dir = temp.name
    shutil.copytree(run["source"], f"{temp_dir}/src")
    run["source"] = f"{temp_dir}/src"
    logging.debug(f"Current run is {run}")
    os.chdir(run["source"])
    logging.debug(f"scripts are in {scripts_dir}")

    if run["tool"] == "infer":
        subprocess.run([f"{scripts_dir}/driver_infer.sh", "build",
                        map_to_version(run["target"]), run["configs"]])
    elif run["tool"] == "cbmc":
        subprocess.run([f"{scripts_dir}/driver_cbmc.sh", "build",
                        map_to_version(run["target"]), run["configs"]])
    elif run["tool"] == "cppcheck" or run["tool"] == "clang":
        if "preprocess_dir" in run:
            preprocess_dir = run["preprocess_dir"]
            os.chdir(run["preprocess_dir"])
        else:
            # preprocess
            preprocess_dir = f"/vagrant/results/{map_to_version(run['target'])}/{run['tool']}_results"
            logging.info("Preprocessing code....")
            try:
                os.makedirs(preprocess_dir)
            except FileExistsError:
                logging.critical(f"{preprocess_dir} already exists. Reconciling with existing "\
                      "results is not yet supported. Please move the existing "\
                      "directory for the run to succeed.")
                os.chdir(cwd)
                temp.cleanup()
                return
            logging.debug(f"map-to-version: {map_to_version(run['target'])}")
            if run["target"].startswith("toybox"):
                # use analyzer.sh
                subprocess.run([f"{scripts_dir}/analyzer.sh",
                                os.path.join(os.environ["KCONFIG_CASE_STUDIES"],
                                                        "cases",
                                                        map_to_version(run["target"]),
                                                        run["configs"]),
                                preprocess_dir])
                # Once preprocessing is done, we have to fix all the .i files
                os.chdir(preprocess_dir)
                preprocess_dir = os.getcwd()
                subprocess.run(["python", f"{scripts_dir}/fix_files.py"])
            else: # for anything other than toybox
                subprocess.run([f"{scripts_dir}/driver.sh", "preprocess",
                                map_to_version(run["target"]), run["configs"],
                                preprocess_dir])
                os.chdir(preprocess_dir)
                preprocess_dir = os.getcwd()
        if run["tool"] == "cppcheck":
            subprocess.run([f"{scripts_dir}/run_cppcheck.sh", preprocess_dir])
            subprocess.run(["python", f"{scripts_dir}/resolve_cppcheck_lines.py"])
        else:
            subprocess.run([f"{scripts_dir}/run_clang.sh", preprocess_dir])
            subprocess.run(["python", f"{scripts_dir}/resolve_clang_lines.py"])
    os.chdir(cwd)
    temp.cleanup()
    
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
        run_list = list()
        for run in validate(data["runs"]):
            run_list.append(run)

        # Multiprocessing
        p = Pool(NUM_CORES)
        p.map(handle, run_list)
        
    
    # Do argument parsing here (eg. with argparse) and anything else
    # you want your project to do.

if __name__ == "__main__":
    main()
