from multiprocessing import Pool
import functools
import os
import deduplicate.bug_report as br
import json
import re
import csv
import logging
import plistlib

class DeduplicateUtils:
    """
    This class holds disparate methods that would be useful to the task
    of processing and deduplicating warnings.
    """
    NUM_CORES = 1
    hash_table = dict()
    @staticmethod
    def set_num_cores(num_cores):
        """
        Set the global variable NUM_CORES to control multiprocessing.
        """
        DeduplicateUtils.NUM_CORES = num_cores
        
    @staticmethod
    def get_common(target, configs_, include_=True):
        """
        Gets the common features for automatic feature extraction.
        target in {toybox_0_7_5, axtls_2_1_4, busybox_1_28_0}
        configs_ is the list of configurations from the bug report
        include governs whether we're finding the common failed configurations (include_ = True) or the common passed configurations (include_ = False)
        Original code by Jeho Oh
        Adapted for use in this tool by Austin Mordahl
        """
        configs_ = list(map(lambda x: f"{x}.config", configs_))
        dimacs_ = f"{os.environ['KCONFIG_CASE_STUDIES']}/cases/{target}/kconfig.dimacs"
        cdir_ = f"{os.environ['KCONFIG_CASE_STUDIES']}/cases/{target}/bugs/configs"

        common = list()
        init = True

        # check if config dir exists
        if not os.path.exists(cdir_):
            print("randconfig not found")
            return

        # get features and clauses
        _features, _clauses, _vars = DeduplicateUtils.read_dimacs(dimacs_)
        _names = [i[1] for i in _features]

        # iterate over each randconfig configurations
        for file in os.listdir(cdir_):
            if (include_ and (file in configs_)) or (not include_ and (file not in configs_)) or (len(configs_) == 0):
                try:
                    with open(cdir_ + "/" + file, 'r') as f:
                        # print(file)
                        _existing = set()

                        sol = list()
                        for line in f:
                            # line: # FEATURE is not set
                            if line.startswith('#'):
                                line = line[0:len(line) - 1]
                                data = line.split()
                                if len(data) > 4:
                                    if data[1] in _names:
                                        i = _names.index(data[1])
                                        _existing.add(data[1])
                                        if i != -1:
                                            sol.append('-' + _features[i][1])
                            # line: FEATURE=y or FEATURE="nonbool value"
                            else:
                                line = line[0:len(line) - 1]
                                data = line.split('=')
                                if len(data) > 1:
                                    if data[0] in _names:
                                        i = _names.index(data[0])
                                        _existing.add(data[0])
                                        # FEATURE=y
                                        if data[1] == 'y':
                                            sol.append(str(_features[i][1]))
                                        # FEATURE=empty string or 0
                                        elif data[1] == '\"\"' or data[1] == '0':
                                            if _features[i][3] != '\"\"' and _features[i][3] != '0':
                                                sol.append('-' + _features[i][1])
                                        # FEATURE='nonbool value'
                                        else:
                                            sol.append(str(_features[i][1]))

                        if init:
                            common = sol
                            init = False
                        else:
                            for s in common:
                                if s not in sol:
                                    common.remove(s)
                except IsADirectoryError:
                    continue
                    
        return common

    @staticmethod
    def read_dimacs(dimacsfile):
        _features = list()
        _clauses = list()
        _vcount = '-1'

        with open(dimacsfile) as f:
            logging.debug("Found the dimacs file")
            for line in f:
                # read variables in comments
                if line.startswith("c"):
                    line = line[0:len(line) - 1]
                    _feature = line.split(" ", 4)
                    del _feature[0]
                    _features.append(tuple(_feature))
                # read dimacs properties
                elif line.startswith("p"):
                    info = line.split()
                    _vcount = info[2]
                # read clauses
                else:
                    info = line.split()
                    if len(info) != 0:
                        _clauses.append(line)

        return _features, _clauses, _vcount

    @staticmethod
    def map_to_target(name):
        if name == "toybox" or name  == "toybox_0_7_5":
            return "toybox_0_7_5"
        elif name == "axtls" or name == "axtls_2_1_4":
            return "axtls_2_1_4"
        elif name == "busybox" or name == "busybox_1_28_0":
            return "busybox_1_28_0"

    @staticmethod
    def add_automatic_features(w):
        if w.automatic_features is not None:
            logging.debug("Warning already has automatic features; skipping....")
            return w
        logging.debug("Determining automatic features....")
        common_fail = DeduplicateUtils.get_common(DeduplicateUtils.map_to_target(w.target), w.configs, True)
        common_pass = DeduplicateUtils.get_common(DeduplicateUtils.map_to_target(w.target), w.configs, False)
        automatic_features = list()
        try:
            for s in common_fail:
                if s not in common_pass:
                    automatic_features.append(s)
                    logging.debug(f"Automatic features: {automatic_features}")
                    w.automatic_features = automatic_features
        except TypeError:
            logging.debug(f"This is a generic warning, so there are no features responsible.")
            w.automatic_features = None
        return w

    @staticmethod
    def read_config_file(config_file):
        """
        Read config file and return it as a dictionary.
        """
        if not os.path.isfile(config_file):
            raise FileNotFoundError(f"Config file {config_file} does not exist.")
        
        with open(config_file) as f:
            data = json.load(f)

        return data

    @staticmethod
    def add_to_hash_table(subhash):
        """
        Adds to the class hash table
        """
        logging.debug(f"{len(subhash)} entries in the subhash.")
        for d in subhash.keys():
            if d not in DeduplicateUtils.hash_table:
                DeduplicateUtils.hash_table[d] = subhash[d]
            else:
                DeduplicateUtils.hash_table[d] |= subhash[d]
        
    @staticmethod
    def get_bug_dataset(tool, dirname, target):
        DeduplicateUtils.hash_table = dict()
        logging.debug(f"get_bug_dataset called with {tool}, {dirname}, {target}")
        """
        Takes a tool and a directory name and returns the dataset
        of bug reports obtained from iterating over the results.
        Also takes the target program to include in the report.
        """

        intermediate_result = "results/.{}_{}.json".format(tool, target)
        
        # Check if the results already exist, if they do, load from memory
        if os.path.isfile(intermediate_result):
            logging.info(f"Intermediate result found at {intermediate_result}. Loading from there")
            warnings = DeduplicateUtils.read_from_json(intermediate_result)
            return warnings
        
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
            file_extension = "report.json"
        elif tool == "ikos":
            report = br.IKOSReport
            file_extension = ".db.csv"
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
        reader = functools.partial(DeduplicateUtils.read_warnings_from_file,
                                   report=report,
                                   target=target)
        with Pool(24) as p:
            results = p.map(reader, master_files_list)

        warnings = [x[0] for x in results]
        subhashes = [x[1] for x in results]
        
        logging.info(f"Updating global hash table with {len(subhashes)}")
        for s in subhashes:
            DeduplicateUtils.add_to_hash_table(s)
        logging.debug(f"{len(DeduplicateUtils.hash_table)} entries in global hash table.")
        # Flatten
        warnings = [bug for subwarning in warnings for bug in subwarning]
            # Compute
        warnings = DeduplicateUtils.deduplicate_dataset(warnings)

        logging.critical(f"Num cores is {DeduplicateUtils.NUM_CORES}")
        p = Pool(DeduplicateUtils.NUM_CORES)
        warnings = p.map(DeduplicateUtils.add_automatic_features, warnings)
        # Write to intermediate results file
        DeduplicateUtils.write_to_json(warnings, intermediate_result)
        
        return warnings

    def read_warnings_from_file(f, report, target):
        warnings = list()
        hash_table = dict()
        try:
            bugs = report.generate_from_file(f)
            logging.debug(f"Successfully read reports from {f}")
            for b in bugs:
                # Add configuration information
                config_path = re.findall('[0-9]{1,3}.config', f)
                if len(config_path) > 1:
                    raise RuntimeError(f"More than one configuration number",
                                       " extracted from {dirname}. Crashing because",
                                       " I don't know how to handle this.")

                config = re.findall('[0-9]{1,3}', config_path[0])
                if len(config) > 1:
                    raise RuntimeError(f"Problem extracting configuration number",
                                       " from pathname {config_path[0]}. Exiting.")
                if b not in hash_table:
                    hash_table[b] = set()
                hash_table[b].add(config[0])
                logging.debug(f"Size of hash table {len(hash_table)}")
                b.add_config(config[0])
                b.add_target(target)
                warnings.append(b)
            return (warnings, hash_table)

        except (ValueError, plistlib.InvalidFileException):
            logging.warning(f"Couldn't read from {f}. Maybe it's empty?")
            return (warnings, hash_table)
            
    @staticmethod
    def write_to_json(dataset, outfile):
        """
        Used to write intermediate results to json files,
        so next time the tool is run, intermediate results
        can be loaded instead of recomputed (which is super expensive).
        """

        # Convert to a list of dicts, so we can write
        dataset_as_dicts = [x.asdict() for x in dataset]
        with open(outfile, 'w') as f:
            json.dump(dataset_as_dicts, f)

    @staticmethod
    def read_from_json(infile):
        """
        Used to read intermediate results from json files.
        """

        if not os.path.isfile(infile):
            raise FileNotFoundError

        with open(infile) as f:
            data = json.load(f)

        warnings = list()
        # Convert each entry to a bug report
        for d in data:
            warnings.append(br.BugReport.fromdict(d))

        return warnings
            

    @staticmethod
    def fill_config_list(u):
        """
        Takes the unique warnings set, and the warnings list,
        and updates the configuration lists of the unique warnings.
        """
        logging.debug(f"I'm in fill_config_list, and the size of the hash table is {len(DeduplicateUtils.hash_table)}")
        if u not in DeduplicateUtils.hash_table:
            raise RuntimeError("The unique warning is not in the hash table, which shouldn't happen.")
        else:
            u.configs = DeduplicateUtils.hash_table[u]
        return u
      
    @staticmethod
    def deduplicate_dataset(warnings):
        """
        Returns the warnings dataset but only with unique bug reports.
        Currently, if A and B are emitted by different tools, they
        will not be considered equivalent.
        """

        logging.info(f"Deduplicating {len(warnings)} warnings...")
        logging.debug(f"Size of hash table: {len(DeduplicateUtils.hash_table)}")

        unique = list(set(warnings))

        logging.info(f"{len(unique)} unique warnings found.")

        # create partial function call to use with pool
        logging.debug(f"Building configuration lists.... (this may take a while)")
        with Pool(DeduplicateUtils.NUM_CORES) as pool:
            unique = pool.map(DeduplicateUtils.fill_config_list, unique)

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

        dataset = list(dataset)

        if len(dataset) == 0:
            logging.warning(f"Dataset for {outfile} is empty; not writing.")
        else:

            # Remove description and configs
            datasetasdicts = list()
            for d in dataset:
                w = d.asdict()
                w.pop('description')
                w.pop('configs')
                datasetasdicts.append(w)
            
            with open(outfile, 'w') as f:
                fieldnames = datasetasdicts[0].keys()
                writer = csv.DictWriter(f, fieldnames=fieldnames)

                writer.writeheader()
                for d in datasetasdicts:
                    writer.writerow(d)

    @staticmethod
    def check_csv(outfile):
        """
        Simply checks if the csv file exists and throws a RuntimeError
        if it does. Returns nothing otherwise.
        """
        
        # Checking that the file doesn't already exist.
        if os.path.isfile(outfile):
            raise RuntimeError(f"{outfile} exists! Refusing to overwrite.")

