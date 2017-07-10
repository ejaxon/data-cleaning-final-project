
If you download the dataset from [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and unzip in this directory, then you can run

````
source("./run_analysis.R")
run_analysis()
````
If the data directory is elsewhere, you can pass it in as an argument. For example, if you unzipped it in the directory above this one:

````
source("./run_analysis.R")
run_analysis("..")
````

The script will write out two files in the current directory: _results.csv_ and _results_average.csv_. These can be read back into R with ````read.csv("./results.csv")```` 

Note that there are several body.body. Assume mistaken repetition.

Note decision not to include measurements with terms meanFreq() (and of course not angles)
294 fBodyAcc-meanFreq()-X
295 fBodyAcc-meanFreq()-Y
296 fBodyAcc-meanFreq()-Z
373 fBodyAccJerk-meanFreq()-X
374 fBodyAccJerk-meanFreq()-Y
375 fBodyAccJerk-meanFreq()-Z
452 fBodyGyro-meanFreq()-X
453 fBodyGyro-meanFreq()-Y
454 fBodyGyro-meanFreq()-Z
513 fBodyAccMag-meanFreq()
526 fBodyBodyAccJerkMag-meanFreq()
539 fBodyBodyGyroMag-meanFreq()
552 fBodyBodyGyroJerkMag-meanFreq()
555 angle(tBodyAccMean,gravity)
556 angle(tBodyAccJerkMean),gravityMean)
557 angle(tBodyGyroMean,gravityMean)
558 angle(tBodyGyroJerkMean,gravityMean)
559 angle(X,gravityMean)
560 angle(Y,gravityMean)
561 angle(Z,gravityMean)

