import sys
import deduplicate.bug_report as br
from deduplicate.deduplicate_utils import DeduplicateUtils
import logging
logging.basicConfig(level=logging.DEBUG)
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
    
    for c in config:
        for key, tool in master_tool_list:
            if not config[c][key]:
                logging.warning(f"Location for {tool} reports on target {config[c]} not present.")
                continue
            logging.info(f"Collecting warnings from {tool} on {config[c]}.")
            warnings = DeduplicateUtils.get_bug_dataset(tool, config[c][key], config[c])
            logging.info(f"{len(warnings)} warnings collected. Now deduplicating.")
            warnings = DeduplicateUtils.deduplicate_dataset(warnings)
            logging.info(f"{len(warnings)} unique warnings; adding to master list.")
            master_warnings_list.extend(warnings)

    logging.info(f"{len(master_warnings_list)} bugs found in total.")
    logging.info("Writing to results/warnings.csv")
    DeduplicateUtils.output_as_csv(master_warnings_list, "results/warnings.csv")

if __name__ == "__main__":
    main()
