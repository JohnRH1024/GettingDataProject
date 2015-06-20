library(plyr)
# The following lines show that the analysis is the the UCI HAR Dataset
# directory that was created when the zip file from the project description was unzipped
#setwd("~/Development/DataScienceCourse/GettingData/Project/UCI HAR Dataset")

# Read in all the files that are needed
data_train <- read.table("./train/X_train.txt", header=FALSE)
subjects_train <- read.table("./train/subject_train.txt", header=FALSE)
activity_train <- read.table("./train/y_train.txt")
data_test <- read.table("./test/X_test.txt", header=FALSE)
subjects_test <- read.table("./test/subject_test.txt", header=FALSE)
activity_test <- read.table("./test/y_test.txt", header=FALSE)

# My approach is to get all things related to the training data into one dataframe
# and all things related to the testing data into another and then rbind the two 
# dataframes together
training <- cbind(subjects_train, activity_train, data_train)
testing <- cbind(subjects_test, activity_test, data_test)

# In order to later decide which columns of data to keep based on measurement names
# I used the names in features.txt to name the columns
column_labels <- read.table("features.txt", stringsAsFactors=FALSE)
clabels <- column_labels[,2]
# Note that I need to also name the columns with the subject and activity that 
#  were added to the dataframe previously
clabels2 <- c("subject", "activity", clabels)
# In order to do the rbind, both data frames have to have the same column names!
colnames(training) <- clabels2
colnames(testing) <- clabels2

temp <- rbind(training, testing)
#
# Replace the index number for activities with the names of the activities as 
# found in activity_labels.txt
activity_table <- read.table("activity_labels.txt", stringsAsFactors = FALSE, header=FALSE)
# translate second column of final
for (i in seq(nrow(activity_table))) {
  temp[temp$activity==i, 'activity'] <- activity_table[i,2]
}
# Next determine what columns we want in the tidy dataset
# These are the ones that contain either -mean() or -std() in the column name
# Many ways to do this, but easiest and one I am most comfortable with is to 
# make logical vectors indicating which column names contain each of these independently 
# then logical OR them together to get all the desired columns selected
keep.mean <- grepl('.-mean\\(.',clabels)
keep.std <- grepl('.-std\\(.',clabels)
keep.both <- keep.mean | keep.std
# make sure we keep the first two columns with the subject and activity
keep.all <- c(TRUE, TRUE, keep.both)
# Extract the desired columns from the bigger dataframe
temp2 <- temp[, keep.all]

# I want to use ddply to get the mean (average) of all the measurements for 
# each combination of (subject, activity) and it seems to do that I need to treat
# subject as a factor, not an integer
temp2$subject <- as.factor(temp2$subject)
# compute the means of the measurement data that relate to each
# (subject, activity) pair 

tidy_data <- ddply(temp2, c("subject", "activity"), numcolwise(mean))

# fix up the column names in tidy_data to show that the output is
# averages of the underlying data
temp <- colnames(tidy_data)
temp[3:68] <- paste0("mean_", temp[3:68]) # prepend mean_ to each column name
colnames(tidy_data) <- temp   # and replace in the dataframe

# finally write the tidy data to a text file to upload on Coursera
write.table(tidy_data, "tidy_data.txt", row.names=FALSE, quote=FALSE)