# Code Book for Data Cleaning Final Project Datasets

## Introduction
This code book describes two tidy datasets that have been created from the data used in the following study:

> Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012 


The original dataset may be downloaded [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). The `README.txt` file included there details the processing applied to the raw measurements in order to generate the datasets that I have worked with here.

From the full set of data from the study, the script in `run_analysis.R` in this repository creates two tidy datasets, stored here in the `tidy_full.csv` and `tidy_average.csv` files. Both files can be read in R using `read.csv()` with only the filename argument. The script has a single, optional argument specifying the directory path for the source data. If you unzip the downloaded file and run the function in the same directory as the script, the default value of the path will work. Note that the `plyr` and `reshape2` R libraries must be installed (the script will automatically load them).

The full dataset (`tidy_full.csv`) is equivalent to the original dataset for the subset of variables selected. It differs primarily in the fact that it has been gathered into a single tidy table containing all information on all observations. The second dataset (`tidy_average.csv`) contains the average of each measurement for each subject/activity pair.

The processing performed is as follows:

* Create the `tidy_full.csv` dataset
    * Recombine the original training and test datasets, subject IDs and activity codes into a single dataframe, replacing the activity codes with their descriptive string equivalents from the `activity_labels.txt` file. The data is gathered from the following files: `test/X_test.txt`, `train/X_train.txt`, `test/y_test.txt`, `train/y_train.txt`, `test/subject_test.txt`, `train/subject_train.txt`.
    * Extract only the mean and standard deviation variables for each measurement (i.e., those labeled with either `-mean()` or `-std()`).
    * Rename all the variables with more readable, descriptive variable names.
    * Write out the resulting dataset as `tidy_full.csv`
* Create the `tidy_average.csv` dataset
    * Use the `melt()` function from the `reshape2` library to transform the wide-form dataset (one column per measurement variable) into a narrow-form one (one column for variable name and one for its value).
    * Use the `ddply()` function from the `plyr` library to compute the mean of each measurement variable for each subject/activity combination.
    * Write out the resulting dataset as `tidy_average.csv`

## Variables

