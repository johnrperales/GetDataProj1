## From the project descrition by jperales
## Create one R script called run_analysis.R that does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names.
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.


# Need to install and load packages data.table and reshape2. Using reshape2 over default reshape
# install.packages("data.table")
# install.packages("reshape2")

library("data.table")
library("reshape2")

# Load: activity labels fix working directory issue asap
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]

# Load: features data data column names
featuresData <- read.table("./UCI HAR Dataset/features.txt")[,2]

# Extract only the mean and stddev for each measurement using grep().
extract_featuresData <- grepl("mean|std", featuresData)

# Load and process X_test & y_test data. X_test is the data and y_test are its labels
# X_test is a large file that may take about a minute to process.
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
names(X_test) = featuresData

# Extract only the mean and stddev for each measurement.
X_test = X_test[,extract_featuresData]

# Load test activity labels from x_est, y_test & subject_test DFs
y_test[,2] = activity_labels[y_test[,1]]
names(y_test) = c("Activity_ID", "Activity_Label")
names(subject_test) = "subject"

# column Bind data
test_data <- cbind(as.data.table(subject_test), y_test, X_test)

# Load and process X_train & y_train data. X_train is the data and y_train are its labels
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
names(X_train) = featuresData

# Extract only the mean and stddev for each measurement.
#error on extract check spelling
X_train = X_train[,extract_featuresData]

# Load training activity data
y_train[,2] = activity_labels[y_train[,1]]
names(y_train) = c("Activity_ID", "Activity_Label")
names(subject_train) = "subject"

# col Bind data
train_data <- cbind(as.data.table(subject_train), y_train, X_train)

# Merge test and train data
data = rbind(test_data, train_data)
id_labels = c("subject", "Activity_ID", "Activity_Label")
data_labels = setdiff(colnames(data), id_labels)
moltenData = melt(data, id = id_labels, measure.vars = data_labels)

# Apply mean function to dataset using dcast function from reshape2 package
tidy_data = dcast(moltenData, subject + Activity_Label ~ variable, mean)
write.table(tidy_data, file = "./tidy_data.txt")