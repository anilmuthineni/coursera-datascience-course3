# Getting and Cleaning Data Course Project

## Project Statement

One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data available at the link https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip is collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained, at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Solution
### Required packages to run the code
"data.table" package is required to run this project's code.
Please run the following to install the package, if you don't have it installed in your R installation.
 `install.packages("data.table")`

### Steps to run the code
1. Set the working directory to the git repo root
2. Keep the dataset directory "UCI HAR Dataset" extracted from the zip file at the link mentioned in the problem statement, in the current directory.
3. Install "data.table" R package using `install.packages("data.table")` command, if it is not already installed.
4. Run `source("run_analysis.R")`. It will generate the file "tidy_data.txt" with the required results, in the current working directory.