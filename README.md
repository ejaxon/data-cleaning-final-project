
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