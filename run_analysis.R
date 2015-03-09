run_analysis <- function() {
    
    library(reshape2)
    
    # saving old working directory
    
    old.wd <- getwd()
    
    # changing working directory
    
    setwd('UCI HAR Dataset')
    
    # loading all the data
    
    data_train <- read.table('train/X_train.txt')
    data_test <- read.table('test/X_test.txt')
    
    activity_train <- read.table('train/y_train.txt')
    activity_test <- read.table('test/y_test.txt')
    
    subject_train <- read.table('train/subject_train.txt')
    subject_test <- read.table('test/subject_test.txt')
    
    features <- read.table('features.txt')
    activities <- read.table('activity_labels.txt')
    
    # filtering the features and resetting indices. this will be used for task 2.
    
    features <- features[(grep('mean\\(\\)|std\\(\\)',features$V2)),]
    rownames(features) <- NULL
    
    # renaming features. will be used for task 3.
    
    feature_index <- as.numeric(features$V1)
    feature_name <- as.character(features$V2)
    feature_name <- sub('-mean\\(\\)-{0,1}','Mean',feature_name)
    feature_name <- sub('-std\\(\\)-{0,1}','Std',feature_name)
    feature_name <- sub('^t','Time',feature_name)
    feature_name <- sub('^f','Freq',feature_name)
    feature_name <- sub('BodyBody','Body',feature_name)
    
    # merging cleaned data. completing task 1 & 2. data is combined, and filtered.
    
    final_training_data <- cbind(subject_train, activity_train, data_train[, feature_index])
    final_test_data <- cbind(subject_test, activity_test, data_test[, feature_index])
    final_data <- rbind(final_training_data, final_test_data)
    
    # completing task 3 by assigning descriptive names to the columns for each activity type.
    
    colnames(final_data) <- c('Subject', 'Activity', feature_name)
    
    # labeling the rows with descriptive names. this, completing task 4.
    
    final_data <- final_data[with(final_data,order(Subject,Activity)),]
    final_data <- within(final_data,Activity <- factor(Activity, labels = c('WALKING', 'WALKING_UPSTAIRS', 'WALKING_DOWNSTAIRS', 'SITTING', 'STANDING', 'LAYING')))
    rownames(final_data) <- NULL
    
    # creating second dataset, completing task 5.
    
    final_data_2 <- aggregate(.~Activity+Subject, data = final_data, FUN = mean)
    final_data_2 <- final_data_2[,c(2,1,3:ncol(final_data_2))]
    final_data_2 <- melt(final_data_2,id.var=1:2)
    colnames(final_data_2) <- c('Subject', 'Activity', 'Feature', 'Mean')
    
    # saving the datasets
    
    write.table(final_data, file = 'final_data.txt', sep = '\t', row.names = FALSE)
    write.table(final_data, file = 'final_data_2.txt', sep = '\t', row.names = FALSE)
    
    # changing back the working directory
    
    setwd(old.wd)
    
}
