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

	# Merge train data and test data
	X_train <- readTable("UCI HAR Dataset/train/X_train_short.txt")
	X_test <- readTable("UCI HAR Dataset/test/X_test_short.txt")
	# X_train <- readTable("UCI HAR Dataset/train/X_train.txt")
	# X_test <- readTable("UCI HAR Dataset/test/X_test.txt")

	y_train <- readTable("UCI HAR Dataset/train/y_train.txt")
	y_test <- readTable("UCI HAR Dataset/test/y_test.txt")

	X_data <- rbind(X_train, X_test)
	y_data <- rbind(y_train, y_test)

	print(ncol(X_data))
	print(nrow(X_data))
	print(ncol(y_data))
	print(nrow(y_data))

	ms_cols <- sort(c(means, stds))
	X_data_sel <- X_data[, ms_cols]
	colnames(X_data_sel) <- features[ms_cols]
	X_data_sel
}
