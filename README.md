# getting-and-cleaning-data
This README file describes how run_analysis.R script works.
First, please download the data set needed for this project from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and upzip the file. Please make sure to have the files unzipped and the run_analysis.R script both in the current working directory.
Second, open the run_analysis.R script from the Rstudio and run it. 
Then you will find two text files appear in your working directory: 1) file mergedData.txt: contains a clean data set with 10299x68 dimension; 2) file data_with_means.txt:contains a tidy data set with 180x68 dimension.
Last, use read.table("data_with_means.txt") command in the Rstudio to see the results of the tidy data set.
