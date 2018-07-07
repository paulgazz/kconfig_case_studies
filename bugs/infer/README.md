## fbinfer

### Finding Unique Bug Reports

compile_results.sh and list_unique.py produce a unique bug report from a collection of JSON bug reports produced by infer.

#### Usage

With both files in the same subdirectory, call `compile_results.sh` from within the subdirectory containing the infer bug reports (e.g. infer_results). compile_results.sh simply concatenates every report.json file into one temporary master file, reformats it to be one single JSON array, then calls list_unique.py (or another script provided as a command line argument) to process the master file.

list_unique.py can be used alone to deduplicate a single JSON array of infer bug reports. Call

`list_unique.py -i infile (default: master.json) -o outfil (default: unique.json)'

With infile being the master record, and outfile (default unique.json) being the output file. list_unique.py will filter bug reports to only include relevant information, and augment each report with the number of times it occurred in the master.

### Generating the mapping from unique bugs to configurations present

The script generate_mapping.py will take a report of unique bugs, and generate the mapping from unique bug to configurations in which the bug report is present. Call

'generate_mapping.py -i infile (default unique.json) -o outfile (default mapping.json)'

The output file will be an array of JSON objects, each containing the key of the bug, the hash of the bug, and the list of configurations in which the bug was present.

### Verifying fidelity

To verify the fidelity between the number of configurations reported by generate_mapping.py and the number of occurrences reported by list_unique.py, use fidelity.py:

`fidelity.py -u unique (default unique.json) -m mapping (default mapping.json)'

This script will report any discrepancies in those two counts. No output means that no discrepancies were found.