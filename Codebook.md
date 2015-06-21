This first section is taken from the features_info.txt file from the UCI HAR Dataset directory.
First, acknowledge the source of the data:  
License: ======== Use of this dataset in publications must be
acknowledged by referencing the following publication [1]

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge
L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a
Multiclass Hardware-Friendly Support Vector Machine. International
Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz,
Spain. Dec 2012

# Feature Selection 

The features selected for this database come from the accelerometer and
gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain
signals (prefix 't' to denote time) were captured at a constant rate of
50 Hz. Then they were filtered using a median filter and a 3rd order low
pass Butterworth filter with a corner frequency of 20 Hz to remove
noise. Similarly, the acceleration signal was then separated into body
and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ)
using another low pass Butterworth filter with a corner frequency of 0.3
Hz.

Subsequently, the body linear acceleration and angular velocity were
derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and
tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional
signals were calculated using the Euclidean norm (tBodyAccMag,
tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these
signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ,
fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to
indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for
each pattern: '-XYZ' is used to denote 3-axial signals in the X, Y and Z
directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation

# New material:

Note that the list of variables above contains data from 33 signals and that by keeping just the 
mean and standard deviation component we have 66 variables altogether. (There were many other variables
in the original dataset, but we are only interested in these for this project.

# Tidy Data
For the tidy data, I renamed the columns to reflect that we took the average over the samples for 
each combination of subject and activity. Two columns have also been added for the subject and activity.
I also prepended the string "mean_" to each variable name to indicate that this is not 
the original data but instead is the average over the values (per subject and activity).

subject  
activity  
mean_tBodyAcc-mean()-X  
mean_tBodyAcc-mean()-Y  
mean_tBodyAcc-mean()-Z  
mean_tBodyAcc-std()-X  
mean_tBodyAcc-std()-Y  
mean_tBodyAcc-std()-Z  
mean_tGravityAcc-mean()-X  
mean_tGravityAcc-mean()-Y  
mean_tGravityAcc-mean()-Z  
mean_tGravityAcc-std()-X  
mean_tGravityAcc-std()-Y  
mean_tGravityAcc-std()-Z  
mean_tBodyAccJerk-mean()-X  
mean_tBodyAccJerk-mean()-Y  
mean_tBodyAccJerk-mean()-Z  
mean_tBodyAccJerk-std()-X  
mean_tBodyAccJerk-std()-Y  
mean_tBodyAccJerk-std()-Z  
mean_tBodyGyro-mean()-X  
mean_tBodyGyro-mean()-Y  
mean_tBodyGyro-mean()-Z  
mean_tBodyGyro-std()-X  
mean_tBodyGyro-std()-Y  
mean_tBodyGyro-std()-Z  
mean_tBodyGyroJerk-mean(  )-X
mean_tBodyGyroJerk-mean()-  Y
mean_tBodyGyroJerk-mean()-Z  
mean_tBodyGyroJerk-std()-X  
mean_tBodyGyroJerk-std()-Y  
mean_tBodyGyroJerk-std()-Z  
mean_tBodyAccMag-mean()  
mean_tBodyAccMag-std()  
mean_tGravityAccMag-mean()  
mean_tGravityAccMag-std()  
mean_tBodyAccJerkMag-mean()  
mean_tBodyAccJerkMag-std()  
mean_tBodyGyroMag-mean()  
mean_tBodyGyroMag-std()  
mean_tBodyGyroJerkMag-mean()  
mean_tBodyGyroJerkMag-std()  
mean_fBodyAcc-mean()-X  
mean_fBodyAcc-mean()-Y  
mean_fBodyAcc-mean()-Z  
mean_fBodyAcc-std()-X  
mean_fBodyAcc-std()-Y  
mean_fBodyAcc-std()-Z  
mean_fBodyAccJerk-mean()-X  
mean_fBodyAccJerk-mean()-Y  
mean_fBodyAccJerk-mean()-Z  
mean_fBodyAccJerk-std()-X  
mean_fBodyAccJerk-std()-Y  
mean_fBodyAccJerk-std()-Z  
mean_fBodyGyro-mean()-X  
mean_fBodyGyro-mean()-Y  
mean_fBodyGyro-mean()-Z  
mean_fBodyGyro-std()-X  
mean_fBodyGyro-std()-Y  
mean_fBodyGyro-std()-Z  
mean_fBodyAccMag-mean()  
mean_fBodyAccMag-std()  
mean_fBodyBodyAccJerkMag-mean()  
mean_fBodyBodyAccJerkMag-std()  
mean_fBodyBodyGyroMag-mean()  
mean_fBodyBodyGyroMag-std()  
mean_fBodyBodyGyroJerkMag-mean()  
mean_fBodyBodyGyroJerkMag-std()  