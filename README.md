# GetAndCleanDataCourseProject
CourseProject
# Description

##The script works as follows:

Prerequisite:
set working directory to the unzipped folder first (where README.txt or features.txt are).

Steps:
1. load dplyr library
2. import features.txt, store the name
3. import y-Train, subject-Train
4. import x-Train with features name as colname, and then do select based on column name contains "-mean()" or "-std()"
5. do the same to test folder
6. conbine train and test.
7. join columns, make new data frame with first column subject ID, second column Activity name, x as rest of the columns.
8. rename the column names.
9. aggregate the new data frame based on subject ID and activity ID.
10.rename the column names of new data frame.
11.write the new data frame to comma delimiter file "tidydata.txt"
