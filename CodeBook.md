#Code Book: Samsung Data

The raw data set consists of data collected from the accelerometers and 
gyroscopes of Samsung Galaxy S smartphones and is available from: <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>.  
See <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones> for details of data.

The raw data was processed by the R function run_analysis in the script 
run_analysis.R. (see <https://github.com/JeanNaude/Getting-and-Cleaning-Data-Course-Project/README.md> for more details) The data set produced by the R script contains the mean per subject per activity of all mean or standard deviation measurements.

The data set has 82 variables.  The first three are described in the table below. 

Column |Variable Name | Description | Data Type | Values 
-------|--------------|-------------|-----------|--------
1 |Subject.ID | Subject identity | int | 1 -- 30
2 |Activity.Code | Activity code | int | 1 -- 6
3 |Activity.Name | Activity name | Factor with 6 levels | WALKING
 | | | corresponding to activity codes | | WALKING_UPSTAIRS
 | | | |  |WALKING_DOWNSTAIRS
 | | | | | SITTING
 | | | | | STANDING
 | | | | | LAYING

Meausurement variables
----------------------
Variables in columns 4 to 82 have names that use the following abbreviations:

Prefix of t: time measurement  
Prefix of f: frequency measurement  
Acc: accelerometer measurement  
Gyro: gyroscope measurement  
Mag: magnitude  
Freq: frequency  
std: standard deviation  
Postfix of X: measurement along X-axis  
Postfix of Y: measurement along Y-axis  
Postfix of Z: measurement along Z-axis  

For example, "tBodyAcc.mean.X", is the mean of all time measurements of body 
acceleration along the X-axis, and "fBodyGyro.mean.Z" is the mean of all body
gyroscope measurements along the Z-axis.

The original accelerometer measurements were in standard gravity units 'g', and
the original gyroscope measurements were in radians/second.  However all
 measurements were normalized.  Thus the data type of these variables is
 number, and the values are bounded in [-1,1].
 

Column | Variable name
-------|--------------
3      |tBodyAcc.mean.X
4      |tBodyAcc.mean.Y
5      |tBodyAcc.mean.Z
6 |tBodyAcc.std.X
7 |tBodyAcc.std.Y
8 |tBodyAcc.std.Z
9 |tGravityAcc.mean.X
10 |tGravityAcc.mean.Y
11 |tGravityAcc.mean.Z
12 |tGravityAcc.std.X
13 |tGravityAcc.std.Y
14 |tGravityAcc.std.Z
15 |tBodyAccJerk.mean.X
16 |tBodyAccJerk.mean.Y
17 |tBodyAccJerk.mean.Z
18 |tBodyAccJerk.std.X
19 |tBodyAccJerk.std.Y
20 |tBodyAccJerk.std.Z
21 |tBodyGyro.mean.X
22 |tBodyGyro.mean.Y
23 |tBodyGyro.mean.Z
24 |tBodyGyro.std.X
25 |tBodyGyro.std.Y
26 |tBodyGyro.std.Z
27 |tBodyGyroJerk.mean.X
28 |tBodyGyroJerk.mean.Y
29 |tBodyGyroJerk.mean.Z
30 |tBodyGyroJerk.std.X
31 |tBodyGyroJerk.std.Y
32 |tBodyGyroJerk.std.Z
33 |tBodyAccMag.mean
34 |tBodyAccMag.std
35 |tGravityAccMag.mean
36 |tGravityAccMag.std
37 |tBodyAccJerkMag.mean
38 |tBodyAccJerkMag.std
39 |tBodyGyroMag.mean
40 |tBodyGyroMag.std
41 |tBodyGyroJerkMag.mean
42 |tBodyGyroJerkMag.std
43 |fBodyAcc.mean.X
44 |fBodyAcc.mean.Y
45 | fBodyAcc.mean.Z
46 |fBodyAcc.std.X
47 |fBodyAcc.std.Y
48 |fBodyAcc.std.Z
49 |fBodyAcc.meanFreq.X
50 | fBodyAcc.meanFreq.Y
51|fBodyAcc.meanFreq.Z
52|fBodyAccJerk.mean.X
53|fBodyAccJerk.mean.Y
54|fBodyAccJerk.mean.Z
55|fBodyAccJerk.std.X
56|fBodyAccJerk.std.Y
57|fBodyAccJerk.std.Z
58|fBodyAccJerk.meanFreq.X
59|fBodyAccJerk.meanFreq.Y
60|fBodyAccJerk.meanFreq.Z
61|fBodyGyro.mean.X
62|fBodyGyro.mean.Y
63|fBodyGyro.mean.Z
64|fBodyGyro.std.X
65|fBodyGyro.std.Y
66|fBodyGyro.std.Z
67|fBodyGyro.meanFreq.X
68|fBodyGyro.meanFreq.Y
69|fBodyGyro.meanFreq.Z
70|fBodyAccMag.mean
71|fBodyAccMag.std
72|fBodyAccMag.meanFreq
73|fBodyBodyAccJerkMag.mean
74|fBodyBodyAccJerkMag.std
75|fBodyBodyAccJerkMag.meanFreq
76|fBodyBodyGyroMag.mean
77|fBodyBodyGyroMag.std
78|fBodyBodyGyroMag.meanFreq
79|fBodyBodyGyroJerkMag.mean
81|fBodyBodyGyroJerkMag.std
82|fBodyBodyGyroJerkMag.meanFreq
