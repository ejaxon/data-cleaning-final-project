# Code Book for Data Cleaning Final Project Datasets

## Introduction
This code book describes two tidy datasets that have been created from the data used in the following study:

> Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012 


The original dataset may be downloaded [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). The ````README.txt```` file included there details the processing applied to the raw measurements in order to generate the datasets that I have worked with here.

From the full set of data from the study, the script in ````run_analysis.R```` in this repository creates two tidy datasets, stored here in the ````tidy_full.csv```` and ````tidy_average.csv```` files. Both files can be read in R using ````read.csv()```` with only the filename argument. The script has a single, optional argument specifying the directory path for the source data. If you unzip the downloaded file and run the function in the same directory as the script, the default value of the path will work. Note that the ````plyr```` and ````reshape2```` R libraries must be installed (the script will automatically load them).

The processing performed is as follows:

* Create the ````tidy_full.csv```` dataset
    * Recombine the original training and test datasets, subject IDs and activity codes into a single dataframe, replacing the activity codes with their descriptive string equivalents from the ````activity_labels.txt```` file. The data is gathered from the following files: ````test/X_test.txt, train/X_train.txt, test/y_test.txt, train/y_train.txt, test/subject_test.txt, train/subject_train.txt````.
    * Extract only measurements on the mean and standard deviation for each measurement (i.e., those labeled with either ````-mean()```` or ````-std()````).
    * Rename all the variables with more readable, descriptive variable names.
    * Write out the resulting dataset as tidy_full.csv
* Create the ````tidy_average.csv```` dataset
    * Use the ````melt```` function from the ````reshape2```` library to transform the wide-form dataset (one column per measurement variable) into a narrow-form one (one column for variable name and one for it's value).
    * Use the ````ddply```` function from the ````plyr```` library to compute the mean of each measurement variable for each subject/activity combination.
    * Write out the resulting dataset as tidy_average.csv

## Variables


