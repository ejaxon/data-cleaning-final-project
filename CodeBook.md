# Code Book for Data Cleaning Final Project Datasets

## Introduction
This code book describes two tidy datasets that have been created from the data used in the following study:

> Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012 


The original dataset may be downloaded [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). The `README.txt` file included there details the processing applied to the raw measurements in order to generate the datasets that I have worked with here.

From the full set of data from the study, the script in `run_analysis.R` in this repository creates two tidy datasets, stored here in the `tidy_full.csv` and `tidy_average.csv` files. Both files can be read in R using `read.csv()` with only the filename argument. The script has a single, optional argument specifying the directory path for the source data. If you unzip the downloaded file and run the function in the same directory as the script, the default value of the path will work. Note that the `plyr` and `reshape2` R libraries must be installed (the script will automatically load them).

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

#### Subject

The `subject` variable is an integer ID ranging from 1 to 30 for each of the 30 participants in the subject.

#### Activity

The `activity` variable is a string indicating the activity being performed when a measurement was taken. The values are `laying`, `sitting`, `standing`, `walking`, `walking_downstairs`, and `walking_upstairs`.


### Body Acceleration Measurements
Blah

### Body Acceleration Jerk Measurements

### Gravity Acceleration Measurements

body linear acceleration and angular velocity 
Body Angular Velocity  = gyro

Blah

