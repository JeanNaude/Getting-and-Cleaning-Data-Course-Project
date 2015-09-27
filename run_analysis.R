## Getting and Cleaning Data Course Project
## September 2015

# The function run_analysis reads the raw data and does the following:

#1.  Merges the training and the test sets to create one data set.
#2.  Extracts only the measurements on the mean and standard deviation 
#    for each measurement. 
#3.  Uses descriptive activity names to name the activities in the data set
#4.  Appropriately labels the data set with descriptive variable names. 
#5.  From the data set in step 4, creates a second, independent tidy data set with 
#    the average of each variable for each activity and each subject.

# The output of the function is the tidy data set created in step 5.
# For more information see 

# Parameters: directory = ""
# directory: the directory in which the raw data is to be found, and in which 
# the tidy data set will be saved. The current working directory is used if 
# the default value of directory = "" is used.


run_analysis <- function(directory = "") {
    library(plyr)
    library(dplyr)
    
    # Set up directory paths
    url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    dataDirectory <- "UCI HAR Dataset"
    dataSummaryFileName <- "dataSummary.txt"
    rawDataFileName <- "getdata_projectfiles_UCI HAR Dataset.zip"
    
    #set up working directory
    if (directory == "") directory <- getwd()
    setwd(directory)
    
    #If data directory not in workding directory, check for zip file.
    #If zip file not available, download it 
    if (!file.exists(dataDirectory)) {
        if (!file.exists(rawDataFileName))
            download.file(url, rawDataFileName, method = "libcurl", mode="wb")
   
        unzip(rawDataFileName) #creates directory
    }
    dirPath <- file.path(directory, dataDirectory)
    
    if(!file.exists(dataDirectory)) message("Please check url")
    
    trainpath <- file.path(dirPath, "train")
    testpath <- file.path(dirPath, "test")
    
    #load data into workspace
    trainData <- read.table(file.path(trainpath,"x_train.txt"))
    trainSubject <- read.table(file.path(trainpath,"subject_train.txt"))
    trainActivity <- read.table(file.path(trainpath,"y_train.txt"))
    testData <- read.table(file.path(testpath,"x_test.txt"))
    testSubject <- read.table(file.path(testpath,"subject_test.txt"))
    testActivity <- read.table(file.path(testpath,"y_test.txt"))
    
    #load activity names
    activityLabels <- read.table(file.path(dirPath,"activity_labels.txt"))
    
    #load variable names
    features <- read.table(file.path(dirPath,"features.txt"))
    
    #add subject and activity columns to datasets and merge
    allData <- rbind(cbind(trainSubject, trainActivity, trainData),
                     cbind(testSubject, testActivity, testData))
    
    #extract only mean and standard deviation measurements
    requiredFeatures <-grep("mean|std", features$V2, value=FALSE)
    requiredColumns <- c(1,2,requiredFeatures + 2)
    dataSubset <- allData[,requiredColumns]
    featureSubset <- features[requiredFeatures,]
    
    #Lable data with descriptive variable names
    #remove brackets in names
    featureSubset$varNames <- sub("\\(\\)", "",featureSubset$V2)
    #replace - with . and make sure names are unique
    featureSubset$varNames <- make.names(featureSubset$varNames,unique = TRUE)
    #name the columns in the data subset
    colnames(dataSubset) <- c("Subject.ID","Activity.Code", featureSubset$varNames)
    
  
    #Add activity names according to activity codes
    dataSubset$Activity.Name <- activityLabels$V2[dataSubset$Activity.Code]
    
    
    #create a second, independent tidy data set with 
    #the average of each variable for each activity and each subject.
    dt <- group_by(dataSubset, Subject.ID, Activity.Code, Activity.Name) %>% 
        summarize_each(funs(mean))
    
    #output tidy data set
    write.table(dt, dataSummaryFileName, row.name=FALSE) 
    
    print(paste("The data has been saved in", file.path(directory, dataSummaryFileName),"."))
    print("Please use the read.table command with header = TRUE to load the data.")   
  
    #output of the function is the tidy data set
    dt
}