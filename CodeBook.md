# CodeBook for Getting and Cleaning Data Project

The data is taken from UCI HAR Dataset -> https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip .
This dataset provide the following variables for each activity:
-subject - ID of participant
-activity - ID of activity type
-Mean and Standard Deviation of the following measures below:
tBodyAcc-XYZ,tGravityAcc-XYZ,tBodyAccJerk-XYZ,tBodyGyro-XYZ,tBodyGyroJerk-XYZ,tBodyAccMag,tGravityAccMag,tBodyAccJerkMag,
tBodyGyroMag,tBodyGyroJerkMag,fBodyAcc-XYZ,fBodyAccJerk-XYZ,fBodyGyro-XYZ,fBodyAccMag,fBodyAccJerkMag,fBodyGyroMag,fBodyGyroJerkMag

The data transformation used to make it a tidy data set were:
- Adding data labels like : WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.
- The dataset mean and standard deviation was tabulated and organized for each combination of activitylabel and subject fetching 180 records.
- Melt and dcast operations were used to created this tidy dataset.
