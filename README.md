How the script run_analysis.R works

1. Extract the features from features.txt (by calling function readTable). Function readTable reads the input file line by line. For each line, it removes both leading and trailing whitespace, then replaces multiple spaces with a single space. Finally, it calls function read.table to extract the data in the input file.
2. Extract the activity labels from activity_labels.txt (by calling function readTable).
3. Read the train data (by calling function readTable).
4. Read the test data (by calling function readTable).
5. Merge the train data and the test data.
6. Extracts only the measurements on the mean and standard deviation for each measurement (by selecting the features that contain "means()" or "std()") 
7. Use the activity labels extracted from activity_labels.txt as descriptive activity names (after converting the labels to strings).
8. Create a first tidy data set with subjects, activities, measurements on the mean, and measurements on the std.
9. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
10. Output the second tidy data set to file "col_means.txt", after adding "Avg-of-" to the front of the column names of the measurements.
