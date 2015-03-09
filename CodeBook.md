# CodeBook for run_analysis.R
The purpose of this code is to prepare a tidy dataset from raw data, that can be used for further analysis.
# Data Source
One of the most exciting areas in all of data science right now is wearable computing - see for example this article. 
Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. 
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S 
smartphone. A full description is available [at the site] (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) where the data was obtained.
The data can be downloaded from [this link] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
# Data Processing Steps
Following are the data processing and cleansing steps taken on the raw data.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Running the code
Following are the steps to execute the code.

1. Download the data from [this link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ), and save in your working directory.
2. Unzip the file. Do not change anything in the folder. (Folder name should be 'UCI HAR Dataset')
3. Download run_analysis.R file from git repo and save in the working directory.
4. Run the following code in R console.
            
            source("run_analysis.R")
            run_analysis()

5. When you get the control back, look for the file 'final_data_2.txt' in the folder 'UCI HAR Dataset' in your working directory. This file contains the final output.

# Output
This code creates two .txt files in 'UCI HAR Dataset' folder in your R working directory.

1. final_data.txt (data output from task 4 of the project)
2. final_data_2.txt (data output from task 5 of the project)

# Variables and Formulae
Here are the variables used in this code with their description:

1. old.wd : old working directory
2. data_train : raw training data
3. data_test : raw test data
4. activity_train : raw training labels
5. activity_test : raw test labels
6. subject_train : training subjects
7. subject_test : test subjects
8. features : the feature vector
9. activities : activity labels
10. feature_index : V1 column of features in numeric form
11. feature_name : V2 column of features in character form
12. final_training_data : all training data, binded as columns
13. final_test_data : all test data, binded as columns
14. final_data : final_training_data and final_test_data, binded as rows
15. final_data_2 : aggregated data from final_data on Activity and Subject, by mean

# How it works
Here are the operations this code snippet does in order to process the data.

1. Save the old working directory
2. Change the working directory to 'UCI HAR Dataset', a folder that exists in R working directory and contains all the files
3. Load all the training and test datasets using read.table commands
4. Load the 'features' and 'activity labels' datasets
5. Filter the 'features' dataset by keeping the rows that contain either 'mean' or 'std'
6. Reset row-numbers of 'features'
7. Extract V1 column of 'features' as 'feature_index' in numeric form
8. Extract V2 column of 'features' as 'feature_name' in character form
9. Create descriptive substitutions in 'feature_name'
10. Column bind 'subject_train', 'activity_train' and filtered dataset 'data_train' on 'feature_index' as 'final_training_data'
11. Column bind 'subject_test', 'activity_test' and filtered dataset 'data_test' on 'feature_index' as 'final_test_data'
12. Row bind the above two datasets as 'final_data'
13. Assign the descriptive column names to 'final_data'
14. Order 'final_data' on Subject and Activity
15. Create a new dataset 'final_data_2' by aggregating 'final_data' over Subject and Activity using mean function
16. Write the datasets 'final_data' and 'final_data_2' in separate .txt files.
