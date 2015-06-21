library(plyr)


# 1. Merge the training and test sets to create one data set
   # a. Read all files

xtrain <- read.table("./data/train/X_train.txt")
ytrain <- read.table("./data/train/y_train.txt")
subjecttrain <- read.table("./data/train/subject_train.txt")
xtest <- read.table("./data/test/X_test.txt")
ytest <- read.table("./data/test/y_test.txt")
subjecttest <- read.table("./data/test/subject_test.txt")
features <- read.table("./data/features.txt")
activities <- read.table("./data/activity_labels.txt")

   # b. Bind all data sets in x, y, and subject categories
xdata <- rbind(xtrain, xtest)
ydata <- rbind(ytrain, ytest)
subjectdata <- rbind(subjecttrain, subjecttest)

# 2. Extract only the measurements on the mean and standard deviation for each measurement

   # a. Grab only columns that matches mean and std
pattern <- grep("mean\\(\\)|std\\(\\)", features[, 2])

   # b. subset the columns that has mean and std
xdata <- xdata[, pattern]

   # c. name the columns in xdata
names(xdata) <- features[pattern, 2]


# 3. Use descriptive activity names to name the activities in the data set

    # a. assign activity name to each value

ydata[, 1] <- activities[ydata[, 1], 2]

     # b. Assign colum name to activities

names(ydata) <- "activity"


# 4. Appropriately label the data set with descriptive variable names

names(subjectdata) <- "subject"

    # a. bind all the data 

allData <- cbind(xdata, ydata, subjectdata)


# 5. Create a second, independent tidy data set with the average of each variable for each activity
# and each subject


tidy_data <- ddply(allData, .(subject, activity), numcolwise(mean))

write.table(tidy_data, "tidy_data.txt", row.name=FALSE)