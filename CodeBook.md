## Overview and Approach
1. The training, test, subject and feature data are loaded in R
2. Both training and test data are then merged into one data set
3. The features are loaded and a subset of them i.e. mean and std related measurements are considered for preparation of of tidy data
4. Descriptive activity names are used to name the activities in the data set
5. Appropriately labels the data set with descriptive variable names
6. Finally, a new dataset with all the average measures for each subject and activity type (30 subjects * 6 activities = 180 rows). 
7. The output file is called tidy_data.csv, and uploaded to this repository.

## Variables
* x_train, y_train, x_test, y_test, subject_train and subject_test contain the data from the downloaded files
* x_data, y_data and subject_data merge the previous datasets to further analysis
* features contains the correct names for the x_data dataset, which are applied to the column names stored in mean_and_std_features, a numeric vector used to extract the desired data
* A similar approach is taken with activity names through the activities variable
* final_data merges x_data, y_data and subject_data in a big final dataset
* Finally, tidy_data contains the relevant averages which will be later stored in a .csv file. ddply() from the plyr package is used to apply colMeans() and ease the development.