summary(x)
body.acceleration.x.time.mean body.acceleration.y.time.mean
Min.   :-1.0000               Min.   :-1.00000             
1st Qu.: 0.2626               1st Qu.:-0.02490             
Median : 0.2772               Median :-0.01716             
Mean   : 0.2743               Mean   :-0.01774             
3rd Qu.: 0.2884               3rd Qu.:-0.01062             
Max.   : 1.0000               Max.   : 1.00000             
 body.acceleration.z.time.mean body.acceleration.x.time.stddev body.acceleration.y.time.stddev
 Min.   :-1.00000              Min.   :-1.0000                 Min.   :-1.00000               
 1st Qu.:-0.12102              1st Qu.:-0.9924                 1st Qu.:-0.97699               
 Median :-0.10860              Median :-0.9430                 Median :-0.83503               
 Mean   :-0.10892              Mean   :-0.6078                 Mean   :-0.51019               
 3rd Qu.:-0.09759              3rd Qu.:-0.2503                 3rd Qu.:-0.05734               
 Max.   : 1.00000              Max.   : 1.0000                 Max.   : 1.00000               
 body.acceleration.z.time.stddev gravity.acceleration.x.time.mean gravity.acceleration.y.time.mean
 Min.   :-1.0000                 Min.   :-1.0000                  Min.   :-1.000000               
 1st Qu.:-0.9791                 1st Qu.: 0.8117                  1st Qu.:-0.242943               
 Median :-0.8508                 Median : 0.9218                  Median :-0.143551               
 Mean   :-0.6131                 Mean   : 0.6692                  Mean   : 0.004039               
 3rd Qu.:-0.2787                 3rd Qu.: 0.9547                  3rd Qu.: 0.118905               
 Max.   : 1.0000                 Max.   : 1.0000                  Max.   : 1.000000               
 gravity.acceleration.z.time.mean gravity.acceleration.x.time.stddev gravity.acceleration.y.time.stddev
 Min.   :-1.00000                 Min.   :-1.0000                    Min.   :-1.0000                   
 1st Qu.:-0.11671                 1st Qu.:-0.9949                    1st Qu.:-0.9913                   
 Median : 0.03680                 Median :-0.9819                    Median :-0.9759                   
 Mean   : 0.09215                 Mean   :-0.9652                    Mean   :-0.9544                   
 3rd Qu.: 0.21621                 3rd Qu.:-0.9615                    3rd Qu.:-0.9464                   
 Max.   : 1.00000                 Max.   : 1.0000                    Max.   : 1.0000                   
 gravity.acceleration.z.time.stddev body.acceleration.jerk.x.time.mean body.acceleration.jerk.y.time.mean
 Min.   :-1.0000                    Min.   :-1.00000                   Min.   :-1.000000                 
 1st Qu.:-0.9866                    1st Qu.: 0.06298                   1st Qu.:-0.018555                 
 Median :-0.9665                    Median : 0.07597                   Median : 0.010753                 
 Mean   :-0.9389                    Mean   : 0.07894                   Mean   : 0.007948                 
 3rd Qu.:-0.9296                    3rd Qu.: 0.09131                   3rd Qu.: 0.033538                 
 Max.   : 1.0000                    Max.   : 1.00000                   Max.   : 1.000000                 
 body.acceleration.jerk.z.time.mean body.acceleration.jerk.x.time.stddev body.acceleration.jerk.y.time.stddev
 Min.   :-1.000000                  Min.   :-1.0000                      Min.   :-1.0000                     
 1st Qu.:-0.031552                  1st Qu.:-0.9913                      1st Qu.:-0.9850                     
 Median :-0.001159                  Median :-0.9513                      Median :-0.9250                     
 Mean   :-0.004675                  Mean   :-0.6398                      Mean   :-0.6080                     
 3rd Qu.: 0.024578                  3rd Qu.:-0.2912                      3rd Qu.:-0.2218                     
 Max.   : 1.000000                  Max.   : 1.0000                      Max.   : 1.0000                     
 body.acceleration.jerk.z.time.stddev body.gyro.x.time.mean body.gyro.y.time.mean body.gyro.z.time.mean
 Min.   :-1.0000                      Min.   :-1.00000      Min.   :-1.00000      Min.   :-1.00000     
 1st Qu.:-0.9892                      1st Qu.:-0.04579      1st Qu.:-0.10399      1st Qu.: 0.06485     
 Median :-0.9543                      Median :-0.02776      Median :-0.07477      Median : 0.08626     
 Mean   :-0.7628                      Mean   :-0.03098      Mean   :-0.07472      Mean   : 0.08836     
 3rd Qu.:-0.5485                      3rd Qu.:-0.01058      3rd Qu.:-0.05110      3rd Qu.: 0.11044     
 Max.   : 1.0000                      Max.   : 1.00000      Max.   : 1.00000      Max.   : 1.00000     
 body.gyro.x.time.stddev body.gyro.y.time.stddev body.gyro.z.time.stddev body.gyro.jerk.x.time.mean
 Min.   :-1.0000         Min.   :-1.0000         Min.   :-1.0000         Min.   :-1.00000          
 1st Qu.:-0.9872         1st Qu.:-0.9819         1st Qu.:-0.9850         1st Qu.:-0.11723          
 Median :-0.9016         Median :-0.9106         Median :-0.8819         Median :-0.09824          
 Mean   :-0.7212         Mean   :-0.6827         Mean   :-0.6537         Mean   :-0.09671          
 3rd Qu.:-0.4822         3rd Qu.:-0.4461         3rd Qu.:-0.3379         3rd Qu.:-0.07930          
 Max.   : 1.0000         Max.   : 1.0000         Max.   : 1.0000         Max.   : 1.00000          
 body.gyro.jerk.y.time.mean body.gyro.jerk.z.time.mean body.gyro.jerk.x.time.stddev body.gyro.jerk.y.time.stddev
 Min.   :-1.00000           Min.   :-1.00000           Min.   :-1.0000              Min.   :-1.0000             
 1st Qu.:-0.05868           1st Qu.:-0.07936           1st Qu.:-0.9907              1st Qu.:-0.9922             
 Median :-0.04056           Median :-0.05455           Median :-0.9348              Median :-0.9548             
 Mean   :-0.04232           Mean   :-0.05483           Mean   :-0.7313              Mean   :-0.7861             
 3rd Qu.:-0.02521           3rd Qu.:-0.03168           3rd Qu.:-0.4865              3rd Qu.:-0.6268             
 Max.   : 1.00000           Max.   : 1.00000           Max.   : 1.0000              Max.   : 1.0000             
 body.gyro.jerk.z.time.stddev body.acceleration.magnitude.time.mean body.acceleration.magnitude.time.stddev
 Min.   :-1.0000              Min.   :-1.0000                       Min.   :-1.0000                        
 1st Qu.:-0.9926              1st Qu.:-0.9819                       1st Qu.:-0.9822                        
 Median :-0.9503              Median :-0.8746                       Median :-0.8437                        
 Mean   :-0.7399              Mean   :-0.5482                       Mean   :-0.5912                        
 3rd Qu.:-0.5097              3rd Qu.:-0.1201                       3rd Qu.:-0.2423                        
 Max.   : 1.0000              Max.   : 1.0000                       Max.   : 1.0000                        
 gravity.acceleration.magnitude.time.mean gravity.acceleration.magnitude.time.stddev
 Min.   :-1.0000                          Min.   :-1.0000                           
 1st Qu.:-0.9819                          1st Qu.:-0.9822                           
 Median :-0.8746                          Median :-0.8437                           
 Mean   :-0.5482                          Mean   :-0.5912                           
 3rd Qu.:-0.1201                          3rd Qu.:-0.2423                           
 Max.   : 1.0000                          Max.   : 1.0000                           
 body.acceleration.jerk.magnitude.time.mean body.acceleration.jerk.magnitude.time.stddev
 Min.   :-1.0000                            Min.   :-1.0000                             
 1st Qu.:-0.9896                            1st Qu.:-0.9907                             
 Median :-0.9481                            Median :-0.9288                             
 Mean   :-0.6494                            Mean   :-0.6278                             
 3rd Qu.:-0.2956                            3rd Qu.:-0.2733                             
 Max.   : 1.0000                            Max.   : 1.0000                             
 body.gyro.magnitude.time.mean body.gyro.magnitude.time.stddev body.gyro.jerk.time.mean
 Min.   :-1.0000               Min.   :-1.0000                 Min.   :-1.0000         
 1st Qu.:-0.9781               1st Qu.:-0.9775                 1st Qu.:-0.9923         
 Median :-0.8223               Median :-0.8259                 Median :-0.9559         
 Mean   :-0.6052               Mean   :-0.6625                 Mean   :-0.7621         
 3rd Qu.:-0.2454               3rd Qu.:-0.3940                 3rd Qu.:-0.5499         
 Max.   : 1.0000               Max.   : 1.0000                 Max.   : 1.0000         
 body.gyro.jerk.time.stddev body.acceleration.x.freq.mean body.acceleration.y.freq.mean
 Min.   :-1.0000            Min.   :-1.0000               Min.   :-1.0000              
 1st Qu.:-0.9922            1st Qu.:-0.9913               1st Qu.:-0.9792              
 Median :-0.9403            Median :-0.9456               Median :-0.8643              
 Mean   :-0.7780            Mean   :-0.6228               Mean   :-0.5375              
 3rd Qu.:-0.6093            3rd Qu.:-0.2646               3rd Qu.:-0.1032              
 Max.   : 1.0000            Max.   : 1.0000               Max.   : 1.0000              
 body.acceleration.z.freq.mean body.acceleration.x.freq.stddev body.acceleration.y.freq.stddev
 Min.   :-1.0000               Min.   :-1.0000                 Min.   :-1.00000               
 1st Qu.:-0.9832               1st Qu.:-0.9929                 1st Qu.:-0.97689               
 Median :-0.8954               Median :-0.9416                 Median :-0.83261               
 Mean   :-0.6650               Mean   :-0.6034                 Mean   :-0.52842               
 3rd Qu.:-0.3662               3rd Qu.:-0.2493                 3rd Qu.:-0.09216               
 Max.   : 1.0000               Max.   : 1.0000                 Max.   : 1.00000               
 body.acceleration.z.freq.stddev body.acceleration.jerk.x.freq.mean body.acceleration.jerk.y.freq.mean
 Min.   :-1.0000                 Min.   :-1.0000                    Min.   :-1.0000                   
 1st Qu.:-0.9780                 1st Qu.:-0.9912                    1st Qu.:-0.9848                   
 Median :-0.8398                 Median :-0.9516                    Median :-0.9257                   
 Mean   :-0.6179                 Mean   :-0.6567                    Mean   :-0.6290                   
 3rd Qu.:-0.3023                 3rd Qu.:-0.3270                    3rd Qu.:-0.2638                   
 Max.   : 1.0000                 Max.   : 1.0000                    Max.   : 1.0000                   
 body.acceleration.jerk.z.freq.mean body.acceleration.jerk.x.freq.stddev body.acceleration.jerk.y.freq.stddev
 Min.   :-1.0000                    Min.   :-1.0000                      Min.   :-1.0000                     
 1st Qu.:-0.9873                    1st Qu.:-0.9920                      1st Qu.:-0.9865                     
 Median :-0.9475                    Median :-0.9562                      Median :-0.9280                     
 Mean   :-0.7436                    Mean   :-0.6550                      Mean   :-0.6122                     
 3rd Qu.:-0.5133                    3rd Qu.:-0.3203                      3rd Qu.:-0.2361                     
 Max.   : 1.0000                    Max.   : 1.0000                      Max.   : 1.0000                     
 body.acceleration.jerk.z.freq.stddev body.gyro.x.freq.mean body.gyro.y.freq.mean body.gyro.z.freq.mean
 Min.   :-1.0000                      Min.   :-1.0000       Min.   :-1.0000       Min.   :-1.0000      
 1st Qu.:-0.9895                      1st Qu.:-0.9853       1st Qu.:-0.9847       1st Qu.:-0.9851      
 Median :-0.9590                      Median :-0.8917       Median :-0.9197       Median :-0.8877      
 Mean   :-0.7809                      Mean   :-0.6721       Mean   :-0.7062       Mean   :-0.6442      
 3rd Qu.:-0.5903                      3rd Qu.:-0.3837       3rd Qu.:-0.4735       3rd Qu.:-0.3225      
 Max.   : 1.0000                      Max.   : 1.0000       Max.   : 1.0000       Max.   : 1.0000      
 body.gyro.x.freq.stddev body.gyro.y.freq.stddev body.gyro.z.freq.stddev body.acceleration.magnitude.freq.mean
 Min.   :-1.0000         Min.   :-1.0000         Min.   :-1.0000         Min.   :-1.0000                      
 1st Qu.:-0.9881         1st Qu.:-0.9808         1st Qu.:-0.9862         1st Qu.:-0.9847                      
 Median :-0.9053         Median :-0.9061         Median :-0.8915         Median :-0.8755                      
 Mean   :-0.7386         Mean   :-0.6742         Mean   :-0.6904         Mean   :-0.5860                      
 3rd Qu.:-0.5225         3rd Qu.:-0.4385         3rd Qu.:-0.4168         3rd Qu.:-0.2173                      
 Max.   : 1.0000         Max.   : 1.0000         Max.   : 1.0000         Max.   : 1.0000                      
 body.acceleration.magnitude.freq.stddev body.body.acceleration.jerk.magnitude.freq.mean
 Min.   :-1.0000                         Min.   :-1.0000                                
 1st Qu.:-0.9829                         1st Qu.:-0.9898                                
 Median :-0.8547                         Median :-0.9290                                
 Mean   :-0.6595                         Mean   :-0.6208                                
 3rd Qu.:-0.3823                         3rd Qu.:-0.2600                                
 Max.   : 1.0000                         Max.   : 1.0000                                
 body.body.acceleration.jerk.magnitude.freq.stddev body.body.gyro.magnitude.freq.mean
 Min.   :-1.0000                                   Min.   :-1.0000                   
 1st Qu.:-0.9907                                   1st Qu.:-0.9825                   
 Median :-0.9255                                   Median :-0.8756                   
 Mean   :-0.6401                                   Mean   :-0.6974                   
 3rd Qu.:-0.3082                                   3rd Qu.:-0.4514                   
 Max.   : 1.0000                                   Max.   : 1.0000                   
 body.body.gyro.magnitude.freq.stddev body.body.gyro.jerk.magnitude.freq.mean
 Min.   :-1.0000                      Min.   :-1.0000                        
 1st Qu.:-0.9781                      1st Qu.:-0.9921                        
 Median :-0.8275                      Median :-0.9453                        
 Mean   :-0.7000                      Mean   :-0.7798                        
 3rd Qu.:-0.4713                      3rd Qu.:-0.6122                        
 Max.   : 1.0000                      Max.   : 1.0000                        
 body.body.gyro.jerk.magnitude.freq.stddev
 Min.   :-1.0000                          
 1st Qu.:-0.9926                          
 Median :-0.9382                          
 Mean   :-0.7922                          
 3rd Qu.:-0.6437                          
 Max.   : 1.0000                          