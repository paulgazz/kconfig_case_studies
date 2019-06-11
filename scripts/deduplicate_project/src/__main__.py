from deduplicate.deduplicate_utils import DeduplicateUtils
import logging

import argparse
parser = argparse.ArgumentParser("Utility to deduplicate bug reports.")

parser.add_argument("-v", "--verbose", action="count")
parser.add_argument("-f", "--force", action="store_true",
                    help="Enable to overwrite CSV file if it already exists.")
parser.add_argument("-c", "--config", default="config/file_locations.json",
                    help="Specify the configuration file (default = config/file_locations.json")
parser.add_argument("--cores", default=1, type=int, help="Specify the number of cores"\
                    " the machine has for multiprocessing.")

args = parser.parse_args()
DeduplicateUtils.set_num_cores(args.cores)

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
                        ('cbmc_results', 'cbmc')
    )
                        
    master_warnings_list = list()

    # Check the CSV file is not already extant.

    for c in config:
        for key, tool in master_tool_list:
            
            if key not in config[c] or not config[c][key]['location']:
                logging.warning(f"Location for {tool} reports on target {c} not present.")
                continue

            outcsv = "results/{}_{}.csv".format(c, tool)

            if not args.force:
                try:
                    DeduplicateUtils.check_csv(outcsv)
                except RuntimeError as re:
                    logging.warning(str(re))
                    continue

            logging.info(f"Collecting warnings from {tool} on {c}.")
            
            warnings = DeduplicateUtils.get_bug_dataset(tool, config[c][key]['location'], c)
            logging.info(f"{len(warnings)} unique warnings; adding to master list.")

            max_configs = compute_max_config(warnings)
            # Variability?
            for w in warnings:
                w.num_configs = len(w.configs)
                if w.num_configs < max_configs:
#                if w.num_configs < (int(config[c][key]['successful_configs']) if
#                                      config[c][key]['successful_configs'] else
#                                      1000):
                    w.set_variability(True)
                else:
                    w.set_variability(False)
            
            # master_warnings_list.extend(warnings) # we want each tool/program in its own csv
            
            logging.info(f"{len(warnings)} unique bugs found.")
            logging.info(f"Writing to {outcsv}")
            DeduplicateUtils.output_as_csv(warnings, outcsv)
            DeduplicateUtils.write_to_json(warnings, outcsv.replace('.csv', '.json'))

            
def compute_max_config(warnings):
    """
    Given a list of warnings, computes the number of configurations
    that we should compare against to make our guess as to whether
    a bug is a variability bug.

    Insetad of providing the successful configurations
    as a potentially incorrect field in the config file,
    let's compute it programmatically.
    """

    configs_master = [set(w.configs) for w in warnings]
    configs = set()
    for c in configs_master:
        configs = configs.union(c)

    return len(configs)
    
    
if __name__ == "__main__":
    main()
