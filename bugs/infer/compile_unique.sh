# Written by Austin Mordahl
# 2018-07-04
# Run this script from inside infer_results/, in the same directory as the infer_*.config directories.

PYSCRIPT=${2:-list_unique.py}
OUTPUT=${1:-unique.json}

echo 'Usage: ./compile_unique.sh OUTPUT (default:unique.json) PYSCRIPT (default:list_unique.py)'
# Find all of the "report.json" files and compile them into one file.
echo "Compiling bug reports into one file."
find -type f -name "report.json" -exec cat {} + > master.json
echo "Done."
echo "Formatting master file."
# Correctly format the master file for processing (make into one single JSON array)
sed 's/^\[//' master.json > temp1.json
sed 's/\]$/,/' temp1.json > temp2.json
sed '1s/^/\[/' temp2.json > temp1.json
sed '$s/\,$/\]/' temp1.json > master.json
echo "Done."
# Remove temporary files
rm temp1.json temp2.json

# Call python script to generate unique files
echo "Processing bug reports. This may take a while."
python $PYSCRIPT -i master.json -o $OUTPUT

rm master.json
