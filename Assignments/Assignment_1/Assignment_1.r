getwd()
RawData<-read.table("processed.cleveland.data",header = TRUE,sep = ',')
summary(RawData)

#Question1- How many patients have heart disease?
x<-length(which(mydata$heart_problem == 1))
cat("No. of patients have heart disease: ",x)

#Question2- What is the average Cholesterol level of people with heart disease and without heart disease? What is the standard deviation?
m<-tapply(RawData$chol,RawData$heart_problem,mean)
s<-tapply(RawData$chol,RawData$heart_problem,sd)
cat("average Cholesterol level of people with heart disease is: ",m[2])
cat("standard deviation of Cholesterol level of people with heart disease is: ",s[2])
cat("average Cholesterol level of people without heart disease is: ",m[1])
cat("standard deviation of cholesterol level of people without heart disease is: ",s[1])

#Question3- What is the median and average age of people with cholesterol higher than 240.0, higher than 240.0 with heart disease,
#higher than 240.0 without heart disease?
x<-RawData[RawData$chol>240,]
a<-mean(x$age)
median_a<-median(x$age)
avg<-tapply(x$age,x$heart_problem,mean)
median<-tapply(x$age,x$heart_problem,median)
cat("average age of people with cholestrol higher than 240 is: ",a)
cat("median of age with cholestrol higher than 240 is: ",median_a)
cat("average age of people with heart disease and cholesterol higher than 240 is: ",avg[2])
cat("median of age for people with heart disease and cholesterol higher than 240 is: ",median[2])
cat("average age of people without heart disease and cholesterol higher than 240 is: ",avg[1])
cat("median of age for people without heart disease and cholesterol higher than 240 is: ",median[1])

#Question4- Create a histogram of resting blood pressure.

hist(RawData$trestbps,
     main="Histogrm of Rest Blood Pressure",
     xlab="Resting blood pressure",
     col="Grey")

#Question5- Create boxplots based on the sex of the patients for the following attributes:
#            (i) cholesterol level
#           (ii) maximum heart rate achieved

boxplot(RawData$thalach~RawData$sex,
        main = "Boxplot of Sex and Max.Heart Rate Acheived",
        xlab="Max.Heart Rate Acheived",
        ylab="Sex(Male->1, Female->0)",
        col=c("Red","Blue"),
        horizontal = TRUE)
boxplot(RawData$chol~RawData$sex,
        main = "Boxplot of Sex and Cholesterol level",
        xlab="Cholesterol",
        ylab="Sex (Male->1, Female->0)",
        col=c("Red","Blue"),
        horizontal = TRUE)

#Question6- For each Box plot, answer the following questions:
#       (i) What is the H-Spread (Q3-Q1) of cholesterol level for male and females?
#      (ii) What are the Lower Hinge and Upper Hinge values for maximum heart rate for male and female?

q1<-tapply(RawData$chol,RawData$sex,quantile,c(0.25,0.75),na.rm=TRUE)
q1

q2<-tapply(RawData$thalach,RawData$sex,quantile,c(0.25,0.75),na.rm=TRUE)
q2

#Question7- In order to find if two attributes are related and their values change together, we can use Scatter plot. Follow the instruction below and 
#           answer the questions:
#       (i) Create two scatter plots of age and resting blood pressure for people with heart disease and without heart disease. Is there any visual correlation?
#      (ii) Calculate the average resting blood pressure of each age (HINT : Use Group by for age) for people with heart disease.
#           Calculate the average resting blood pressure of each age (HINT : Use Group by for age) for people without heart disease.
#     (iii) Now create two scatter plots using the previous results. Do you see a pattern now? Do people without heart disease have higher blood pressure
#           as they age than people with heart disease?

hd<-RawData[RawData$heart_problem==1,]
plot(hd$age,hd$trestbps,
     xlab="Age",
     ylab="Resting blood pressure",
     main="Scatter-plot for heart disease patient")

whd<-RawData[RawData$heart_problem==0,]
plot(whd$age,whd$trestbps,
     xlab="Age",
     ylab="Resting blood pressure",
     main="Scatter-plot for without heart disease patient")

plot(RawData$age,RawData$trestbps,xlab="Age",
     ylab="Resting blood pressure",
     main="Scatter-plot for every patient")

abline(lm(hd$trestbps~hd$age),col="Red")
abline(lm(whd$trestbps~whd$age),col="Blue")

x<-RawData[RawData$heart_problem==1,]
avg<-tapply(x$trestbps,x$age,mean)
avg

x1<-RawData[RawData$heart_problem==0,]
avg1<-tapply(x1$trestbps,x1$age,mean)
avg1

plot(avg,xlab="Age",
     ylab="Resting blood pressure",
     main="Scatter-plot for heart disease patients")

plot(avg1,xlab="Age",
     ylab="Resting blood pressure",
     main="Scatter-plot for without heart disease patients")


#Question8- Compare the resting blood pressure of people with heart disease and without.

s<-tapply(RawData$trestbps,RawData$heart_problem,summary,na.rm=TRUE)
s




