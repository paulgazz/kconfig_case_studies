## The goal of this program is to have one script that can run all of our static analysis

import json
import sys
import logging

class ConfigInfo:

    # Attributes
    target_programs = list()

    # A list of ( tool: command line invocation ) key-value pairs
    analysis_tools = dict()

    # A list of ( tool: 
    program_constraints = dict()

    def import_from_json(self, json_file):
        """ Imports a ConfigInfo instance from a configuration file.
            Can throw FileNotFound exception if the file does not exist.
        """
    def export_to_json(self, json_file):

    
    
    
    def __init__():
def read_config_file(config_file) -> dict:
    """Function to read the configuration file

       Input: Name of the config file to read.
    """
    try:
        with open(config_file, "r") as f:
            data = json.load(f)
    except FileNotFoundError as err:
        print(f"Configuration file not found. Generating an empty one at {config_file}")

        # Generate new empty config file
        configuration = {'valid_options':
                         {'target_programs': list(),
                          'analysis_tools': list(),
                          '__comment': ("Use tool_constraints to specify program: "
                                        "tool that ***won't*** work on it"),
                          'program_constraints': {
                              "": list()
                          }
                         }}

        with open(config_file, 'w') as outfile:
            json.dump(configuration, outfile)

        sys.exit(0)

    # If the configuration file is there
    logging.debug("Configuration file found.")
    print(f"Configuration data: {data}")
        

def get_user_input() -> dict:
    """Function to display the menu and get the input from the user in interactive mode."""
    raise NotImplementedError

    
