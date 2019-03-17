# run_analysis.R

The run_analysis.R file provides two functions.

The first function, run_analysis, creates a tidy data set from the data set found here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. The description of the tidy data set can be found in codebook.md.

The second function, get_dataset_averages, takes in the tidy data set returned by run_analysis and computes the averages for each subject and activity combination.
