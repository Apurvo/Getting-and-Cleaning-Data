# Getting-and-Cleaning-Data

This script is typically used to analyze a dataset -> https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
The following files from the initial dataset is used:

- features.txt - has the descriptions for features measured
- activity_labels.txt - has all 6 types of activities
- X_train.txt - has the measurements of the features in train set 
- X_test.txt - has the measurements of the features in test set
- subject_train.txt - subject for each measurement from the train set
- subject_test.txt - subject for each measurement from the test set
- y_train.txt - activity (from 1 to 6) for each measurement from the train set
- y_test.txt - activity (from 1 to 6) for each measurement from the test set

Steps involved:
- Initially the data from all the files (mentioned above) were extracted into R platform.
- The X_Train and X_Test were defined with column name using feature data.
- 2 columns of activity and subject were added in both X_train and X_Test
- The data is then merge into 1 dataset called my_dataset(STEP1)
- We created a dataset from my_dataset with those measurement containing standard deviation and mean using grep function
- Activity and subject columns were also fetched (STEP2)
- Then the activity label added to the new dataset based on values of the column activity (STEP3).
- Now, we perform the melt operation on all the columns having mean or std based on id as activitylabel and subject(melt_dataset).
- Then we perform tidy operation to get the final dataset for each combination of activtylabel and subject(STEP4).
- The data is then exported to TidyData.txt using write.table command(STEP5).
