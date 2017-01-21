#***************************************************************************************
# Step 1 Merges the training and the test sets to create one data set.
# Read the data

X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")

y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

# combine training set and test set

X <- rbind(X_train, X_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train,subject_test)


#***************************************************************************************
# Step 2 Extracts only the measurements on the mean and standard deviation for each measurement.
# Read the metadata and label the data with its name
features <- read.table("UCI HAR Dataset/features.txt")
names(X) <- features[, 2]
# subset the desired columns
X.mean.sd <- X[, grep("-(mean|std)\\(\\)", features[, 2])]


#***************************************************************************************
# Step 3 Use descriptive activity names to name the activities in the data set
# Read the activity labels
activity_lables <- read.table("UCI HAR Dataset/activity_labels.txt")
y[, 1] <- activity_lables[y[, 1], 2]

# Change the name of y 
names(y) <- "activity"


#***************************************************************************************
# Step 4 Appropriately label the data set with descriptive variable names
# Change the column name for subject
names(subject) <- "subject"

# bind all the data in a single data set
tidy.all.data <- cbind(X, y, subject)


#***************************************************************************************
# Step 5 From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.

library(plyr)
tidy.averages.data <- ddply(tidy.all.data, .(subject, activity), function(x) colMeans(x[, 1:66]))


#***************************************************************************************
# Output
write.table(tidy.averages.data, "tidy_averages_data.txt", row.name=FALSE)
