import os
import deduplicate.bug_report as br
import json
import re
import csv

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
        with open(config_file) as f:
            data = json.load(config_file)

        return data

    @staticmethod
    def get_bug_dataset(tool, dirname):
        """
        Takes a tool and a directory name and returns the dataset
        of bug reports obtained from iterating over the results.
        """

        if not os.path.isdir(dirname):
            raise FileNotFoundError(f"{dirname} doesn't exist.")
        
        if tool == "clang":
            report = br.ClangReport
            file_extension = ".plist"
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
            files.extend(list(
                map(lambda x: os.path.join(root, x), (
                filter(lambda x: x.endswith(file_extension), files)))))

        # Get the list of warnings
        warnings = list()
        for f in master_files_list:
            bugs = report.generate_from_file(f)
            for b in bugs:
                # Add configuration information
                config = re.findall('[0-9]{1,3}.config')
                if len(config) > 1:
                    raise RuntimeError(f"More than one configuration number",
                                       " extracted from {dirname}. Crashing because",
                                       " I don't know how to handle this.")
                b.add_config(config[0])
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
        return set(warnings)

    @staticmethod
    def output_as_csv(dataset, outfile):
        """
        Takes a bug database and outputs as a CSV file.
        """

        # Checking that the file doesn't already exist.
        if os.path.isfile(outfile):
            raise RuntimeError(f"{outfile} exists! Refusing to overwrite.")

        with open(outfile, 'w') as f:
            fieldnames = warnings[0].asdict().keys()

            writer = csv.DictWriter(f, fieldnames=fieldnames)

            writer.writeheader()
            for w in warnings:
                writer.write(w)
