# Getting-and-Cleaning-Data-Project
Coursera's Getting and Cleaning Data course project

#Raw Data

Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

Full description of the database:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Data used for the analysis:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

#run_analysis.R

R script that:  
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names. 
- Exports an independent tidy data set with the average of each variable for each activity and each subject.

#CodeBook.md

The CodeBook.md file explains all the transformations performed in the raw data.
