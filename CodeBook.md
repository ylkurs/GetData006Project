The Code Book

features : data extracted from features.txt

activity_labels : data extracted from activity_labels.txt

subject_train : subjects from subject_train.txt

subject_test : subjects from subject_test.txt

X_train : the measurements from X_train.txt

X_test : the measurements from X_test.txt

y_train : the activitives (as integers) from y_train.txt

y_test : the activitives (as integers) from y_test.txt

subject : subject_train + subject_test

X_data : X_train + X_test

y_data : y_train + y_test, now as strings

X_data_sel : part of X_data that are the measurements on the mean and standard deviation

merged_data : subject + y_data + X_data_sel

subjects : a list of all unique subjects

activities : a list of all unique activities (as strings)

col_means_data : subject + activity + the average of each variable for the activity and the subject.
