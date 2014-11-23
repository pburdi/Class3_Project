## CODE BOOK
## Completed by Phil Burdi
## Signature track student
## pburdi@gmail.com
##
xtest <- ("./test/X_test.txt")
ytest <- ("./test/y_test.txt")
xtrain <- ("./train/X_train.txt")
ytrain <- ("./train/y_train.txt")
act <- ("./activity_labels.txt")
subtest <- ("./test/subject_test.txt")
subtrain <- ("./train/subject_train.txt")
xtest$Set <- "Test"
xtrain$Set <- "Train"
xtest$Active <- activity of subject
xtrain$Active <- activity of subject
xtest$Sub <- subject number
xtrain$Sub <- subject number
cl3data <-merged (xtest, xtrain)
cl3group <- grouped data from
(cl3data with Sub, Active, Mean = mean(1:561), Standard_Dev = sd(1:561))
cl3subgrp <-  a subgroup of data without mean or standard dev(cl3data, Sub, Active)
cl3sum <-  a matrix from the summary of (cl3subgrp, with Iterations (count))
Average <- "NA" in 4th column of cl3sum matrix (placeholder to add column)
subject <- a numeric varible from 1st column of cl3sum
activity <- a char value from cl3sum column 2 to hold the activity 
mgroup <- holds the correct row from subject and activity from cl3datay
##
## EOL