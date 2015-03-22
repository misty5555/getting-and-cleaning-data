readSubjectTrain<-read.table("subject_train.txt")
readSubjectTest<-read.table("Subject_test.txt")
combinedSubject <- rbind(readSubjectTrain,readSubjectTest) ##combine train and test subject files
dim(combinedSubject)
readLabelTrain<-read.table("y_train.txt")
readLabelTest<-read.table("y_test.txt")
table(readLabelTrain)
table(readLabelTest)
combinedLabel<-rbind(readLabelTrain,readLabelTest) ##combine train and test activity files
dim(combinedLabel)
readDataTrain<-read.table("X_train.txt")
readDataTest<-read.table("X_test.txt")
combinedData<-rbind(readDataTrain,readDataTest) ##combine train and test measurement files
dim(combinedData)
readFeatures <-read.table("features.txt")
dim(readFeatures)
head(readFeatures,5) 

extractedMeanStd<-grep("mean\\(\\)|std\\(\\)",readFeatures[,2]) ##use grep function to search mean and standard deviation measurements in the combined data set
print(extractedMeanStd) ##66 related meansurements found
combinedData<-combinedData[,extractedMeanStd] ##only grabing the mean and standard deviation meansurements from the data 
dim(combinedData) ##see only 66 columns left, corresponding to the 66 measurements found in the previous step
names(combinedData)<-gsub("\\(\\)","",readFeatures[extractedMeanStd,2]) ##use gsub function to replace messy names with cleaner one, making small adjustments
names(combinedData)<-gsub("mean","Mean",names(combinedData))
names(combinedData)<-gsub("std","Std",names(combinedData))
names(combinedData)<-gsub("-","",names(combinedData))

readActivity<-read.table("activity_labels.txt")
print(readActivity)
readActivity[,2]<-tolower(gsub("_","",readActivity[,2])) ##remove "_"and lowercase the activity names
substr(readActivity[2, 2], 8, 8) <- toupper(substr(readActivity[2, 2], 8, 8)) ##use toupper and stubstr functions to upcase the "u" and "d" letter in word "walkingupdstairs" and "walkingdownstair" respectively
substr(readActivity[3, 2], 8, 8) <- toupper(substr(readActivity[3, 2], 8, 8))
activityLabel <- readActivity[combinedLabel[,1],2]
combinedLabel[,1]<-activityLabel ##apply 6 activity names to the column in the combinedLabel data table
names(combinedLabel) <- "activity" ##rename the column 2 to "activity"

names(combinedSubject) <-"subject" ##rename to column 2 to "subject"
mergeData<-cbind(combinedSubject,combinedData)
dim(mergeData)
mergedData<-cbind(mergeData,combinedLabel)
dim(mergedData) ##column-bind all the 3 data tables. now the new mergedData data table contains 10299 rows and 68 columns. This new data table will be used in solving question 5
write.table(mergedData,"merged_data_table.txt") 
head(mergedData)
dim(mergedData)

subjectLen <- length(table(combinedSubject)) 
activityLen <- dim(readActivity)[1] 
columnLen <- dim(mergedData)[2]
DatawithMean <- matrix(NA, nrow=subjectLen*activityLen, ncol=columnLen) ##define the dimension of the new data table 
DatawithMean <- as.data.frame(DatawithMean)
colnames(DatawithMean) <- colnames(mergedData)
row <- 1
for(i in 1:subjectLen) { 
        for(j in 1:activityLen) {
                DatawithMean[row, 1] <- sort(unique(combinedSubject)[, 1])[i]
                DatawithMean[row, 2] <- readActivity[j, 2]
                bool1 <- i == mergedData$subject
                bool2 <- readActivity[j, 2] == mergedData$activity
                DatawithMean[row, 3:columnLen-1] <- colMeans(mergedData[bool1&bool2, 3:columnLen-1])
                row <- row + 1
        } ##use the for loop function to calculate the mean
}
head(DatawithMean)
write.table(DatawithMean, "data_with_means.txt")