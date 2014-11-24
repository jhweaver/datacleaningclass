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
