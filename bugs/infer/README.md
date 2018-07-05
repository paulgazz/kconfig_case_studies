## fbinfer

### Finding Unique Bug Reports

compile_results.sh and list_unique.py produce a unique bug report from a collection of JSON bug reports produced by infer.

#### Usage

With both files in the same subdirectory, call `compile_results.sh` from within the subdirectory containing the infer bug reports (e.g. infer_results). compile_results.sh simply concatenates every report.json file into one temporary master file, reformats it to be one single JSON array, then calls list_unique.py (or another script provided as a command line argument) to process the master file.

list_unique.py can be used alone to deduplicate a single JSON array of infer bug reports. Call

`list_unique.py infile outfile'

With infile being the master record, and outfile (default unique.json) being the output file. list_unique.py will filter bug reports to only include relevant information, and augment each report with the number of times it occurred in the master.
