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

#### body.acceleration.x.time.mean
The mean of the X component of the body acceleration in the time domain.

- __Min:__ -1.0, __Max:__ 1.0, __Median:__ 0.2772

#### body.acceleration.x.time.stddev
The standard deviation of the X component of the body acceleration in the time domain.

- __Min:__ -1.0, __Max:__ 1.0, __Median:__ -0.9430

#### body.acceleration.y.time.mean
The mean of the Y component of the body acceleration in the time domain.

- __Min:__ -1.0, __Max:__ 1.0, __Median:__ -0.01716

#### body.acceleration.y.time.stddev
The standard deviation of the Y component of the body acceleration in the time domain.

- __Min:__ -1.0, __Max:__ 1.0, __Median:__ -0.83503

#### body.acceleration.z.time.mean
The mean of the Y component of the body acceleration in the time domain.

- __Min:__ -1.0, __Max:__ 1.0, __Median:__ -0.10860

#### body.acceleration.z.time.stddev
The standard deviation of the Z component of the body acceleration in the time domain.

- __Min:__ -1.0, __Max:__ 1.0, __Median:__ -0.8508

#### body.acceleration.magnitude.time.mean
The mean of the body acceleration magnitude in the time domain.

- __Min:__ -1.0, __Max:__ 1.0, __Median:__ -0.8746

#### body.acceleration.magnitude.time.stddev
The standard deviation of the body acceleration magnitude in the time domain.

- __Min:__ -1.0, __Max:__ 1.0, __Median:__ -0.8437



### Gravity Acceleration Measurements
Acceleration measurements are in standard gravity units 'g'.

#### gravity.acceleration.x.time.mean
The mean of the X component of the gravity acceleration in the time domain.

- __Min:__ -1.0, __Max:__ 1.0, __Median:__ 0.9218

#### gravity.acceleration.x.time.stddev
The standard deviation of the X component of the body acceleration in the time domain.

- __Min:__ -1.0, __Max:__ 1.0, __Median:__ -0.9819

#### gravity.acceleration.y.time.mean
The mean of the Y component of the gravity acceleration in the time domain.

- __Min:__ -1.0, __Max:__ 1.0, __Median:__ -0.143551

#### gravity.acceleration.y.time.stddev
The standard deviation of the Y component of the body acceleration in the time domain.

- __Min:__ -1.0, __Max:__ 1.0, __Median:__ -0.9759

#### gravity.acceleration.z.time.mean
The mean of the Z component of the gravity acceleration in the time domain.

- __Min:__ -1.0, __Max:__ 1.0, __Median:__ 0.03680

#### gravity.acceleration.z.time.stddev
The standard deviation of the Z component of the body acceleration in the time domain.

#### gravity.acceleration.magnitude.time.mean
The mean of the gravity acceleration magnitude in the time domain.

- __Min:__ -1.0, __Max:__ 1.0, __Median:__ -0.8746

#### gravity.acceleration.magnitude.time.stddev
The standard deviation of the body acceleration magnitude in the time domain.

- __Min:__ -1.0, __Max:__ 1.0, __Median:__ -0.8437



### Body Acceleration Jerk Measurements

Acceleration jerk is the rate of change of the acceleration. Measurements are in standard gravity units 'g' per second.

#### body.acceleration.jerk.x.time.mean
The mean of the X component of the body acceleration jerk in the time domain.

- __Min:__ -1.0, __Max:__ 1.0, __Median:__ 0.07597

#### body.acceleration.jerk.x.time.stddev
The standard deviation of the X component of the body acceleration jerk in the time domain.

- __Min:__ -1.0, __Max:__ 1.0, __Median:__ -0.9513

#### body.acceleration.jerk.y.time.mean
The mean of the Y component of the body acceleration jerk in the time domain.

- __Min:__ -1.0, __Max:__ 1.0, __Median:__ 0.010753

#### body.acceleration.jerk.y.time.stddev
The standard deviation of the Y component of the body acceleration jerk in the time domain.

- __Min:__ -1.0, __Max:__ 1.0, __Median:__ -0.9250

#### body.acceleration.jerk.z.time.mean
The mean of the Z component of the body acceleration jerk in the time domain.

- __Min:__ -1.0, __Max:__ 1.0, __Median:__ -0.001159

#### body.acceleration.jerk.z.time.stddev
The standard deviation of the Z component of the body acceleration jerk in the time domain.

- __Min:__ -1.0, __Max:__ 1.0, __Median:__ -0.9543

#### body.acceleration.jerk.magnitude.time.mean
The mean of the body acceleration jerk magnitude in the time domain.
- __Min:__ -1.0, __Max:__ 1.0, __Median:__ -0.9481

#### body.acceleration.jerk.magnitude.time.stddev
The standard deviation of the body acceleration jerk magnitude in the time domain.
- __Min:__ -1.0, __Max:__ 1.0, __Median:__ -0.9288
 

### Body Angular Velocity Measurements

Angular velocity measurements are in radians per second.

#### body.angular.velocity.x.time.mean
The mean of the X component of the body angular velocity in the time domain.

- __Min:__ -1.0, __Max:__ 1.0, __Median:__ -0.02776

#### body.angular.velocity.x.time.stddev
The standard deviation of the X component of the body angular velocity in the time domain.

- __Min:__ -1.0, __Max:__ 1.0, __Median:__ -0.9016

#### body.angular.velocity.y.time.mean
The mean of the Y component of the body angular velocity in the time domain.

- __Min:__ -1.0, __Max:__ 1.0, __Median:__ -0.07477

#### body.angular.velocity.y.time.stddev
The standard deviation of the Y component of the body angular velocity in the time domain.

