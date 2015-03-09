# Getting-And-Cleaning-Data-Project

The purpose of the repository is to fullfil the requirement of course project of the course Getting and Cleaning Data
by Jeff Leek, , Johns Hopkins University.

This project contains 5 files.

1. .gitignore, containing files that should be ignored while committing the code to git.
2. LICENSE, the GNU license.
3. README.md, the readme file with repo information.
4. run_analysis.R, the actual code to run the analysis required in the course project.
5. CodeBook.md, describing the code, execution steps and expected output.

# Running the Code:

1. Download the data from [this link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ), and save in your working directory.
2. Unzip the file. Do not change anything in the folder. (Folder name should be 'UCI HAR Dataset')
3. Download run_analysis.R file from git repo and save in the working directory.
4. Run the following code in R console.
            
            source("run_analysis.R")
            run_analysis()

5. When you get the control back, look for the file 'final_data_2.txt' in the folder 'UCI HAR Dataset' in your working directory. This file contains the final output.

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


