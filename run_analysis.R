## Completed by Phil Burdi
## Signature track student
## pburdi@gmail.com
##
## load the dplyr library for high level functions used in processing the dataset
library(dplyr)
##
## Begin reading in the data for test subjects
xtest <- read.table("./test/X_test.txt")
ytest <- read.table("./test/y_test.txt")
##
## Begin reading in the data for train subjects
xtrain <- read.table("./train/X_train.txt")
ytrain <- read.table("./train/y_train.txt")
##
## Also read in the activity labels to help with assigning the names of activities
act <- read.table("./activity_labels.txt")
##
## Read in the Subjects for test and train 
subtest <- read.table("./test/subject_test.txt")
subtrain <- read.table("./train/subject_train.txt")
##
## Assign a varible to the test and train datasets that identify them before merging
xtest$Set <- "Test"
xtrain$Set <- "Train"
##
## Assign the activity to each row in the seperate activity # datasets - Label each with the text 
## of the of activity instead of the number ("Walking" is #1 for example)
for (n in 1:nrow(act))
{
  ytest$V1[ytest$V1 == n] <- as.character(act[n,2])
  ytrain$V1[ytrain$V1 == n] <- as.character(act[n,2])
}
##
## Add the varible active (now a name like "Walking) to xtest and xtrain - 
## to be merged after
xtest$Active <-ytest$V1
xtrain$Active <-ytrain$V1
##
## Add the varible Sub - this provides the subject # to each dataset before merging
xtest$Sub <- subtest$V1
xtrain$Sub <- subtrain$V1
##
## Merge the two datasets into one dataset - the individual observations can be 
## found because we have the Set varible (test or train).
cl3data <- rbind(xtest, xtrain)
##
## Group the data by the Sub (subject) and Active (activity) -
## add a column for the Mean and Standard Deviation
## This completes #4 with cl3group
cl3group <- group_by(cl3data, Sub, Active, Mean = mean(1:561), Standard_Dev = sd(1:561))
##
##
## Build dataset for #5 in the programming assignment
##
## assemble a tidy dataset with sub grouping of data from the 
## raw merged dataset (train & test)
cl3subgrp <- group_by(cl3data, Sub, Active)
##
## Summary with adding the number of subjects and activities
cl3sum <- as.matrix(summarize(cl3subgrp, Iterations = n()))
##
## setup a varable to give the average and add to the matrix cl3sum
Average <- "NA"
cl3sum <- cbind(cl3sum, Average)
##
## start a loop to add in all the averages of each variable for each activity i
## and each subject.
for (m in 1:nrow(cl3sum))
{
  subject <- as.numeric(cl3sum[m,1]) ## hold the subject as numeric for compare in dataset
  activity <- cl3sum[m,2] ## hold the activity for compare in dataset cl3data
  mgroup <- cl3data[(cl3data$Sub == subject & cl3data$Active == activity),] ## find the records for subject # and activity
  mgroup <- na.omit(mgroup) ## remove any NAs
  cl3sum[m,4] <- mean(as.matrix(mgroup[,1:561])) ## get the average and add it to the matrix
}
##
## finally to finish #5 - convert back the tidy data to a dataframe cl3sum and write it
cl3sum <- as.data.frame(cl3sum)
write.table(cl3sum, "cl3sum_pmb.txt", row.name=FALSE)
##
## EOL