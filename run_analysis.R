library(plyr)

## Step 1 : Merge the training and test sets to create one data set

## Training data read
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

## Test data read
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

## Create 'x' data set by rbind train and test data as they have exactly same number of variables
x_data <- rbind(x_train, x_test)

## Create 'y' data set by rbind train and test data as they have exactly same number of variables
y_data <- rbind(y_train, y_test)

## create 'subject' data set by rbind train and test data as they have exactly same number of variables
subject_data <- rbind(subject_train, subject_test)

## Step 2: Extract only the measurements on the mean and standard deviation for each measurement

## Feature data read
features <- read.table("features.txt")

## Get only the required measurements or features i.e. mean() or std() related
reqd_features <- grep(".*-(mean|std)\\(\\).*", features[, 2])

## Storing mean() and std() columns data back into x_data
x_data <- x_data[, reqd_features]

## Assigning the correct column names from required features
names(x_data) <- features[reqd_features, 2]

## Step 3: Use descriptive activity names to name the activities in the data set
activities <- read.table("activity_labels.txt")

## Assigning respective activity names for the labels 
y_data[, 1] <- activities[y_data[, 1], 2]

## Assigning correct column name for y_data
names(y_data) <- "activity"

## Step 4: Appropriately label the data set with descriptive variable names

## Assigning correct column name for subject_data
names(subject_data) <- "subject"

## Preparing one final data set by binding x, y and subject
final_data <- cbind(x_data, y_data, subject_data)

## Step 5: Create a second, independent tidy data set with the average of each variable
## for each activity and each subject

tidy_data <- ddply(final_data, .(activity, subject), function(x) colMeans(x[, 1:66]))

write.table(tidy_data, "tidy_data.csv", row.name=FALSE, sep = ",")
