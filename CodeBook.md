---
title: "CodeBook.md"
date: "January 2015"
output: html_document
---

#CodeBook

This CodeBbook will describe the variables, the data, and steps that were taken to "tidy up" and Merge data.

#The Data Sources and Description

Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Original description of the dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

#Data Set Information
### Citation can be seen at http://archive.ics.uci.edu/ml/citation_policy.html

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

#The data
###The dataset includes the following files:

* 'README.txt'

* 'features_info.txt': description for the variables used in the feature data.

* 'features.txt': List of all features.

* 'activity_labels.txt': Links the class labels with their activity name.

* 'test/X_test.txt': Test set.

* 'test/y_test.txt': Test labels.

* 'train/X_train.txt': Training set.

* 'train/y_train.txt': Training labels.


#High-level Steps Taken to Transform the Data

1. Install and load reshape2 and data.table packages.

2. Downlaod and merge the training and the test sets to create one data set.

3. Extracts only the measurements on the mean and stddev for each discrete measurement.

4. Use descriptive activity names to name the activities in the data set.

5. Label the data set with descriptive activity names.

6. Creates a second, independent tidy data set with the average of each var by unique activity and subject.

7. Load both test and train data.

8. Load the features and activity labels.

9. Extract the mean and standard deviation column names and data.

10. Process the data. There are two parts processing test and train data respectively.

11. Merge data set create output file.