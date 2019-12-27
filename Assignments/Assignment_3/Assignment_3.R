#####################################################################################
#######                                Solution:1                             #######
#####################################################################################
getwd()
setwd("C:/Users/Suraj/OneDrive/Desktop/Fall_2019/CS634/")
#Step 1.Calling libraries : arules, arulesViz .
library(arules)
library(arulesViz)
#Step 2.Upload data in transaction form.
forests<-read.transactions("forests.txt",header = FALSE)
summary(forests)
#Step 3.Calling apriori function to check frequent itemsets with support =50%.
rule1<-apriori(forests,parameter = list(support = 0.5,target = "frequent itemsets"))
summary(rule1)
#Step 4. Final Solution can be seen by below script:
view1<-inspect(rule1)


###########################################################################################
#######                                    Solution:2                               #######
###########################################################################################

#Step 1.Calling apriori function to check max frequent itemsets with support =50%.
rule2<-apriori(forests,parameter = list(support = 0.5,target="maximally frequent itemsets"))
summary(rule2)
#Step 2.get the output by inspect:
view2<-inspect(rule2)

#############################################################################################
#######                                    Solution:3                                 #######
#############################################################################################

#Step 1.Calling apriori function to check association rule for support=40% and confidence=70%.
rule3<-apriori(forests,parameter = list(support = 0.4,confidence =0.7,target="rule"))
summary(rule3)
#Step 2.get the output by inspect:
view3<-inspect(rule3)