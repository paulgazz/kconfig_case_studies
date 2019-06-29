import sys
import json
import xmltodict
import plistlib
import logging
import csv
csv.field_size_limit(sys.maxsize) # dirty code to get around IKOS

import os

"""
2019-02-11

Classes that represent bug reports.
Here we define two reports as equivalent if they have the same
 file name and line number (imprecise, but allows us to compare across
 multiple tools, some of which don't use column names, and some tools
 have different types).
"""


class BugReport:
    """
    This class is an ABC for different types of bug warnings emitted by
    different tools. It contains the elements that are required, and
    implements the == relationship between two bug reports.
    """

    def __init__(self, line: int, filename: str, description: str):
        self.line = line
        self.filename = filename
        self.description = description
        self.configs = set()
        self.tool = None
        self.type = None
        self.target = None
        self.variability = None
        self.num_configs = None
        self.automatic_features = None

    def __str__(self):
        raise NotImplementedError("Not implemented in the abstract base class")

    def set_variability(self, flag):
        self.variability = flag
        
    def asdict(self):
        """
        Method to return the bug reports as a dictionary
        for writing to files
        """

        selfdict = dict()
        selfdict['line'] = self.line
        selfdict['filename'] = self.filename
        # Have to do the config list a little different
        #  to help in re-reading from file.
        selfdict['tool'] = self.tool
        selfdict['description'] = self.description
        selfdict['target'] = self.target
        selfdict['type'] = self.type
        selfdict['configs'] = list(self.configs)
        selfdict['num_configs'] = self.num_configs
        selfdict['variability'] = self.variability
        selfdict['automatic_features'] = self.automatic_features
        return selfdict

    @staticmethod
    def fromdict(record):

        me = BugReport(record['line'], record['filename'], None) # not putting description in the table
        me.type = record['type']
        me.target = record['target']
        me.tool = record['tool']
        me.variability = record['variability']
        me.num_configs = record['num_configs']
        me.description = record['description']
        me.configs = set(record['configs'])
        
        # Not including variability here because it's not included in the asdict(),
        #  and the assumption is this will be called on dictionaries created by
        #  asdict()
        return me
        
    def add_target(self, target):
        self.target = target
        
    def add_config(self, config:str):
        """
        Adds config to the warning's config database
        """
        self.configs.add(config)

    def update_configs(self, other):
        self.configs |= other.configs
        
    @classmethod
    def __generate_from_record(cls, record):
        """
        Given a single record from the original file, produce
        an instance of the class.

        Input: record. This is one record from the dataset.
        This function will likely be called as
         for d in dataset:
          cls.__generate_from_record(d)
        """
        raise NotImplementedError("generate_from_record not implemented",
                                  " in the abstract base class")

    @classmethod
    def generate_from_file(cls, file):
        """
        Given a file, open it, and produce an iterator that 
        will yield bug reports.
        """

        ds = cls.__get_dataset_from_file(file)
        for d in ds:
            yield cls.__generate_from_record(d)

    def __eq__(self, other):
        """
        NOTE: Currently, the originating tool is used to compute
        equality and hash to prevent loss of information when deduplicating reports.
        In order to deduplicate across tools as is desired eventually, BugReport.__eq__
        and BugReport.__hash__ must be changed.
        """

        return self.line == other.line and \
            self.filename == other.filename and \
            self.tool == other.tool
    
    def __hash__(self):
        return hash((self.line, self.filename, self.tool))


class CBMCReport(BugReport):

    def __init__(self, line, filename, description, type):
        super().__init__(line, filename, description)
        self.type = type
        self.tool = "CBMC"

    @classmethod
    def __generate_from_record(cls, record):
        cr = cls(record["location"]["@line"], record["location"]["@file"],
                        record["description"], record["@class"])
        return cr

    @classmethod
    def generate_from_file(cls, file):
        with open(file) as f:
            data = xmltodict.parse(f.read())

        # Data now holds the entire XML file

        # Handle the file being empty
        if "property" not in data["cprover"]:
            raise ValueError(f"{file} has no data")

        property_list = data["cprover"]["property"]

        for p in property_list:
            yield cls.__generate_from_record(p)

    

class IKOSReport(BugReport):

    def __init__(self, line, filename, description, type):
        super().__init__(line, filename, description)
        self.type = type
        self.tool = "IKOS"

    @classmethod
    def __generate_from_record(cls, record):
        """ Generates the IKOS record from a single JSON record """
        ir = cls(record['line'], os.path.basename(record['file']),
                 record['message'], record['check'])
        return ir

    @classmethod
    def generate_from_file(cls, file):
        logging.debug(f"Generating IKOS from {file}")
        # Open JSON file
        with open(file) as f:
            csvreader = csv.DictReader(f)
            for d in csvreader:
                yield cls.__generate_from_record(d)
    
            
class ClangReport(BugReport):
    
    def __init__(self, line, filename, description, type):
        super().__init__(line, filename, description)
        self.type = type
        self.tool = "clang"



    @classmethod
    def __generate_from_record(cls, record):
        cr = cls(record["location"]["line"], record["source_file"],
                         record["description"], record["category"])
        return cr

    @classmethod
    def generate_from_file(cls, file):
        """
        Given a clang-generated JSON file, iteratively produce each record
        """

        logging.debug(f"Generating clang records from {file}")
        # Open JSON file
        with open(file, 'rb') as f:
            data = plistlib.load(f)

        # In clang, source file is embedded at the beginning instead of
        #  in each report
        for r in data["diagnostics"]:
            source = data["files"][0]
            source = source.split('/')
            r["source_file"] = source[-1]
            yield cls.__generate_from_record(r)

            
class InferReport(BugReport):

    def __init__(self, line, filename, description, type):
        super().__init__(line, filename, description)
        self.type = type
        self.tool = "infer"

    @classmethod
    def __generate_from_record(cls, record):
        ir = cls(record["line"], record["file"],
                         record["qualifier"], record["bug_type"])
        return ir

    @classmethod
    def generate_from_file(cls, file):
        # open JSON file
        with open(file) as f:
            data = json.load(f)
            
        for d in data:
            yield cls.__generate_from_record(d)

class CppcheckReport(BugReport):

    def __init__(self, line, filename, description, type):
        super().__init__(line, filename, description)
        self.type = type
        self.tool = "cppcheck"

    @classmethod
    def __generate_from_record(cls, record):
        logging.debug(f"cppcheck report: {record}")
        # a cppcheck report looks like
        # [toys/other/vmstat.c:51]: (error) Uninitialized variable: p
        record = record.replace("\n", "")
        tokens = record.split(":")
        logging.debug(f"cppcheck tokens: {tokens}")
        # We now have something like
        # [toys/other/vmstat.c
        # 51]
        # (error) Uninitialized variable
        # p

        # Filename: first token except the first character
        filename = os.path.basename(tokens[0][1:])

        # Line: second token except the last character
        line = tokens[1][:-1]

        # Description: concatenate last two tokens
        try:
            description = tokens[2] + tokens[3]
        except IndexError:
            description = tokens[2]

        # Type: third token
        type = tokens[2]
        
        return cls(line, filename, description, type)
    
    @classmethod
    def generate_from_file(cls, file):
        with open(file) as f:
            data = f.readlines()

        for d in data:
            yield cls.__generate_from_record(d)
