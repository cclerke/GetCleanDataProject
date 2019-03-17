## run_analysis

The run_analysis function reads in data from the unzipped data set found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. The function first reads in training and test data for the subjects, activities, and observation data. The training and test data are then combined while still being separated by the subjects, activities, and observation data. The script then reads in the labels for the activities and observations and retains only the mean and standard deviation observation data we were interested in. The subject, activities, and obversation data is then combined and the new variable labels described below are applied.

### Features

- SubjectID: The unique identifier for each volunteer that participated in the study.
- Activity: The activity that the subject participated in.

The observation data column names were retained from the original data source. The description of these features can be found in the features_info.txt file of the original data set.

## get_dataset_averages

The get_dataset_averages function takes in the data set returned by run_analysis and returns the mean for each subject and activity combination.
