# Here is the data for the project:
#  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# You should create one R script called run_analysis.R that does the following.
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Required package
require("data.table")

# Read the activity labels with their code
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

# Read all input features
all_features <- read.table("./UCI HAR Dataset/features.txt")

# Create a vector of the features we are interested in (those related to
# mean and standard deviation)
selected_features <- all_features[grepl("mean|std", all_features[,2]), 2]
selected_features <- as.character(selected_features)

# Read training data related to selectd features
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
colnames(x_train) <- all_features[,2]
x_train <- x_train[, selected_features]

# Read output labels for training data
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
y_train[,1] = activity_labels[y_train[,1], 2]
colnames(y_train) <- c("Activity_Name")

# Read the training data subjects
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
colnames(subject_train) <- c("subject")

# Merge data related to input features, output labels and subjects into one table
train_data <- cbind(x_train, y_train, subject_train)

# Read training data related to selectd features
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
colnames(x_test) <- all_features[,2]
x_test <- x_test[, selected_features]

# Read output labels for test data
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
y_test[,1] = activity_labels[y_test[,1], 2]
colnames(y_test) <- c("Activity_Name")

# Read the training data subjects
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
colnames(subject_test) <- c("subject")

# Merge data related to input features, output labels and subjects into one table
test_data <- cbind(x_test, y_test, subject_test)

# Merge training data and test data
all_data <- rbind(train_data, test_data)

# Create tidy data corresponding to mean of all selected measurements
# per subject and activity name
tidy_data <- aggregate(all_data[,selected_features], list(subject = all_data$subject, Activity_Name=all_data$Activity_Name), mean)

# Save tidy data to file
write.table(tidy_data, file = "./tidy_data.txt")
