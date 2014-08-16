# GetData006 Course Project
# setwd("C:/Users/Yi Li/Documents/GitHub/GetData006Project")
# source("run_analysis.R")

run_analysis <- function()
{
	# Remove both leading and trailing whitespace
	trim1 <- function (x) {
		gsub("^\\s+|\\s+$", "", x)
	}

	# Replace multiple spaces with a single space
	trim2 <- function (x) {
		gsub("\\s+", " ", x)
	}

	# Read table from the input file
	readTable <- function(file_name) {
		file <- readLines(file_name)
		file <- trim1(file)
		file <- trim2(file)
		tc <- textConnection(file)
		fdata <- read.table(tc, sep=" ", header=FALSE, strip.white=TRUE)
		fdata
	}

	# Read features.txt
	# http://www.statmethods.net/input/valuelabels.html
	features <- readTable("UCI HAR Dataset/features.txt")
	features <- features[,2]
	means <- grep("mean()", features)
	stds <- grep("std()", features)

	# Read activity_labels.txt
	# http://www.statmethods.net/input/valuelabels.html
	activity_labels <- readTable("UCI HAR Dataset/activity_labels.txt")
	activity_labels <- activity_labels[,2]

	# Read subject_train.txt

	# Read train data and test data.
	subject_train <- readTable("UCI HAR Dataset/train/subject_train_short.txt")
	subject_test <- readTable("UCI HAR Dataset/test/subject_test_short.txt")
	# subject_train <- readTable("UCI HAR Dataset/train/subject_train.txt")
	# subject_test <- readTable("UCI HAR Dataset/test/subject_test.txt")

	X_train <- readTable("UCI HAR Dataset/train/X_train_short.txt")
	X_test <- readTable("UCI HAR Dataset/test/X_test_short.txt")
	# X_train <- readTable("UCI HAR Dataset/train/X_train.txt")
	# X_test <- readTable("UCI HAR Dataset/test/X_test.txt")

	y_train <- readTable("UCI HAR Dataset/train/y_train_short.txt")
	y_test <- readTable("UCI HAR Dataset/test/y_test_short.txt")
	# y_train <- readTable("UCI HAR Dataset/train/y_train.txt")
	# y_test <- readTable("UCI HAR Dataset/test/y_test.txt")

	# Merge train data and test data.
	subject <- rbind(subject_train, subject_test)
	colnames(subject) <- "subject"

	X_data <- rbind(X_train, X_test)
	ms_cols <- sort(c(means, stds))
	X_data_sel <- X_data[, ms_cols]
	colnames(X_data_sel) <- features[ms_cols]

	y_data <- rbind(y_train, y_test)
	for (i in 1:length(activity_labels) ) {
		y_data[y_data==i] <- toString(activity_labels[i])
	}
	colnames(y_data) <- "activity"

	fin_data <- cbind(subject, y_data)
	fin_data <- cbind(fin_data, X_data_sel)

	subjects <- unique(fin_data$subject)
	activities <- unique(fin_data$activity)

	for (i in 1:length(subjects) ) {
		for (j in 1:length(activities) ) {
			print(subjects[i])
			print(activities[j])
			cur_data <- fin_data[(fin_data$subject == subjects[i]) && (fin_data$activity == activities[j]), ] 
			cur_data <- cur_data[,c(-1,-2)] # Remove the first 2 columns
			if (nrow(cur_data) > 0) {
				print(colMeans(cur_data))
			}
		}
	}

	# Export the data set as a txt file
	write.table(fin_data, "yli_data.txt", row.name=FALSE)

	fin_data
}

