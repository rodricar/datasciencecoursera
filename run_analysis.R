# Final Project - Getting and Cleaning Data Course - Johns Hopkins University
# Rejane Rodrigues de Carvalho Pereira (30/10/2020, Brasília-DF, Brazil)
library(data.table)
library(dplyr)
library(plyr)
library(tidyr)

#STEP 1: Merges the train and the test sets to create data set new_dataset_all

#Reading the file X_train.txt
x_train <- fread("./Data/UCI HAR Dataset/train/X_train.txt",  
              na.strings = "NA", blank.lines.skip=TRUE)

#Reading the file X_test.txt
x_test <- fread("./Data/UCI HAR Dataset/test/X_test.txt",  
                   na.strings = "", blank.lines.skip=TRUE)

#Reading the file activity_labels.txt
activities <- fread("./Data/UCI HAR Dataset/activity_labels.txt",  
                    na.strings = "", blank.lines.skip=TRUE)

#Reading the file y_train.txt
y_train <- fread("./Data/UCI HAR Dataset/train/y_train.txt",  
                 na.strings = "NA", blank.lines.skip=TRUE)

#Reading the file y_test.txt
y_test <- fread("./Data/UCI HAR Dataset/test/y_test.txt",  
                na.strings = "", blank.lines.skip=TRUE)

#Reading the file subject_train.txt
subject_train <- fread("./Data/UCI HAR Dataset/train/subject_train.txt",  
                       na.strings = "NA", blank.lines.skip=TRUE)

#Reading the file subject_test.txt
subject_test <- fread("./Data/UCI HAR Dataset/test/subject_test.txt",  
                      na.strings = "", blank.lines.skip=TRUE)

#Reading the file features.txt
features <- fread("./Data/UCI HAR Dataset/features.txt",  
                  na.strings = "", blank.lines.skip=TRUE)

#MERGING 10.299 ROWS
#Merging rows in new data set x
new_dataset_x <- rbind(x_train, x_test)

#Merging rows in new data set y 
new_dataset_y <- rbind(y_train, y_test)

#Merging rows in new data set subject 
new_dataset_subject <- rbind(subject_train, subject_test)

#MERGING COLUMNS of three data set, totalizing 563 columns
new_dataset_all <- cbind(new_dataset_y, 
                         new_dataset_subject, new_dataset_x)

#==========================================================================
#STEP 2: Extracts to new_mean_std_dataset the measurements concerning mean 
#and standard deviation

#Filtering the variables names that contains mean or std
features_mean_std <- features[grep("mean|Mean|std|Std", features$V2)]
#Correcting the variables index that contains mean and std
names_features <- paste0("V", features_mean_std$V1)
#Extracting the 86 columns concerning the mean and standard deviation for new_mean_std_dataset
new_mean_std_dataset <- select(new_dataset_x, all_of(names_features))

#==============================================================================
#STEP 3: Uses descriptive activity names for activities in the new_dataset_all

#Performing substitutions for activity descriptions
for (i in 1:nrow(activities))   # activity index
{
  new_dataset_all$V1 <- gsub(activities$V1[i],    # index of the activity
                             activities$V2[i],    # substitute name of the activity
                             new_dataset_all$V1)  # column to be modified
}

#==============================================================================
#STEP 4: Appropriately labels with descriptive variable names
#in data sets: new_dataset_x, new_dataset_y, new_dataset_subject, activities,
# new_mean_std_dataset and new_dataset_all

#Removing the characters (),- in the 561 columns of new_dataset_x
features <- gsub("[(),]|-", "", features$V2)
#Changing the initial letter of the mean and std for upper letters
features <- gsub("mean", "Mean", features)
features <- gsub("std", "Std", features)
#Renaming the columns the data set new_dataset_x
colnames(new_dataset_x) <- features
View(new_dataset_x)

#Renaming the column the data set new_dataset_y
colnames(new_dataset_y) <- c("activity")
View(new_dataset_y)

#Renaming the column the data set activities
colnames(activities) <- c("indexActivity", "activity")
View(activities)

#Renaming the column the data set new_dataset_subject
colnames(new_dataset_subject) <- c("subject")
View(new_dataset_subject)

#Removing the characters (),- in the 86 columns of new_mean_std_dataset
features_mean_std <- gsub("[(),]|-", "", features_mean_std$V2)
#Changing the initial letter of the mean or std for upper letters in these columns
features_mean_std <- gsub("mean", "Mean", features_mean_std)
features_mean_std <- gsub("std", "Std", features_mean_std)
#Renaming the columns the new_mean_std_dataset concerning to mean and standard deviation 
colnames(new_mean_std_dataset) <- c(features_mean_std)
View(new_mean_std_dataset)

#Renaming the columns of data set new_dataset_all
colnames(new_dataset_all) <- c("activity", "subject", features)
View(new_dataset_all)


#===============================================================================
#STEP 5: Creates an independent tidy data set new_dataset_average with 
#the average of each variable for each activity and each subject.

#Merging the 88 columns concerning mean for base_dataset_mean
base_dataset_mean_std <- cbind(activity=new_dataset_all$activity, 
                           subject=new_dataset_all$subject,
                           new_mean_std_dataset)

#Gathering in a column "measures" and another "values_MeanStd" to facilitate 
#visualization and calculation of the average
gathering_dataset_mean_std <- gather(base_dataset_mean_std, key = "measure", 
                                value = "valuesMeanStd", 
                               -activity, -subject)

new_dataset_average <- ddply(gathering_dataset_mean_std, 
                          .(activity,subject, measure), 
                          summarize, 
                          average=round(mean(valuesMeanStd), 2))
View(new_dataset_average)

write.table(new_dataset_average, file="./Data/new_dataset_average.txt", row.name=FALSE) 

