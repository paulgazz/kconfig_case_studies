import os
import deduplicate.bug_report as br
import json
import re
import csv
import logging

class DeduplicateUtils:
    """
    This class holds disparate methods that would be useful to the task
    of processing and deduplicating warnings.
    """
    @staticmethod
    def read_config_file():
        """
        Read config file and return it as a dictionary.
        """
        config_file = "config/file_locations.json"
        if not os.path.isfile(config_file):
            raise FileNotFoundError(f"Config file {config_file} does not exist.")
        
        with open(config_file) as f:
            data = json.load(f)

        return data

    @staticmethod
    def get_bug_dataset(tool, dirname, target):
        logging.debug(f"get_bug_dataset called with {tool}, {dirname}, {target}")
        """
        Takes a tool and a directory name and returns the dataset
        of bug reports obtained from iterating over the results.
        Also takes the target program to include in the report.
        """

        if not os.path.isdir(dirname):
            raise FileNotFoundError(f"{dirname} doesn't exist.")
        
        if tool == "clang":
            report = br.ClangReport
            file_extension = ".plist.resolved"
        elif tool == "cbmc":
            report = br.CBMCReport
            file_extension = ".xml"
        elif tool == "infer":
            report = br.InferReport
            file_extension = ".report.json"
        elif tool == "ikos":
            report = br.IKOSReport
            file_extension = ".db.json"
        elif tool == "cppcheck":
            report = br.CppcheckReport
            file_extension = ".cppcheck.resolved"
        else:
            raise ValueError("tool must be one of [clang, cbmc, infer, ikos, cppcheck]")

        master_files_list = list()

        # Get the complete list of files
        for root, dirs, files in os.walk(dirname):
            master_files_list.extend(list(
                map(lambda x: os.path.join(root, x), (
                filter(lambda x: x.endswith(file_extension), files)))))
        logging.debug(f"Found {len(master_files_list)} files. Processing now")
        logging.debug(f"Report type is {type(report)}")
        # Get the list of warnings
        warnings = list()
        for f in master_files_list:
            bugs = report.generate_from_file(f)
            for b in bugs:
                # Add configuration information
                config = re.findall('[0-9]{1,3}.config', f)
                if len(config) > 1:
                    raise RuntimeError(f"More than one configuration number",
                                       " extracted from {dirname}. Crashing because",
                                       " I don't know how to handle this.")
                b.add_config(config[0])
                b.add_target(target)
                warnings.append(b)

        # Compute
        return warnings

    @staticmethod
    def deduplicate_dataset(warnings):
        """
        Returns the warnings dataset but only with unique bug reports.
        Currently, if A and B are emitted by different tools, they
        will not be considered equivalent.
        """

        logging.info("Deduplicating...")

        unique = set(warnings)

        # Update config lists
        for u in unique:
            for w in warnings:
                if u == w:
                    u.update_configs(w)
                    
        return unique

        # I initially had this as just set(warnings) but
        #  this doesn't work, because I need to perform the union of the
        #  configuration set.
        
    @staticmethod
    def update_config_list(updatee, updater):
        updatee.update_config_list(updater)
        
    @staticmethod
    def output_as_csv(dataset, outfile):
        """
        Takes a bug database and outputs as a CSV file.
        DOES NOT CALL CHECK_CSV.
        This is because this function is not called until
        the end of execution, and we would like to know
        if the program will fail because the CSV exists before
        wasting an hour on execution.
        """
        with open(outfile, 'w') as f:
            fieldnames = dataset[0].asdict().keys()

            writer = csv.DictWriter(f, fieldnames=fieldnames)

            writer.writeheader()
            for w in dataset:
                w = w.asdict()
                writer.writerow(w)

    @staticmethod
    def check_csv(outfile):
        """
        Simply checks if the csv file exists and throws a RuntimeError
        if it does. Returns nothing otherwise.
        """
        
        # Checking that the file doesn't already exist.
        if os.path.isfile(outfile):
            raise RuntimeError(f"{outfile} exists! Refusing to overwrite.")

