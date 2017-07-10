# Data Cleaning Course Final Project

This repository contains the code and output for the final course project in the Coursera Data Cleaning Course. The contents include:

1. run_analysis.R - A script which processes the original data into two tidy datasets
2. CodeBook.md - A codebook containing information on the processing of the raw data and descriptions of all variables.
3. tidy_full.csv - The first tidy dataset specified by the assignment.
4. tidy_average.csv - The second tidy dataset specified by the assignment.

## Running the Script

The following steps describe the simplest way to run the script:
1. Clone this repository.
2. Download the original dataset from [this link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and place in the repository directory
3. Unzip the downloaded file - it will create a directory called `UCI_HAR_Dataset`
4. Start R and set the working directory to the repository directory
5. Ensure that the `reshape2` and `plyr` libraries are installed (the script will load them, if needed)
6. Run
````
source("run_analysis.R")
run_analysis()
````

The script will create the two tidy datasets required by the assignment in `tidy_full.csv` and `tidy_average.csv`. They may be read back into R with `read.csv("tidy_full.csv")` and `read.csv("tidy_average.csv")`. The script takes a single optional argument specifying the directory where the original data may be found - it defaults to `"./UCI_HAR_Dataset"`.

## Script Documentation

The assignment was to create a script file called `run_analysis.R` with a script that:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The processing performed in the script is as follows:

* Create the `tidy_full.csv` dataset
    * Recombine the original training and test datasets, subject IDs and activity codes into a single dataframe, replacing the activity codes with their descriptive string equivalents from the `activity_labels.txt` file. The data is gathered from the following files: `test/X_test.txt`, `train/X_train.txt`, `test/y_test.txt`, `train/y_train.txt`, `test/subject_test.txt`, `train/subject_train.txt`. This accomplished steps 1 and 3 above.
    * Extract only the mean and standard deviation variables for each measurement (i.e., those labeled with either `-mean()` or `-std()`), per step 2 above.
    * Rename all the variables with more readable, descriptive variable names, per step 4 above.
    * Write out the resulting dataset as `tidy_full.csv`
* Create the `tidy_average.csv` dataset, per step 5 above.
    * Use the `melt()` function from the `reshape2` library to transform the wide-form dataset (one column per measurement variable) into a narrow-form one (one column for variable name and one for its value).
    * Use the `ddply()` function from the `plyr` library to compute the mean of each measurement variable for each subject/activity combination.
    * Write out the resulting dataset as `tidy_average.csv`

### Additional Explanations and Assumptions

1. Step 2 of the assignment instructs to extract only measurements on the mean and standard deviation. It seemed obvious that all variables with `-mean()` or `-std()` were to be extracted, but it was not clear whether this instruction also included variables that computed a weighted average over frequencies, labeled with `-meanFreq()`. I decide _NOT_ to include them since they were not a simple mean.

2. Step 5 specifies a dataset containing the "average of each variable for each activity and each subject". This is somewhat ambiguous - it could be interpreted to mean either separate averages for each activity and for each subject or an average for each subject/activity pair. I chose the latter interpretation as making more physical sense.

3. I used a simple pattern for renaming variables with more descriptive names. I did my best to give accurate descriptive names, however, since I am not very knowledgeable about the physics, I may have mistakenly translated in some cases. Here is the pattern (the measure name was often a multi-part descriptive name, e.g., `body.acceleration`):
````
    [descriptive measure name].[time | freq].[x | y | z | magnitude].[mean | stddev]
````

4. There were a few frequency-domain variables starting with `fBodyBody`. After researching, I concluded that they simply mistakenly repeat `Body` and I translated them on that assumption.



