library(reshape2)
#Getting training, test, features and activity data

feature <- read.table("C:/Users/188048/Desktop/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt")
activity <- read.table("C:/Users/188048/Desktop/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt")
x_training <- read.table("C:/Users/188048/Desktop/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")
x_testing <- read.table("C:/Users/188048/Desktop/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")
y_training <- read.table("C:/Users/188048/Desktop/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt")
y_testing <- read.table("C:/Users/188048/Desktop/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt")
subject_training <- read.table("C:/Users/188048/Desktop/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt")
subject_testing <- read.table("C:/Users/188048/Desktop/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")

colnames(x_training)<- feature$V2
colnames(x_testing) <- feature$V2
x_training$activity <- y_training$V1
x_testing$activity <- y_testing$V1
x_training$subject <- factor(subject_training$V1)
x_testing$subject <- factor(subject_testing$V1)

#1 Merges the training and the test sets to create one data set.

my_dataset <- rbind(x_training,x_testing)

#2 Extracts only the measurements on the mean and standard deviation for each measurement.
col_names <- colnames(my_dataset)
ext_col_names <- grep("mean()|std()|activity|subject", col_names, value=TRUE)
my_dataset <- my_dataset[,ext_col_names]

#3 Uses descriptive activity names to name the activities in the data set
my_dataset$activitylabel <- factor(my_dataset$activity, 
                                         labels= c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))

#4 Appropriately labels the data set with descriptive variable names.
feature_colnames <- grep("std()|mean()", col_names, value=TRUE)
melt_dataset <-melt(my_dataset, id = c('activitylabel', 'subject'), measure.vars = feature_colnames)
tidy_dataset <- dcast(melt_dataset, activitylabel + subject ~ variable, mean)

#5 From the data set in step 4, creates a second, independent tidy data set with the 
#  average of each variable for each activity and each subject.
write.table(tidy_dataset, file = "C:/Users/188048/Desktop/getdata_projectfiles_UCI HAR Dataset/TidyData.txt",row.names = FALSE)