- __Min:__ -1.0, __Max:__ 1.0, __Median:__ -0.9106

#### body.angular.velocity.z.time.mean
The mean of the Z component of the body angular velocity in the time domain.

- __Min:__ -1.0, __Max:__ 1.0, __Median:__ 0.08626

#### body.angular.velocity.z.time.stddev
The standard deviation of the Z component of the body angular velocity in the time domain.

- __Min:__ -1.0, __Max:__ 1.0, __Median:__ -0.8819

### Body Angular Jerk Measurements

Angular jerk measurements are in radians per second per second.

#### body.angular.jerk.x.time.mean
The mean of the X component of the body angular jerk in the time domain.

- __Min:__ -1.0, __Max:__ 1.0, __Median:__ -0.09824

#### body.angular.jerk.x.time.stddev
The standard deviation of the X component of the body angular jerk in the time domain.

- __Min:__ -1.0, __Max:__ 1.0, __Median:__ -0.9348

#### body.angular.jerk.y.time.mean
The mean of the Y component of the body angular jerk in the time domain.

- __Min:__ -1.0, __Max:__ 1.0, __Median:__ -0.04056

#### body.angular.jerk.y.time.stddev
The standard deviation of the Y component of the body angular jerk in the time domain.

- __Min:__ -1.0, __Max:__ 1.0, __Median:__ -0.9548

#### body.angular.jerk.z.time.mean
The mean of the Z component of the body angular jerk in the time domain.

- __Min:__ -1.0, __Max:__ 1.0, __Median:__ -0.05455

#### body.angular.jerk.z.time.stddev
The standard deviation of the Z component of the body angular jerk in the time domain.

- __Min:__ -1.0, __Max:__ 1.0, __Median:__ -0.9503


body linear acceleration and body angular velocity 
           
                        
                        
 body.gyro.magnitude.time.mean body.gyro.magnitude.time.stddev body.gyro.jerk.time.mean
 Min.   :-1.0000               Min.   :-1.0000                 Min.   :-1.0000         
 Median :-0.8223               Median :-0.8259                 Median :-0.9559         
 Max.   : 1.0000               Max.   : 1.0000                 Max.   : 1.0000         
 body.gyro.jerk.time.stddev body.acceleration.x.freq.mean body.acceleration.y.freq.mean
 Min.   :-1.0000            Min.   :-1.0000               Min.   :-1.0000              
 Median :-0.9403            Median :-0.9456               Median :-0.8643              
 Max.   : 1.0000            Max.   : 1.0000               Max.   : 1.0000              
 body.acceleration.z.freq.mean body.acceleration.x.freq.stddev body.acceleration.y.freq.stddev
 Min.   :-1.0000               Min.   :-1.0000                 Min.   :-1.00000               
 Median :-0.8954               Median :-0.9416                 Median :-0.83261               
 Max.   : 1.0000               Max.   : 1.0000                 Max.   : 1.00000               
 body.acceleration.z.freq.stddev body.acceleration.jerk.x.freq.mean body.acceleration.jerk.y.freq.mean
 Min.   :-1.0000                 Min.   :-1.0000                    Min.   :-1.0000                   
 Median :-0.8398                 Median :-0.9516                    Median :-0.9257                   
 Max.   : 1.0000                 Max.   : 1.0000                    Max.   : 1.0000                   
 body.acceleration.jerk.z.freq.mean body.acceleration.jerk.x.freq.stddev body.acceleration.jerk.y.freq.stddev
 Min.   :-1.0000                    Min.   :-1.0000                      Min.   :-1.0000                     
 Median :-0.9475                    Median :-0.9562                      Median :-0.9280                     
 Max.   : 1.0000                    Max.   : 1.0000                      Max.   : 1.0000                     
 body.acceleration.jerk.z.freq.stddev body.gyro.x.freq.mean body.gyro.y.freq.mean body.gyro.z.freq.mean
 Min.   :-1.0000                      Min.   :-1.0000       Min.   :-1.0000       Min.   :-1.0000      
 Median :-0.9590                      Median :-0.8917       Median :-0.9197       Median :-0.8877      
 Max.   : 1.0000                      Max.   : 1.0000       Max.   : 1.0000       Max.   : 1.0000      
 body.gyro.x.freq.stddev body.gyro.y.freq.stddev body.gyro.z.freq.stddev body.acceleration.magnitude.freq.mean
 Min.   :-1.0000         Min.   :-1.0000         Min.   :-1.0000         Min.   :-1.0000                      
 Median :-0.9053         Median :-0.9061         Median :-0.8915         Median :-0.8755                      
 Max.   : 1.0000         Max.   : 1.0000         Max.   : 1.0000         Max.   : 1.0000                      
 body.acceleration.magnitude.freq.stddev body.body.acceleration.jerk.magnitude.freq.mean
 Min.   :-1.0000                         Min.   :-1.0000                                
 Median :-0.8547                         Median :-0.9290                                
 Max.   : 1.0000                         Max.   : 1.0000                                
 body.body.acceleration.jerk.magnitude.freq.stddev body.body.gyro.magnitude.freq.mean
 Min.   :-1.0000                                   Min.   :-1.0000                   
 Median :-0.9255                                   Median :-0.8756                   
 Max.   : 1.0000                                   Max.   : 1.0000                   
 body.body.gyro.magnitude.freq.stddev body.body.gyro.jerk.magnitude.freq.mean
 Min.   :-1.0000                      Min.   :-1.0000                        
 Median :-0.8275                      Median :-0.9453                        
 Max.   : 1.0000                      Max.   : 1.0000                        
 body.body.gyro.jerk.magnitude.freq.stddev
 Min.   :-1.0000                          
 Median :-0.9382                          
 Max.   : 1.0000                          
