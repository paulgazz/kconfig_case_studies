import sys
import deduplicate.bug_report as br
from deduplicate.deduplicate_utils import DeduplicateUtils
import logging

import argparse
parser = argparse.ArgumentParser("Utility to deduplicate bug reports.")

parser.add_argument("-v", "--verbose", action="count")
parser.add_argument("-f", "--force", action="store_true",
                    help="Enable to overwrite CSV file if it already exists.")
parser.add_argument("-o", "--outfile", default="warnings.csv",
                    help="Specify name of output CSV (default warnings.csv")

args = parser.parse_args()

if not args.verbose:
    logging.basicConfig(level=logging.CRITICAL)
elif args.verbose >= 1:
    logging.basicConfig(level=logging.WARNING)
elif args.verbose == 2:
    logging.basicConfig(level=logging.INFO)
else:
    logging.basicConfig(level=logging.DEBUG)

outcsv = "results/{}".format(args.outfile)

def main():
    # Goal: read config file, and for each location, get the bugs.
    # Then, dump all of these bugs into a CSV file.
    config = DeduplicateUtils.read_config_file()

    # For convenience in the for loop below
    master_tool_list = (('infer_results', 'infer'),
                        ('cbmc_results', 'cbmc'),
                        ('clang_results', 'clang'),
                        ('ikos_results', 'ikos'),
                        ('cppcheck_results', 'cppcheck'))
                        
    master_warnings_list = list()

    # Check the CSV file is not already extant.
    outcsv = "results/warnings.csv"

    if not args.force:
        DeduplicateUtils.check_csv(outcsv)
    for c in config:
        for key, tool in master_tool_list:
            if not config[c][key]:
                logging.warning(f"Location for {tool} reports on target {c} not present.")
                continue
            logging.info(f"Collecting warnings from {tool} on {c}.")
            warnings = DeduplicateUtils.get_bug_dataset(tool, config[c][key], c)
            logging.info(f"{len(warnings)} warnings collected. Now deduplicating.")
            warnings = DeduplicateUtils.deduplicate_dataset(warnings)
            logging.info(f"{len(warnings)} unique warnings; adding to master list.")
            master_warnings_list.extend(warnings)

    logging.info(f"{len(master_warnings_list)} bugs found in total.")
    logging.info(f"Writing to {outcsv}")
    DeduplicateUtils.output_as_csv(master_warnings_list, outcsv)

if __name__ == "__main__":
    main()
