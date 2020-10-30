================================================================================
Average Parameters about the Human Activity Recognition Using Smartphones Dataset
Version 1.0
================================================================================
Rejane Rodrigues de Carvalho Pereira.
Johns Hopkins University by Coursera.
Getting and Cleaning Data Course.
Training license, Ministry of Economy.
Brasília, Distrito Federal, Brazil.
================================================================================

This file intends to document the final project that was done in October 2020 and 
applied to students who were enrolled in the Johns Hopkins University Getting and
 Cleaning Data Course by Coursera. 

The final project consists of creating a script, in addition to Code Book
and this file. 

The experiments have been carried out with a group of 30 volunteers within an 
age bracket of 19-48 years. Each person performed six activities 
(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded 
accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial 
angular velocity at a constant rate of 50Hz. The experiments have been 
video-recorded to label the data manually. The obtained dataset has been 
randomly partitioned into two sets, where 70% of the volunteers was selected 
for generating the training data and 30% the test data. 

The CodeBook_Project_Rejane.docx provides more information.

The script called “run_analysis.R” intends to do five steps to follow:
STEP 1: Merges the train and the test sets to create data set;
STEP 2: Extracts the measurements concerning mean and standard deviation;
STEP 3: Uses descriptive activity names for activities;
STEP 4: Appropriately labels with descriptive variable names in data sets;
STEP 5: Creates an independent tidy data set with the average of each variable
for each activity and each subject.

This script is attached to that document.

For each record it is provided:
=============================================================================

- Triaxial acceleration from the accelerometer (total acceleration) and the 
estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The files that were used as input to the script “run_analysis.R” includes:
=============================================================================

MERGED FILES TO COMPOSE THE MEASURES FOR EACH SUBJECT:
- 'train/X_train.txt': each row identifies the outcomes (or measures) 
for the performed activities for each subject.
- 'test/X_test.txt': identical to the previous description.

MERGED FILES TO COMPOSE THE PERFORMED ACTIVITIES FOR EACH SUBJECT:
- 'train/y_train.txt': each row identifies the performed activity for each 
subject. Its range is from 1 to 6. 
- 'test/y_test.txt': identical to the previous description.

FILES USED TO IDENTIFY THE ACTIVITIES NAMES:
- 'activity_labels.txt': Links the class labels with their activity name.

FILES USED TO IDENTIFY THE SUBJECT FOR EACH PERFORMED ACTIVITIES:
- 'train/subject_train.txt': each row identifies the subject who performed 
the activities. Its range is from 1 to 30. 
- 'train/subject_test.txt': identical to the previous description.

FILE USED TO FILTER THE MEASURES CONCERNING TO MEAN AND STANDARD DEVIATION:
- 'features.txt': List of all features that are the variables concerning the
measures.


Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

License:
========
Use of this dataset in publications must be acknowledged by referencing the 
following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L.
 Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass 
Hardware-Friendly Support Vector Machine. International Workshop of Ambient
Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit 
can be addressed to the authors or their institutions for its use or misuse. 
Any commercial use is prohibited. 
For more information about this dataset contact: activityrecognition@smartlab.ws

===========================================================================
Rejane Rodrigues de Carvalho Pereira. October 2020.
