## This is a CodeBook file

This file contains the basic information of the data set and variables used in the run_analysis.R script and the summary of some calculations.

 * The site where the data was obtained:
    http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
 * The data for the project:
    https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

 * Below is the list of variables used in the R script

  * 'features_info.txt': Shows information about the variables used on the feature vector.

  * 'features.txt': List of all features.

  * 'activity_labels.txt': Links the class labels with their activity name.

  * 'train/X_train.txt': Training set.

  * 'train/y_train.txt': Training labels.

  * 'test/X_test.txt': Test set.

  * 'test/y_test.txt': Test labels.

  * 'sub_test/train.txt': test/train subject files.

 * Some summaries of the major steps:

  * combine train and test subject files and store them in the new file  combinedSubject

  * combine train and test activity files and store them in the new file combinedLabel

  * combine train and test measurement files and store them in the new file combinedData

  * use grep function to search mean and standard deviation measurements in the feature.txt file (66 related measurements found)

  * only grabbing the mean and standard deviation measurements from the data (see only 66 columns left, corresponding to the 66 measurements found in the previous step)

  * use gsub function to replace messy names with cleaner one, making small adjustments

  * remove "_"and lowercase the activity names

  * use toupper and stubstr functions to upcase the "u" and "d" letter in word "walkingupdstairs" and "walkingdownstair" respectively

  * apply 6 activity names to the column in the combinedLabel data table
rename the column 2 in combinedLabel to "activity" and rename to column 2 in combinedSubject to "subject"

  * column-bind all the 3 data tables into the mergedData file. now the new mergedData data table contains 10299 rows and 68 columns. use read .table("merged_data_table") to see this data set

  * generate a second independent tidy data set with the average of each measurement for each activity and each subject. Have 30 unique subjects and 6 unique activities, which result in a 180 combinations of the two. For each combination, calculate the mean of each measurement with the corresponding combination. Write the for loop functions to get a 180x68 data frame.

  * use read.table("data_with_means.txt") command to see this tidy data set.

