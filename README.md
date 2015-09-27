
---
title: "Getting and Cleaning Data Course Project"
author: "Jean Naude"
date: "27 September 2015"
output: html_document
---
# Getting-and-Cleaning-Data-Course-Project
Course project for Getting and Cleaning Data course of the Data Science specialization

## Objective of Project
The objective of this project is to collect, summarize and clean a data set.  

## Raw Data
The raw data set consists of data collected from the accelerometers and gyroscopes
of 30 subjects wearing Samsung
Galaxy S smartphones and is available from: <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

When this file is downloaded and unzipped it creates the following directory structure:

UCI HAR Dataset  
&nbsp;&nbsp;&nbsp;&nbsp;\\test  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\\Inertial Signals  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;subject_test.txt  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;X_text.txt  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;y_test.txt  
&nbsp;&nbsp;&nbsp;&nbsp;\\train  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\\Inertial Signals  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;subject_train.txt  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;X_train.txt  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;y_train.txt  
&nbsp;&nbsp;&nbsp;&nbsp;activity_labels.txt  
&nbsp;&nbsp;&nbsp;&nbsp;features.txt  
&nbsp;&nbsp;&nbsp;&nbsp;features_info.txt  

A full description of the raw data can be found at
<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>.

## Analysis script
The R script file run_analysis.R contains the function run_analysis which reads
the raw data and does the following:

1.  Merges the training and the test sets to create one data set.
2.  Extracts only the measurements on the mean and standard deviation 
    for each measurement. 
3.  Uses descriptive activity names to name the activities in the data set
4.  Appropriately labels the data set with descriptive variable names. 
5.  From the data set in step 4, creates a second, independent tidy data set with 
    the average of each variable for each activity and each subject.  
From <https://class.coursera.org/getdata-032/human_grading/view/courses/975116/assessments/3/submissions>

### Parameters 
directory = "" :  the directory in which the raw data is to be found, and in which 
 the tidy data set will be saved. The current working directory is used if this
 parameter is omitted.
 
### Output of the script
The output of the function is the tidy data set created in step 5.  The data
set is also saved in a file named "dataSummary.txt" in the directory given by the directory parameter. 

### Further notes on the steps in the processing script
0.  If the directory "UCI HAR Dataset" is not found in the directory 
(see parameters above), then if the raw data zip file is not found, it will be
downloaded.  The raw data zip file is then unzipped.
1.  The training and test data sets each consist of the following files (where
*set* = train or test):
* X_*set*.txt contains the observations for 561 variables
* subject_*set*.txt contains the subject identifier for each of the observations in
X_*set*.txt
* y_*set*.txt contains the codes for the activity for each of the observations
in X_*set*.txt

The subject identifiers and the activity codes are added to the observations as new
columns for both data sets and then the data sets are merged into one data set 
that has 563 variables.

2.  The names of the original 561 variables are found in the features.txt file.  Only
variables that include "mean" or "std" anywhere in their names are retained.
  This results in 79 variables plus the subject number and activity code.
  
3.  The activity names are found in the activity_labels.txt file.  Another
 column is added to the data set with the label corresponding to the activity
 code, resulting in 82 columns.  The original activity codes are retained for
 easier data processing.
 
4.  The variable names given are already human readable, but are not valid R
variable names.  The parentheses in the names are removed and the hyphens are 
replaced by periods.

5.  The averages of each variable for each subject are calculated resulting in
180 observations (30 subjects x 6 activities each).

Please see <https://github.com/JeanNaude/Getting-and-Cleaning-Data-Course-Project/CodeBook.md> for a description of the variables.

### To run the script 
* If the raw data is in the working directory:  
run_anaylsis()

* If the raw data is in another directory:  
run_analysis(directory = "path to raw data")

* If the raw data has not been downloaded or has not been unzipped:  
run_analysis() or run_analysis(directory="path for output")

## Code Book
The code book explaining the variables of the output data set can be found at
<https://github.com/JeanNaude/Getting-and-Cleaning-Data-Course-Project/CodeBook.md>
