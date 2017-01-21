# CodeBook 

## Starting Process
Downloaded from the link https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Extract all and put the folder `UCI HAR Dataset` into the working directory of R.

## Original Data 
The original data has the following content

- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

## Variables in Tidy data
- `X_train`, `X_test`, `y_train`, `y_test`, `subject_train` and `subject_test` contain the data from the downloaded files.
- `X`, `y` and `subject` are the datasets from merging the previous datasets. 
- `features` and `activity_lables` contain the information read from the downloaded files, which are the metadata and the lables for y seperately.
- `tidy.all.data` is got after merging `X`, `y` and `subject`, which basicly has all the data.
-  `tidy.averages.data` contains the relevant averages group by features and activities.

## How to redo the cleaning process
Put the extracted folder `UCI HAR Dataset` into the working directory of R.
Run `run_analysis.R`
