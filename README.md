

---
title: "Readme for Getting Data Course"
author: "jperales"
date: "January 2015"
output: html_document
---


 
## Summary
### Create one R script called run_analysis.R that does the following:

    1. Merges the training and the test sets to create one data set.
    2. Extracts only the measurements on the mean and standard deviation for each measurement.
    3. Uses descriptive activity names to name the activities in the data set
    4. Appropriately labels the data set with descriptive activity names.
    5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### General steps to work on this course project

    Download the data source and put into a folder on your local drive. You'll have a UCI HAR Dataset folder.
    The run_analysis.R script needs to be in the parent folder of UCI HAR Dataset, then set the parent folder as your  working directory
    using setwd() function.
    
    Enter and Run source("run_analysis.R"), that it will generate a file named tiny_data.txt in your working directory.

### Dependencies

run_analysis.R file has the install package and library function for reshape2 and data.table. If you have an issue use install.packages("reshape2") and install.package("data.table").