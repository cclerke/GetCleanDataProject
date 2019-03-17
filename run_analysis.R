library(plyr)
library(dplyr)

run_analysis <- function() {
  # Read in training data
  train_subjects <- read.table('train/subject_train.txt')
  train_labels <- read.table('train/y_train.txt')
  train_data <- read.table('train/X_train.txt')
  
  # Read in test data
  test_subjects <- read.table('test/subject_test.txt')
  test_labels <- read.table('test/y_test.txt')
  test_data <- read.table('test/X_test.txt')
  
  # Combine data sets
  all_subjects <- rbind(train_subjects, test_subjects)
  all_labels <- rbind(train_labels, test_labels)
  all_data <- rbind(train_data, test_data)
  
  # Get labels
  activity_labels <- read.table('activity_labels.txt')
  feature_labels <- read.table('features.txt')
  
  # Filter out columns to keep
  column_indices <- grep('mean|std', feature_labels$V2)
  column_names <- grep('mean|std', feature_labels$V2, value=TRUE)
  narrow_data <- select(all_data, column_indices)
  
  # Replace activiy labels
  named_labels <- join(all_labels, activity_labels) %>% select(V2)
  
  # Combine all data together and rename columns
  combined_data <- cbind(all_subjects, named_labels, narrow_data)
  names(combined_data) <- c('SubjectID', 'Activity', c(column_names))
  
  combined_data
}

get_dataset_averages <- function(x) {
  x %>% group_by(SubjectID, Activity) %>% summarize_all(mean)
}