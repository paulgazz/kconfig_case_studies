## The goal of this program is to have one script that can run all of our static analysis

### GLOBALS (USE SPARINGLY)
config_file = "config/run_analysis.config.json"

def read_config_file() -> dict:
    """Function to read the configuration file"""
    try:
        with open(config_file, "r") as f:
            data = json.load()
    except OSError:
        print(f"Configuration file not found. Generating an empty one at {config_file}")

        # Generate new empty config file
        configuration = {'valid_options':
                         {'target_program': list(),
                          'analysis_tool': list(),
                          '__comment': ("Use tool_constraints to specify program: "
                                        "tool that ***won't*** work on it"),
                          'program_constraints': dict()}}

        with open(config_file, 'w') as outfile:
            json.dump(configuration, outfile)

        raise SystemExit
    
    raise NotImplementedError
        

def get_user_input() -> dict:
    """Function to display the menu and get the input from the user in interactive mode."""
    raise NotImplementedError

    
