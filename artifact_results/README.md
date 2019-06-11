# Structure

artifact_results/ : where all of our results are. In the root are the deduplicated files, named with the tool and program combination

artifact_results/excel : the excel tables we used

artifact_results/comparison : the comparison files

artifact_results/comparison/base_minus_sample : the files including bugs that were found by the base cases (min/max/default) but not the sample. Sorted into min/max/default folders.

artifact_results/comparison/sample_minus_base : the files including bugs that were found by the sample but not by the base cases. Organized in the same way as above.

artifact_results/minimal : the files detailing the the minimal configuration sets we found, including information about each iteration of the algorithm

# Figure Mappings

## Where are the automatic feature mappings?

These results were generated using an older version of the tool where the automatic feature extraction step was not yet into the deduplicate_project. As such, to save time, we only extracted features on the verified bugs. So, although these results do not include the automatic features, they are included in the [bug dataset](./excel/bug_dataset.xlsx)
