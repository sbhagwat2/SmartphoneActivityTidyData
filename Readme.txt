Course:                          Getting and Cleaning Data
Specialization:                  Data Science Specialization
Peer-Graded Assignment:          Create a tidy data set from raw data
Name                             Samir P. Bhagwat

This assignment includes:
1. This file Readme.txt

2. Codebook file titled: Codebook.md

3. Dataset File        Extracted data                   Name: "d3.txt"

4. Dataset File 2.     Summary of extracted Data        Name: "d3sum.txt"

5. Script: run_analysis.R

6. Column names: 'columns.txt'

Data Analysis was performed as follows:
1. Download of all the data from the website link [1].

2. Reading of all the datafiles into R using package "data.table".

3. Addition of subject name columns to both datasets: test (x_train) and subject(x_test).

4. Remove special characters from `feature` data.frame [Upper case letters were not converted
to lowercase in order to maintain readability].

5. Add columnnames to both test and training data using the cleaned up `feature`.

6. Add activities code column to both datasets using "y-test" and "y_train"

7. Add column `activityName` with appropriate activity labels applied according to the activityCode.

8. combine test and train datasets.

9. Extract appropriate columns according to the rules: 
                Variable names chosen:
                All variable names that had either of the four words in them "Mean", "mean",                    "Std" or "std". These names were chosen aftern looking through the columns. 

10 Write appropriate .csv files



Tidy data: data in the dataset "d3sum.txt" is "Tidy", as defined in [3], i.e., it means that 
        a. Each variable has its own column.
        b. Each observation has its own row.
        c. Each type of observation is stored in one table 
        d. Multiple tables are linked by a "key", a column, that is referenced in another 
        table.
Principle c and d does not apply here because we only have a single data file.


References:
[1]http://archive.ics.uci.edu/ml/datasets/Smartphone-Based+Recognition+of+Human+Activities+and+Postural+Transitions

[2] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

[3]Wickham, Hadley. Tidy Data. 2014. Journal of Statistical Software. 59(10):1-23.

