from deduplicate.deduplicate_utils import DeduplicateUtils
import logging

import argparse
parser = argparse.ArgumentParser("Utility to deduplicate bug reports.")

parser.add_argument("-v", "--verbose", action="count")
parser.add_argument("-f", "--force", action="store_true",
                    help="Enable to overwrite CSV file if it already exists.")
parser.add_argument("-c", "--config", default="file_locations.json",
                    help="Specify the configuration file (default = config/file_locations.json")

args = parser.parse_args()

if not args.verbose:
    logging.basicConfig(level=logging.CRITICAL)
elif args.verbose <= 1:
    logging.basicConfig(level=logging.WARNING)
elif args.verbose == 2:
    logging.basicConfig(level=logging.INFO)
else:
    logging.basicConfig(level=logging.DEBUG)

def main():
    # Goal: read config file, and for each location, get the bugs.
    # Then, dump all of these bugs into a CSV file.
    config = DeduplicateUtils.read_config_file(args.config)

    # For convenience in the for loop below
    master_tool_list = (('infer_results', 'infer'),
                        ('clang_results', 'clang'),                        
                        ('cppcheck_results', 'cppcheck'),
                        ('ikos_results', 'ikos'),
                        ('cbmc_results', 'cbmc')
    )
                        
    master_warnings_list = list()

    # Check the CSV file is not already extant.

    if not args.force:
        DeduplicateUtils.check_csv(outcsv)
    for c in config:
        for key, tool in master_tool_list:
            if key not in config[c] or not config[c][key]['location']:
                logging.warning(f"Location for {tool} reports on target {c} not present.")
                continue
            logging.info(f"Collecting warnings from {tool} on {c}.")
            
            warnings = DeduplicateUtils.get_bug_dataset(tool, config[c][key]['location'], c)
            logging.info(f"{len(warnings)} unique warnings; adding to master list.")

            # Variability?
            for w in warnings:
                if w.num_configs < (int(config[c][key]['successful_configs']) if
                                      config[c][key]['successful_configs'] else
                                      1000):
                    w.set_variability(True)
                else:
                    w.set_variability(False)
            
            # master_warnings_list.extend(warnings) # we want each tool/program in its own csv
            
            logging.info(f"{len(warnings)} unique bugs found.")
            outcsv = "results/{}_{}.csv".format(c, tool)
            logging.info(f"Writing to {outcsv}")
            DeduplicateUtils.output_as_csv(warnings, outcsv)
            DeduplicateUtils.write_to_json(warnings, outcsv.replace('.csv', '.json'))

if __name__ == "__main__":
    main()
