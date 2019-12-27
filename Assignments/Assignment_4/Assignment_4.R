getwd()
read.csv("student_grade.csv",header=TRUE)->record
str(record)
#Formating G3 column
record$G3<-ifelse(record$G3<10,"Fail","Pass")
str(record)
record$G3<-factor(record$G3)
str(record)

#partition of data into training and validation 

set.seed(1234)
sample(2,nrow(record),replace=TRUE,prob = c(0.7,0.3))->partition
record[partition==1,]->training_dataset
record[partition==2,]->validation_dataset

# Decision tree with rpart package 

rpart(G3~ .,training_dataset,method = "class")->tree
rpart.plot(tree)
#confusion matrix
predict(tree,validation_dataset,type='class')->test1

(table(validation_dataset$G3,test1)->table_DT)

#Accuracy of decision tree
sum(diag(table_DT))/sum(table1)->accuracy_DT

#recall of decision tree
(table_DT[1,1])/(sum(table_DT[,1]))->recall_DT

#precision of decision tree
(table_DT[1,1])/(sum(table_DT[1,]))->precision_DT

#Naive Bayes model

naive_bayes(G3~ .,data=training_dataset)->naive
plot(naive)

#confusion matrix of Naive Bayes
predict(naive,validation_dataset,type='class')->test2

(table(validation_dataset$G3,test2)->table_NB)

#Accuracy of Naive Bayes
sum(diag(table_NB))/sum(table_NB)->accuracy_NB

#recall of Naive Bayes
(table_NB[1,1])/(sum(table_NB[,1]))->recall_NB

#precision of Naive Bayes
(table_NB[1,1])/(sum(table_NB[1,]))->precision_NB
