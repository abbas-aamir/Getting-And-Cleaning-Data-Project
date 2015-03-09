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


