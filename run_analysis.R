## Attach some of the packages needed for this project
library(data.table)
# Read test datasets into R
x_test <- fread("datasciencecoursera/Getting and Cleaning Data/Week4 Project Data/UCI HAR Dataset/test/X_test.txt")
dim(x_test)
y_test <- fread("datasciencecoursera/Getting and Cleaning Data/Week4 Project Data/UCI HAR Dataset/test/y_test.txt")
dim(y_test)
# Import training datasets in R
x_train <- fread("datasciencecoursera/Getting and Cleaning Data/Week4 Project Data/UCI HAR Dataset/train/X_train.txt")
dim(x_train)
y_train <- fread("datasciencecoursera/Getting and Cleaning Data/Week4 Project Data/UCI HAR Dataset/train/y_train.txt")
dim(y_train)
# import features into R
feature <- fread("datasciencecoursera/Getting and Cleaning Data/Week4 Project Data/UCI HAR Dataset/features.txt")
dim(feature)
# Import subect data into R for test and training datasets
subject_test <- fread("datasciencecoursera/Getting and Cleaning Data/Week4 Project Data/UCI HAR Dataset/test/subject_test.txt")
dim(subject_test)
subject_train <- fread("datasciencecoursera/Getting and Cleaning Data/Week4 Project Data/UCI HAR Dataset/train/subject_train.txt")      
dim(subject_train)


## clean up variable stored in feature. 
View(feature)
feature$V2 <- gsub("[.]|[-]|[,]|[()]|[(]|[)]","",feature$V2)
View(feature)
## assign cleaned up feature names as column names to x_test and x_train
colnames(x_test) <- feature$V2
colnames(x_train) <- feature$V2
## remove feature, not needed
rm(feature)
## add a column with subject to both x_test and x_train and remove the subject_test 
## subject_train frames
x_test$subject <- as.character(subject_test$V1)
rm(subject_test)
View(x_test)
x_train$subject <- as.character(subject_train$V1)
rm(subject_train)
View(x_train)
## add activity code values to both datasets, and remove the y_test and y_train
## frames
x_test$activityCode <- y_test$V1
rm(y_test)
x_train$activityCode <- y_train$V1
rm(y_train)
## define dataframe matching activity codes to activities
activities <- data.frame(codes = c("1","2","3","4","5","6"),activity = c("WALKING","WALKING_USTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"))
## Add a column to x_test and x_train with specific activity for specific activity code
## NOTE: this takes a lot of time.
for (i in 1:6) {
        for (j in 1:2947) {
                if (as.integer(activities$codes[i]) == x_test$activityCode[j]) {
                        x_test$activityName[j] <- as.character(activities$activity[i])
                }
        }
        
}

for (i in 1:6) {
        for (j in 1:7352) {
                if (as.integer(activities$codes[i]) == x_train$activityCode[j]) {
                        x_train$activityName[j] <- as.character(activities$activity[i])
                }
        }
        
}
## check whether the assignment step went over ok by tabulating the results
table(x_test$activityCode,x_test$activityName)
table(x_train$activityCode,x_train$activityName)
## combine the two data frames
d <- rbind(x_test,x_train)
d <- as.data.frame(d) ## convert d into a data frame from data table, it seems
## necessary for the subsetting of d to d2 to work.

##Choose the columns that have [Mm]ean or [Ss]td in them.
## First create a vector with the column numbers that satisfy this condition,
## Second: subset d containing column numbers from that vector plus subject and activity 
## columns
num <- grep("[Mm]ean|[Ss]td",colnames(d))
d2 <- d[,c(num,562,564)]
View(d2)

## Create summary data frames
library(dplyr)
d3 <- group_by(d2,subject,activityName)
write.table(d3,"d3.txt",row.names = FALSE)
d3sum <- summarise_all(d3,mean)
View(d3sum)
write.table(d3sum,"d3sum.txt",row.names = FALSE)