The measurements here were derived from smart phone accelerometer and gyroscope signals. The signals were processed to produce vector components and magnitude for body linear acceleration, angular velocity, gravity acceleration, and body jerk (the rate of change of the acceleration). A Fast Fourier Transform (FFT) was applied to some of the signals to produce frequency-domain measurements as well. The details of signal processing are available in the `features_info.txt' file accompanying the original dataset.

### ID Variables

#### subject

The `subject` variable is an integer ID ranging from 1 to 30 for each of the 30 participants in the subject.

#### activity

The `activity` variable is a string indicating the activity being performed when a measurement was taken. The values are `laying`, `sitting`, `standing`, `walking`, `walking_downstairs`, and `walking_upstairs`.

### Body Acceleration Measurements
Acceleration measurements are in standard gravity units 'g'.

#### body.acceleration.time.x.mean
The mean of the X component of the body acceleration in the time domain.
Variable name in original dataset: tBodyAcc-mean()-X

#### body.acceleration.time.x.stddev
The standard deviation of the X component of the body acceleration in the time domain.
Variable name in original dataset: tBodyAcc-std()-X

#### body.acceleration.time.y.mean
The mean of the Y component of the body acceleration in the time domain.
Variable name in original dataset: tBodyAcc-mean()-Y

#### body.acceleration.time.y.stddev
The standard deviation of the Y component of the body acceleration in the time domain.
Variable name in original dataset: tBodyAcc-std()-Y

#### body.acceleration.time.z.mean
The mean of the Y component of the body acceleration in the time domain.
Variable name in original dataset: tBodyAcc-mean()-Z

#### body.acceleration.time.z.stddev
The standard deviation of the Z component of the body acceleration in the time domain.
Variable name in original dataset: tBodyAcc-std()-Z

#### body.acceleration.time.magnitude.mean
The mean of the body acceleration magnitude in the time domain.
Variable name in original dataset: tBodyAccMag-mean()

#### body.acceleration.time.magnitude.stddev
The standard deviation of the body acceleration magnitude in the time domain.
Variable name in original dataset: tBodyAccMag-std()

#### body.acceleration.freq.x.mean
The mean of the X component of the body acceleration in the frequency domain.
Variable name in original dataset: fBodyAcc-mean()-X

#### body.acceleration.freq.x.stddev
The standard deviation of the X component of the body acceleration in the frequency domain.
Variable name in original dataset: fBodyAcc-std()-X

#### body.acceleration.freq.y.mean
The mean of the Y component of the body acceleration in the frequency domain.
Variable name in original dataset: fBodyAcc-mean()-Y

#### body.acceleration.freq.y.stddev
The standard deviation of the Y component of the body acceleration in the frequency domain.
Variable name in original dataset: fBodyAcc-std()-Y

#### body.acceleration.freq.z.mean
The mean of the Y component of the body acceleration in the frequency domain.
Variable name in original dataset: fBodyAcc-mean()-Z

#### body.acceleration.freq.z.stddev
The standard deviation of the Z component of the body acceleration in the frequency domain.
Variable name in original dataset: fBodyAcc-std()-Z

#### body.acceleration.magnitude.freq.mean
The mean of the body acceleration magnitude in the frequency domain.
Variable name in original dataset: fBodyAccMag-mean()

#### body.acceleration.magnitude.freq.stddev
The standard deviation of the body acceleration magnitude in the frequency domain.
Variable name in original dataset: fBodyAccMag-std()


### Body Acceleration Jerk Measurements
Acceleration jerk is the rate of change of the acceleration. Measurements are in standard gravity units 'g' per second.

#### body.acceleration.jerk.time.x.mean
The mean of the X component of the body acceleration jerk in the time domain.
Variable name in original dataset: tBodyAccJerk-mean()-X

#### body.acceleration.jerk.time.x.stddev
The standard deviation of the X component of the body acceleration jerk in the time domain.
Variable name in original dataset: tBodyAccJerk-std()-X

#### body.acceleration.jerk.time.y.mean
The mean of the Y component of the body acceleration jerk in the time domain.
Variable name in original dataset: tBodyAccJerk-mean()-Y

#### body.acceleration.jerk.time.y.stddev
The standard deviation of the Y component of the body acceleration jerk in the time domain.
Variable name in original dataset: tBodyAccJerk-std()-Y

#### body.acceleration.jerk.time.z.mean
The mean of the Z component of the body acceleration jerk in the time domain.
Variable name in original dataset: tBodyAccJerk-mean()-Z

#### body.acceleration.jerk.time.z.stddev
The standard deviation of the Z component of the body acceleration jerk in the time domain.
Variable name in original dataset: tBodyAccJerk-std()-Z

#### body.acceleration.jerk.time.magnitude.mean
The mean of the body acceleration jerk magnitude in the time domain.
Variable name in original dataset: tBodyAccJerkMag-mean()

#### body.acceleration.jerk.time.magnitude.stddev
The standard deviation of the body acceleration jerk magnitude in the time domain.
Variable name in original dataset: tBodyAccJerkMag-std()

#### body.acceleration.jerk.freq.x.mean
The mean of the X component of the body acceleration jerk in the frequency domain.
Variable name in original dataset: fBodyAccJerk-mean()-X

#### body.acceleration.jerk.freq.x.stddev
The standard deviation of the X component of the body acceleration jerk in the frequency domain.
Variable name in original dataset: fBodyAccJerk-std()-X

#### body.acceleration.jerk.freq.y.mean
The mean of the Y component of the body acceleration jerk in the frequency domain.
Variable name in original dataset: fBodyAccJerk-mean()-Y

#### body.acceleration.jerk.freq.y.stddev
The standard deviation of the Y component of the body acceleration jerk in the frequency domain.
Variable name in original dataset: fBodyAccJerk-std()-Y

#### body.acceleration.jerk.freq.z.mean
The mean of the Z component of the body acceleration jerk in the frequency domain.
Variable name in original dataset: fBodyAccJerk-mean()-Z

#### body.acceleration.jerk.freq.z.stddev
The standard deviation of the Z component of the body acceleration jerk in the frequency domain.
Variable name in original dataset: fBodyAccJerk-std()-Z

#### body.acceleration.jerk.magnitude.freq.mean
The mean of the body acceleration jerk magnitude in the frequency domain.
Variable name in original dataset: fBodyAccJerkMag-mean()

#### body.acceleration.jerk.magnitude.freq.stddev
The standard deviation of the body acceleration jerk magnitude in the frequency domain.
Variable name in original dataset: fBodyAccJerkMag-std()

#### body.acceleration.jerk.magnitude.freq.mean
The mean of the body acceleration jerk magnitude in the frequency domain.
Variable name in original dataset: fBodyBodyAccJerkMag-mean()

#### body.acceleration.jerk.magnitude.freq.stddev
The standard deviation of the body acceleration jerk magnitude in the frequency domain.
Variable name in original dataset: fBodyBodyAccJerkMag-std()


### Body Angular Velocity Measurements
Angular velocity measurements are in radians per second.

#### body.angular.velocity.time.x.mean
The mean of the X component of the body angular velocity in the time domain.
Variable name in original dataset: tBodyGyro-mean()-X

#### body.angular.velocity.time.x.stddev
The standard deviation of the X component of the body angular velocity in the time domain.
Variable name in original dataset: tBodyGyro-std()-X

#### body.angular.velocity.time.y.mean
The mean of the Y component of the body angular velocity in the time domain.
Variable name in original dataset: tBodyGyro-mean()-Y

#### body.angular.velocity.time.y.stddev
The standard deviation of the Y component of the body angular velocity in the time domain.
Variable name in original dataset: tBodyGyro-std()-Y

#### body.angular.velocity.time.z.mean
The mean of the Z component of the body angular velocity in the time domain.
Variable name in original dataset: tBodyGyro-mean()-Z

#### body.angular.velocity.time.z.stddev
The standard deviation of the Z component of the body angular velocity in the time domain.
Variable name in original dataset: tBodyGyro-std()-Z

#### body.angular.velocity.time.magnitude.mean
The mean of the body angular velocity magnitude in the time domain.
Variable name in original dataset: tBodyGyroMag-mean()

#### body.angular.velocity.time.magnitude.stddev
The mean of the body angular velocity magnitude in the time domain.
Variable name in original dataset: tBodyGyroMag-std()


#### body.angular.velocity.freq.x.mean
The mean of the X component of the body angular velocity in the frequency domain.
Variable name in original dataset: fBodyGyro-mean()-X

#### body.angular.velocity.freq.x.stddev
The standard deviation of the X component of the body angular velocity in the frequency domain.
Variable name in original dataset: fBodyGyro-std()-X

#### body.angular.velocity.freq.y.mean
The mean of the Y component of the body angular velocity in the frequency domain.
Variable name in original dataset: fBodyGyro-mean()-Y

#### body.angular.velocity.freq.y.stddev
The standard deviation of the Y component of the body angular velocity in the frequency domain.
Variable name in original dataset: fBodyGyro-std()-Y

#### body.angular.velocity.freq.z.mean
The mean of the Z component of the body angular velocity in the frequency domain.
Variable name in original dataset: fBodyGyro-mean()-Z

#### body.angular.velocity.freq.z.stddev
The standard deviation of the Z component of the body angular velocity in the frequency domain.
Variable name in original dataset: fBodyGyro-std()-Z

#### body.angular.velocity.magnitude.freq.mean
The mean of the body angular velocity magnitude in the frequency domain.
Variable name in original dataset: fBodyBodyGyroMag-mean()

#### body.angular.velocity.magnitude.freq.stddev
The standard deviation of the body angular velocity magnitude in the frequency domain.
Variable name in original dataset: fBodyBodyGyroMag-std()

### Body Angular Jerk Measurements
Angular jerk measurements are in radians per second per second.

#### body.angular.jerk.time.x.mean
The mean of the X component of the body angular jerk in the time domain.
Variable name in original dataset: tBodyGyroJerk-mean()-X

#### body.angular.jerk.time.x.stddev
The standard deviation of the X component of the body angular jerk in the time domain.
Variable name in original dataset: tBodyGyroJerk-std()-X

#### body.angular.jerk.time.y.mean
The mean of the Y component of the body angular jerk in the time domain.
Variable name in original dataset: tBodyGyroJerk-mean()-Y

#### body.angular.jerk.time.y.stddev
The standard deviation of the Y component of the body angular jerk in the time domain.
Variable name in original dataset: tBodyGyroJerk-std()-Y

#### body.angular.jerk.time.z.mean
The mean of the Z component of the body angular jerk in the time domain.
Variable name in original dataset: tBodyGyroJerk-mean()-Z

#### body.angular.jerk.time.z.stddev
The standard deviation of the Z component of the body angular jerk in the time domain.
Variable name in original dataset: tBodyGyroJerk-std()-Z

#### body.angular.jerk.time.magnitude.mean
The mean of the body angular jerk magnitude in the time domain.
Variable name in original dataset:  tBodyGyroJerkMag-mean()

#### body.angular.jerk.time.magnitude.stddev
The standard deviation of the body angular jerk magnitude in the time domain.
Variable name in original dataset:  tBodyGyroJerkMag-std()

#### body.angular.jerk.magnitude.freq.mean
The mean of the body angular jerk magnitude in the frequency domain.
Variable name in original dataset:  fBodyBodyGyroJerkMag-mean()

#### body.angular.jerk.magnitude.freq.stddev
The standard deviation of the body angular jerk magnitude in the frequency domain.
Variable name in original dataset:  fBodyBodyGyroJerkMag-std()


### Gravity Acceleration Measurements
Acceleration measurements are in standard gravity units 'g'.

#### gravity.acceleration.time.x.mean
The mean of the X component of the gravity acceleration in the time domain.
Variable name in original dataset: tGravityAcc-mean()-X

#### gravity.acceleration.time.x.stddev
The standard deviation of the X component of the body acceleration in the time domain.
Variable name in original dataset: tGravityAcc-std()-X

#### gravity.acceleration.time.y.mean
The mean of the Y component of the gravity acceleration in the time domain.
Variable name in original dataset: tGravityAcc-mean()-Y

#### gravity.acceleration.time.y.stddev
The standard deviation of the Y component of the body acceleration in the time domain.
Variable name in original dataset: tGravityAcc-std()-Y

#### gravity.acceleration.time.z.mean
The mean of the Z component of the gravity acceleration in the time domain.
Variable name in original dataset: tGravityAcc-mean()-Z

#### gravity.acceleration.time.z.stddev
The standard deviation of the Z component of the body acceleration in the time domain.
Variable name in original dataset: tGravityAcc-std()-Z

#### gravity.acceleration.time.magnitude.mean
The mean of the gravity acceleration magnitude in the time domain.
Variable name in original dataset: tGravityAccMag-mean()

#### gravity.acceleration.time.magnitude.stddev
The standard deviation of the body acceleration magnitude in the time domain.
Variable name in original dataset: tGravityAccMag-std()
