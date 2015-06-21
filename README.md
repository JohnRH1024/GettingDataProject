# GettingDataProject

## Initial steps
This process assumes you have downloaded the zip file from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Once unzipped you will have a directory called UCI HAR Dataset. All the files and subdirectories mentioned below should be in this directory.
Make this your working directory.  Get the run_analysis.R file from the same repository that this README is in.

## Run the code to process the raw data
Execute run_analysis.R in the working directory

### Processing steps in run_analysis.R
Note that comments in run_analysis.R will show where each of these steps exists in the code.
1.) Read the following files into dataframes:
* ./train/X_train.txt         into data_train
* ./train/y_train.txt         into activity_train
* ./train/subject_train.txt   into subjects_train
* ./test/X_test.txt           into data_test
* ./test/y_test.txt           into activity_test
* ./test/subject_test.txt     into subject_test

Next create two dataframes that combine three individual dataframes from above:
training is created by using cbind to combine subjects_train, activity_train, and data_train together in that order
testing is created by using cbind to combine subjects_test, activity_test, and data_test together in that order
These are now 2 dataframes that have 563 columns - one for subject, one for activity and then the 561 measurements.

Next the file features.txt is read to get the names for the data columns.  When read in it will create a dataframe with two columns, an index number and the name of the measurement.  The second column is extracted to get the names for the columns containing measurement data in training and testing.
The strings "subject" and "activity" are added to the beginning of the vector so that the first two columns will be labeled as well.  The colnames function is used to create column names in the two dataframes using this vector.

Now that both dataframes are labeled correctly they can be combined using rbind to create the next intermediate dataframe I called temp.

The next step is to replace the index for the activity with a descriptive name of the activity. The names are obtained by reading in the mapping from activity_labels.txt. A for loop iterates over the index column in the dataframe created when you read in the file and replaces each matching index in temp with the descriptive name in the second column of that dataframe.

The next step is to keep only the data columns that contain the strings "-mean()" or "-std()" in their column name.  I did this the quick and dirty way.  There may be better ways to do this in R.  
I used the grepl function twice to create two logical vectors.  One will identify the columns with "-mean(" and the other will identify the columns with "-std(" in the column name.  I then logical ORed the vectors together to get the subset of data columns to keep.  Since grepl was run on the column label vector created from features.txt I added two TRUE values to the beginning of the vector to keep the subject and activity columns.  I then took a subset of the temp dataframe based on this logical vector and called it temp2.  

The temp2 dataframe now has the correct columns and has a row for each and every measurement.  The tidy data set we are asked to create should only have one row for each unique combination of subject and activity.  The data in those rows should be the aveage of the individual measurements for those unique combinations.  I used the plyr package and ddply to get this result. 

Before runnning ddply I changed the subject column to a factor.

Then I used ddply(temp2, c("subject", "activity"), numcolwise(mean)) to create a final dataframe,  tidy_data.  This averaged (computed the mean) of all the numerical columns in groups specified by the same pair of subject and activity..

Finally,  since the new dataframe has averaged values and not the original samples, I renamed the columns to reflect this by prepending "mean_" to each column.  Then the dataframe was written to tidy_data.txt in the working directory.

## Tidy data
This is considered tidy data since each row contains observations for only one unique combination of subject and activity.
