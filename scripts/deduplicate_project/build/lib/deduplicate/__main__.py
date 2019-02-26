import sys
import deduplicate.bug_report as br
from deduplicate.deduplicate_utils import DeduplicateUtils
import logging
logging.basicConfig(level=logging.DEBUG)
def main():
    # Goal: read config file, and for each location, get the bugs.
    # Then, dump all of these bugs into a CSV file.
    config = du.read_config_file

    # For convenience in the for loop below
    master_tool_list = (('infer_results', 'infer'),
                        ('cbmc_results', 'cbmc'),
                        ('clang_results', 'clang'),
                        ('ikos_results', 'ikos'),
                        ('cppcheck_results', 'cppcheck'))
                        
    master_warnings_list = list()
    
    for c in config:
        for key, tool in master_tool_list:
            try:
                warnings = DeduplicateUtils.get_bug_dataset(tool, config[c][key])
                warnings = DeduplicateUtils.deduplicate_dataset(warnings)
                master_warnings_list.extend(warnings)
            except ValueError:
                logging.warning(f"Location for {tool} reports on target {config[c]}")
                continue
        
            
            
                                       
    

if __name__ == "__main__":
    main()
