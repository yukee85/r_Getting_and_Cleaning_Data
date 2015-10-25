

## You should create one R script called run_analysis.R that does the following. 
## Merges the training and the test sets to create one data set.
## Extracts only the measurements on the mean and standard deviation 
##      for each measurement. 
## Uses descriptive activity names to name the activities in the data set
## Appropriately labels the data set with descriptive variable names. 
## From the data set in step 4, creates a second, independent tidy data set 
## with the average of each variable for each activity and each subject.


library(dplyr)

userFolder = '/home/julio/Documents/r/r_Getting_and_Cleaning_Data'
dataFolder = '/UCI HAR Dataset'

######################################################################
# setting working directory. change location variable to suit your location
setwd(userFolder)

# If the folder does not exist, download the file from the web and unzip it
if(!file.exists(dataFolder)) {
        download.file(
                'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip',
                'dataFile.zip'
        )
        unzip('dataFile.zip')
}

if(file.exists('dataFile.zip')){
        file.remove('dataFile.zip')
}
######################################################################        

# Read the features variable
fileName <- paste(userFolder, dataFolder, '/features.txt', sep='')   
varNames <- read.table(fileName, col.names = c('id', 'name'))

# Read the activity list
fileName <- paste(userFolder, dataFolder, '/activity_labels.txt', sep='')
activities <- read.table(fileName, col.names = c('id', 'activity'))

########################
# Read the Test Data
########################
fileName <- paste(userFolder, dataFolder, '/test/X_test.txt', sep='')
x <- read.table(fileName, col.names = varNames$name)

fileName <- paste(userFolder, dataFolder, '/test/y_test.txt', sep='')
y <- read.table(fileName, col.names = c('y'))

fileName <- paste(userFolder, dataFolder, '/test/subject_test.txt', sep='')
subjects <- read.table(fileName, col.names = c('subject') )

# Merge the test data into a single data file
testInformation <- cbind(y, subjects, x)


########################
# Read the Train Data
########################
fileName <- paste(userFolder, dataFolder, '/train/X_train.txt', sep='')
x <- read.table(fileName, col.names = varNames$name)

fileName <- paste(userFolder, dataFolder, '/train/y_train.txt', sep='')
y <- read.table(fileName, col.names = c('y'))

fileName <- paste(userFolder, dataFolder, '/train/subject_train.txt', sep='')
subjects <- read.table(fileName, col.names = c('subject') )

# Merge the train data set into a single frame
trainInformation <- cbind(y, subjects, x)

# Do a bit of clean up
remove(x, y, subjects)



############ Merge the complete data set together
completeInformation <- rbind(trainInformation, testInformation)

remove(testInformation, trainInformation)    # clean up 

# Apply the activities as the list of factors so we see descriptions rather than numbers
completeInformation$activity <- factor(completeInformation$y, 
                                       labels=activities$activity)

# Get the column names from the data set, so we can find the means and std
columnNames <- colnames(completeInformation)

# the grepl finds the activity, subject, mean and stddev columns we want to keep
# by getting a vector of boolean 
columnsToInclude <- (grepl('(activity|subject|mean|std)', columnNames) )

# Get the columns we want to keep from the data set
finalInfo <- completeInformation[,columnsToInclude]

#Get the variable names
varNames2 <- cbind(colnames(finalInfo))

##### This is a series of search and replace to clean the variable names
varNames2 <- gsub('.mean...?', '_Mean_', varNames2)     # Mean 
varNames2 <- gsub('.std...?', '_StdDev_', varNames2)    # Std Dev
varNames2 <- gsub('^t', 'Time_', varNames2)             # Time
varNames2 <- gsub('^f', 'Freq_', varNames2)             # Frequency
varNames2 <- gsub('Acc', '_Acceleration_', varNames2)   # Acceleration
varNames2 <- gsub('BodyGyro', 'Body_Gyro', varNames2)   # Body Gyro

# Assign the name variable names
names(finalInfo) <- varNames2

# Get the new tydi data set with the subject, activity and variable name
finalInfoMelt <- melt(finalInfo, id=c('subject', 'activity'), 
                      measure.vars= varNames2[varNames2 != 'subject' 
                                              & varNames2 !='activity'])

# Create the group variable, using subject, activity and variable. 
# This will be used to summarize the information 
by.type <- group_by(finalInfoMelt, subject, activity, variable)

# Summarize the information by the groups defined above and calculate their mean
finalInfo2 <- summarise(by.type, meanValue = mean(value, na.rm=T))

# write the tidy data sest to a file
write.table(finalInfo2, file='finalTable.txt',row.names = F)
