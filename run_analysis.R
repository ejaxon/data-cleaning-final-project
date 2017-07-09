# From the original assignment, this function:
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the average
#    of each variable for each activity and each subject.

run_analysis <- function(dir = "./UCI_HAR_Dataset") {
    require("reshape2")
    require("plyr")
    # Read the two datasets and their corresponding subject and activity codes
    t_1 = read.table(paste0(dir,"/test/X_test.txt"))
    t_2 = read.table(paste0(dir,"/train/X_train.txt"))
    l_1 = read.table(paste0(dir,"/test/y_test.txt"))
    l_2 = read.table(paste0(dir,"/train/y_train.txt"))
    s_1 = read.table(paste0(dir,"/test/subject_test.txt"))
    s_2 = read.table(paste0(dir,"/train/subject_train.txt"))

    ####################################################################################
    ## 1. Merges the training and the test sets to create one data set.
    ## 3. Uses descriptive activity names to name the activities in the data set
    ####################################################################################

    # Read the feature names
    fnames = read.table(paste0(dir,"/features.txt"))

    # Merge the datasets & set the column names from the feature.txt file
    t_all = rbind(t_1,t_2)
    names(t_all) <- fnames[[2]]

    # Merge the activity codes, transform to descriptions & set the column name
    l_all = rbind(l_1,l_2)
    activity_names <- tolower(read.table(paste0(dir,"/activity_labels.txt"))[[2]])
    activity <- activity_names[l_all[[1]]]
    names(activity) <- c("activity")

    # Merge the subject codes and set the column name
    s_all <- rbind(s_1, s_2)
    names(s_all) <- c("subject")

    # Combined the subject, activity and data columns
    t_all <- cbind(s_all, activity, t_all)

    ####################################################################################
    ## 2. Extracts only the measurements on the mean and standard deviation for
    ##    each measurement.
    ## 4. Appropriately labels the data set with descriptive variable names.
    ####################################################################################

    # Pull out only the data columns that have mean and std deviation of the variables. I 
    # am interpreting this to include ONLY those variables with "-mean()" or "-std()" in the name. 
    anames = names(t_all);

    flt <- grepl("-mean\\(\\)",anames) | grepl("-std\\(\\)",anames) | grepl("activity",anames) | grepl("subject",anames)
    result <- t_all[flt]

    # Convert the column names to more readable and descriptive versions
    names(result) <- convert_names(names(result))

    # Write the the resulting tidy dataset out
    write.csv(result,file="./tidy_full.csv", row.names=FALSE)

    ####################################################################################
    ## 5. From the data set in step 4, creates a second, independent tidy data set with
    ##    the average of each variable for each activity and each subject.
    ####################################################################################

    # Reshape to a narrow form
    sm <- melt(result, id=c("subject", "activity"))

    # And use plyr function to summaryize by subject & activity
    sma <- ddply(sm,.(subject,activity,variable),summarize, mean=mean(value))
    write.csv(sma, file="./tidy_average.csv", row.names=FALSE)
    invisible()
}

#
# This routine translates original variable names to more readable version.
#
convert_names <- function(names) {
    result = character(length(names))
    for (i in 1:length(names)) {
        nm <- names[i]
        domain <- ifelse(grepl("^t.",nm),".time",ifelse(grepl("^f.",nm),".freq",""))
        coord = ifelse(grepl("-X$",nm),".x",ifelse(grepl("-Y$",nm),".y",ifelse(grepl("-Z$",nm),".z","")))
        method = ifelse(grepl("-mean\\(\\)",nm),".mean",ifelse(grepl("-std\\(\\)",nm),".stddev",""))
        v = paste0("XX-",nm,"-XX")
        if (grepl("^activity",nm)) {
            v = "activity"
        }
        else if (grepl("^subject",nm)) {
            v = "subject"
        }
        else if (grepl("^fBodyBody",nm)) {
            if (grepl("^fBodyBodyAccJerkMag",nm)) {
                v = "body.body.acceleration.jerk.magnitude"
            }
            else if (grepl("^fBodyBodyGyroMag",nm)) {
                v = "body.body.gyro.magnitude"
            }
            else {
                v = "body.body.gyro.jerk.magnitude"
            }
        }
        else if (grepl("^[tf]BodyAccJerkMag",nm)) {
            v = "body.acceleration.jerk.magnitude"
        }
        else if (grepl("^[tf]BodyAccJerk",nm)) {
            v = "body.acceleration.jerk"
        }
        else if (grepl("^[tf]BodyAccMag",nm)) {
            v = "body.acceleration.magnitude"
        }
        else if (grepl("^[tf]BodyAcc",nm)) {
            v = "body.acceleration"
        }
        else if (grepl("^[tf]GravityAccMag",nm)) {
            v = "gravity.acceleration.magnitude"
        }
        else if (grepl("^[tf]GravityAcc",nm)) {
            v = "gravity.acceleration"
        }
        else if (grepl("^[tf]BodyGyroMag",nm)) {
            v = "body.gyro.magnitude"
        }
        else if (grepl("^[tf]BodyGyroJerk",nm)) {
            v = "body.gyro.jerk"
        }
        else if (grepl("^[tf]BodyGyro",nm)) {
            v = "body.gyro"
        }        
        result[i] <- paste0(v,coord,domain,method)
    }
    result
}


