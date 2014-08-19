The Code Book

features : data extracted from features.txt (List of all features)

activity_labels : data extracted from activity_labels.txt (Links the class labels with their activity name)

subject_train : subjects from subject_train.txt (Training subjects)

subject_test : subjects from subject_test.txt (Test subjects)

X_train : the measurements from X_train.txt (Training set)

X_test : the measurements from X_test.txt (Test set)

y_train : the activitives (as integers) from y_train.txt (Training labels)

y_test : the activitives (as integers) from y_test.txt (Test labels)

subject : subject_train + subject_test

X_data : X_train + X_test

y_data : y_train + y_test, now as strings

X_data_sel : part of X_data that are the measurements on the mean and standard deviation

merged_data : subject + y_data + X_data_sel

subjects : a list of all unique subjects

activities : a list of all unique activities (as strings)

col_means_data : subject + activity + the average of each variable for the activity and the subject.
