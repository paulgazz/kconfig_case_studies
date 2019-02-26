import argparse
import logging

parser = argparse.ArgumentParser("Utility to run static analysis tools on target programs")

parser.add_argument("-i", "--interactive", action="store_true", help="Indicates whether to run in interactive mode (i.e. getting all inputs from the user) or to read from the configuration file")

args = parser.parse_args()

# From my own files
import run_analysis.config_utils as cu

def main():
    """TODO: Docstring"""

    if args.interactive:
        config = cu.get_user_input()
    else:
        config = cu.read_config_file()


if __name__ == "__main__":
    main()

    
