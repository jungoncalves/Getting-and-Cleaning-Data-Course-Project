########## Coursera ########## 

########## Getting and Cleaning Data Course Project ##########

# working directory 

setwd("../UCI HAR Dataset/")
getwd()

######## Description of the Project ##################################3

## You should create one R script called run_analysis.R that does the following.

#1. Merges the training and the test sets to create one data set.
#2. Extracts only the measurements on the mean and standard deviation for each measurement.
#3. Uses descriptive activity names to name the activities in the data set
#4.  Appropriately labels the data set with descriptive variable names.
#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#### Librarys used 
library(readr)
library(dplyr)

##### Upload data from the project  


#Train Data
X_train <- read.table("train/X_train.txt") # set.
y_train <- read.table("train/y_train.txt", col.names=c("activity")) # labels.
subject_train <- read.table("train/subject_train.txt",col.names=c("subject")) #Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

# Test Data
X_test  <- read.table("test/X_test.txt") # set.
y_test  <- read.table("test/y_test.txt",col.names=c("activity")) # labels.
subject_test  <- read.table("test/subject_test.txt",col.names=c("subject")) #Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.


#Link the class labels with their activity name
activity_labels <- read.table("activity_labels.txt", col.names = c('activity','value'))

#List of all features
features<- read.table("features.txt", col.names = c("id", "feature"))
all_features <- c("subject", "activity", as.character(features$feature))

########## 1. Merges the training and the test sets to create one data set. ########## 

## merge all train data 
merged_train <- cbind(subject_train, y_train, X_train)

#merge all test data
merged_test <- cbind(subject_test,  y_test,  X_test)

#merge all train e test data 
all_data_merged <- rbind(merged_train, merged_test)

# name the cols based on the features name given 
names(all_data_merged) <- make.names(all_features)

########## 2. Extracts only the measurements on the mean and standard deviation for each measurement. ########## 

### create a vector with the cols with the measurements 
columnsMeanStd <- grep("subject|activity|[Mm]ean|std", all_features, value = FALSE)

### Filtered data based on the list created above
filtered_dataset <- all_data_merged[,columnsMeanStd]

# Verify the cols names 
names(filtered_dataset)


########## 3. Uses descriptive activity names to name the activities in the data set ########## 

# replace the col 'activity' values based in the values of the activity_labels 
all_data_merged$activity <- activity_labels[all_data_merged$activity, 2]


###########  4.  Appropriately labels the data set with descriptive variable names. ########## 

#copy list of all variables for modification 
readble_cols_names <- all_features

#modifications
readble_cols_names <- gsub("\\(\\)", "", readble_cols_names)
readble_cols_names <- gsub("Acc", "-acceleration", readble_cols_names)
readble_cols_names <- gsub("Mag", "-Magnitude", readble_cols_names)
readble_cols_names <- gsub("(Jerk|Gyro)", "-\\1", readble_cols_names)
readble_cols_names <- gsub("BodyBody", "Body", readble_cols_names)
readble_cols_names <- gsub("Acc", "Accelerometer", readble_cols_names)
readble_cols_names <- gsub("Gyro", "Gyroscope", readble_cols_names)
readble_cols_names <- gsub("BodyBody", "Body", readble_cols_names)
readble_cols_names <- gsub("^t", "Time", readble_cols_names)
readble_cols_names <- gsub("^f", "Frequency", readble_cols_names)
readble_cols_names <- gsub("tBody", "TimeBody", readble_cols_names)
readble_cols_names <- gsub("-freq()", "Frequency", readble_cols_names)
readble_cols_names <- gsub("angle", "Angle", readble_cols_names)

names(all_data_merged) <- readble_cols_names


########## 5. From the data set in step 4, creates a second, independent tidy data set with the ########## 
##########  average of each variable for each activity and each subject. ########## 


tidy_data<-aggregate(. ~ subject + activity, all_data_merged, mean)

tidy_data<-tidyData[order(tidyData$subject,tidyData$activity),]

write.table(tidyData, file="tidy_data.txt", row.name=FALSE)

head(tidyData)






























