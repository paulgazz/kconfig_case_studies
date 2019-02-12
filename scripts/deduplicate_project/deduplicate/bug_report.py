import json
import xmltodict
import plistlib
import logging
import csv
import os

"""
By Austin Mordahl
2019-02-11

Classes that represent bug reports.
Here we define two reports as equivalent if they have the same
 file name and line number (imprecise, but allows us to compare across
 multiple tools, some of which don't use column names, and some tools
 have different types.

If you want to add a new type of warning from a new tool, you must:
1. Make a new class that extends BugReport
TODO
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
        self.type = None
        self.target = None

    def __str__(self):
        raise NotImplementedError("Not implemented in the abstract base class")

    def asdict(self):
        """
        Method to return the bug reports as a dictionary
        for writing to files
        """

        selfdict = dict()
        selfdict['line'] = self.line
        selfdict['filename'] = self.filename
        selfdict['description'] = self.description
        selfdict['configs'] = str(self.configs)
        selfdict['num_configs'] = self.num_configs()
        selfdict['tool'] = self.tool
        selfdict['target'] = self.target
        selfdict['type'] = self.type
        return selfdict

    def add_target(self, target):
        self.target = target
        
    def num_configs(self):
        return len(self.configs)
    
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
            self.description == other.description and \
            self.tool == other.tool
    
    def __hash__(self):
        return hash((self.line, self.filename, self.description, self.tool))


class CBMCReport(BugReport):

    def __init__(self, line, filename, description, type):
        super().__init__(self, line, filename, description)
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
            raise ValueError(f"{file} has no bug reports")

        property_list = data["cprover"]["property"]

        for p in property_list:
            yield cls.__generate_from_record(p)

    

class IKOSReport(BugReport):

    def __init__(self, line, filename, description, type):
        super().__init__(line, filename, description)
        self.type = type
        self.type = "IKOS"

    @classmethod
    def __generate_from_record(cls, record):
        """ Generates the IKOS record from a single JSON record """
        ir = cls(record['line'], os.path.basename(record['file']),
                 record['message'], record['check'])

        return ir

    @classmethod
    def generate_from_file(cls, file):
        # Open JSON file
        with open(file) as f:
            csvreader = csv.DictReader(f)

        for d in csvreader:
            yield cls.generate_from_file(d)
    
            
class ClangReport(BugReport):

    def __init__(self, line, filename, description, type):
#        import pdb; pdb.set_trace() # debugging
        self.type = type
        self.tool = "clang"
        super().__init__(line, filename, description)


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

        logging.debug(f"Producing a clang report from {file}")
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
        # a cppcheck report looks like
        # [toys/other/vmstat.c:51]: (error) Uninitialized variable: p
        record = record.replace("\n", "")
        tokens = record.split(":")
        # We now have something like
        # [toys/other/vmstat.c
        # 51]
        # (error) Uninitialized variable
        # p

        # Filename: first token except the first character
        filename = tokens[0][1:]

        # Line: second token except the last character
        line = tokens[1][:-1]

        # Description: concatenate last two tokens
        description = tokens[2] + tokens[3]

        # Type: third token
        type = tokens[2]
        
        return cls(line, filename, description, type)
    
    @classmethod
    def generate_from_file(cls, file):
        with open(file) as f:
            data = f.readlines()

        for d in data:
            yield cls.__generate_from_record(d)
