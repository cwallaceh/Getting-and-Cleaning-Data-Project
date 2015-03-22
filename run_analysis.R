library(plyr)

### 1. Merges the training and the test sets to create one data set.

# Read and merge x_data set
x_data <- rbind(read.table("UCI HAR Dataset/train/X_train.txt"), read.table("UCI HAR Dataset/test/X_test.txt"))

# Read and merge y_data set
y_data <- rbind(read.table("UCI HAR Dataset/train/y_train.txt"), read.table("UCI HAR Dataset/test/y_test.txt"))

# Read and merge subject_data set
subject_data <- rbind(read.table("UCI HAR Dataset/train/subject_train.txt"), read.table("UCI HAR Dataset/test/subject_test.txt"))

### 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

# Read features data
features_data <- read.table("UCI HAR Dataset/features.txt")

# Get the x_data column names
colnames(x_data) <- features_data[,2]

# Subset x_data by features containing mean() or std()
x_data <- x_data[grepl("mean()", colnames(x_data), fixed = TRUE) | grepl("std()", colnames(x_data), fixed = TRUE)]

### 3. Uses descriptive activity names to name the activities in the data set

# Read activities data
activities_data <- read.table("UCI HAR Dataset/activity_labels.txt")

# Replace y_data with its activity names
y_data <- join(y_data, activities_data)[-1]

### 4. Appropriately labels the data set with descriptive variable names. 

# Replace subject_data and y_data column names
colnames(subject_data) <- "subject"
colnames(y_data) <- "activity"

# Merge al data in one data base
tidy_data <- cbind(x_data, y_data, subject_data)

### 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

independent_tidy_data <- aggregate(tidy_data[, 1:66], by = list(as.factor(tidy_data$subject), as.factor(tidy_data$activity)), FUN = "mean")

# Rename the subject and acitivty columns
independent_tidy_data <- rename(independent_tidy_data , c("Group.1"="subject", "Group.2"="activity"))

# Save the data as a table
write.table(independent_tidy_data, "independent_tidy_data.txt", row.name=FALSE)