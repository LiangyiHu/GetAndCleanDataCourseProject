library(dplyr)

FeatureNames<-read.table("features.txt",colClasses=c("numeric","character"))[,2]
activity<-read.table("activity_labels.txt",colClasses="character")[,2]
ytrain<-read.table("train/y_train.txt")[,1]
subjecttrain<-read.table("train/subject_train.txt")[,1]
xtrain<-select(read.table("train/x_train.txt",col.names=FeatureNames),which(grepl("-mean()",FeatureNames,fixed=TRUE)|grepl("-std()",FeatureNames,fixed=TRUE)))
ytest<-read.table("test/y_test.txt")[,1]
subjecttest<-read.table("test/subject_test.txt")[,1]
xtest<-select(read.table("test/x_test.txt",col.names=FeatureNames),which(grepl("-mean()",FeatureNames,fixed=TRUE)|grepl("-std()",FeatureNames,fixed=TRUE)))
masterx<-rbind(xtrain,xtest)
mastery<-activity[c(ytrain,ytest)]
mastersubject<-c(subjecttrain,subjecttest)
MasterTable<-data.frame(mastersubject,mastery,masterx)
names(MasterTable)[c(1,2)]<-c("SubjectID","Activity")
TidyData<-aggregate(MasterTable[-c(1,2)],by=list(MasterTable$SubjectID,MasterTable$Activity),FUN=mean)
names(TidyData)[c(1,2)]<-c("SubjectID","Activity")
write.table(TidyData,"tidydata.txt",sep = ",",row.names=FALSE)
