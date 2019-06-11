# Structure

artifact_results/ : where all of our results are. In the root are the deduplicated files, named with the tool and program combination

artifact_results/excel : the excel tables we used

artifact_results/comparison : the comparison files

artifact_results/comparison/base_minus_sample : the files including bugs that were found by the base cases (min/max/default) but not the sample. Sorted into min/max/default folders.

artifact_results/comparison/sample_minus_base : the files including bugs that were found by the sample but not by the base cases. Organized in the same way as above.

artifact_results/minimal : the files detailing the the minimal configuration sets we found, including information about each iteration of the algorithm

# Figure Mappings

This section details where the data that generated each figure are.

Figures 4 and 5 ./excel/all_\*.xlsx, ./excel/axtls_toybox_cbmc.xlsx

Figure 6: ./excel/subset_config_dist.xlsx

Figure 8: ./excel/bug_dataset.xlsx

## Where are the automatic feature mappings?

We include here the original results we had when we submitted the paper, at which time automatic feature extraction was still a separate step and performed only on the verified bugs. So, while there are automatic features in [the bug dataset](./excel/bug_dataset.xlsx), the top-level CSV and JSON files are missing this field. However, the deduplication tool now has automatic feature extraction integrated into it, so any CSV and JSON files generated now will include that field.
