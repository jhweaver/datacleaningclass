# Code explaination
* Read in both data sets, then merge them together
* Read in the feature files, so that columns can be given meaningful names
* Create feature filter list which will determine which features are
    kept (means and stds), and which are dropped
* Create fdata, filtered data, from the original data. This is the data set
    that only has means and stds
* Add the subjects and labels to the data set
* Read what english values for the labels correspond to which numbers
* Replace the numbers with the actual labels using sapply
* Create a new data frame, tdata, for the tidy data
* Create a blank row to populate with new data
* For each label for each patient, make a new row then add it to tdata
* All of the '-', '(', and ')' chars in the col names get turned to '.'s.
    loop through and put them back
* Turn the columns from chars back to numerics
* Return tdata

# Code Book
Signals are aggregated on a per subject and label basis.
The subjects are represeted in the "subject" field, and the six different labels
are given in the "labels" field.

These signals were used to estimate variables of the feature vector for each pattern:
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

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
