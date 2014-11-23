### Introduction

Completed by Phil Burdi
Signature track student
pburdi@gmail.com

This is the Course project for Getting & Cleaning Data
The project makes use of a number of skills in R to create tidy dataset from raw (fitbit) 
type data using a samsung galaxy smart phone.

### Source of Data

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto. 
Smartlab - Non Linear Complex Systems Laboratory 
DITEN - Universit√  degli Studi di Genova, Genoa I-16145, Italy. 
activityrecognition '@' smartlab.ws 
www.smartlab.ws 

### Data Set Information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

### Attribute Information

For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

### How the script works

We begin reading in the data for test/train subjects.  
Also, we read in the activity labels to help with assigning the names of activities.
In addition, we Read in the Subjects for test and train. 
The we assign a varible to the test and train datasets that identify them before merging.
After, we assign the activity to each row in the seperate activity # datasets - Label each with the text 
of the of activity instead of the number ("Walking" is #1 for example) and add the varible active 
(now a name like "Walking") to xtest and xtrain to be merged after.
Add the varible Sub - this provides the subject # to each dataset before merging and merge the two datasets into one dataset.
The individual observations can be found because we have the Set varible (test or train).
We then group the data by the Sub (subject) and Active (activity) - add a column for the Mean and Standard Deviation and
this completes #4 with the cl3group varible

## Build dataset for #5 in the programming assignment.
This is to assemble a tidy dataset with sub grouping of data from the 
raw merged dataset (train & test).  We get a summary with adding the number of subjects and activities
and setup a varable to give the average and add to the matrix cl3sum
We then start a loop to add in all the averages of each variable for each activity and each subject.
Finally to finish #5 - convert back the tidy data to a dataframe cl3sum and write it
cl3sum <- as.data.frame(cl3sum)

### EOL
