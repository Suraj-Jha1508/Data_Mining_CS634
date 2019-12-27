setwd("C:/Users/Suraj/OneDrive/Desktop/project_DM/")
#read sales data
sales_data<- read.csv(file = 'sales_train_v2.csv')

#read shops data
shops<- read.csv(file = 'shops.csv')

#read items data
items<- read.csv(file = 'items.csv')

#read item category data
item_categories<- read.csv(file = 'item_categories.csv')


#Joining data using left join as we want all data from left table(dataFrame)
library(dplyr)
sales_data<-left_join(sales_data,items)
sales_data<-left_join(sales_data,item_categories)
sales_data<-left_join(sales_data,shops)

#Going throug  the structure and summary of data
summary(sales_data)
str(sales_data)


#Partinioning data
train_data<-sales_data[(sales_data$date_block_num<33),]
test_data<-sales_data[!(sales_data$date_block_num<33),]

############################################     PROBLEM-1    ############################################################

#looking for missing data
sum(is.na(train_data))

#looking for negative values in item_price and item_cnt_day (As these cannot be negative)

#We checked for Negative item count, whether its the return item or an error.

library(sqldf)
sqldf('SELECT count(item_price) FROM train_data where item_price<0')

sqldf('SELECT count(item_cnt_day) FROM train_data where item_cnt_day<0')

#graphical representation of negative values

sales_grp_data<-sqldf('SELECT shop_id,item_id,avg(item_price) price,SUM(item_cnt_day) as total_count
                        FROM train_data group by shop_id,item_id
                      ')
sales_grp_data<-sqldf('SELECT shop_id,item_id,total_count FROM sales_grp_data where total_count<0')
str(sales_grp_data)

library(ggplot2)
library(naniar)
ggplot(train_data,aes(x = date_block_num,y = item_price)) +geom_miss_point()
ggplot(train_data,aes(x = date_block_num,y = item_cnt_day)) +geom_miss_point()

#replacing negative value to zero
train_data$item_price[train_data$item_price<0])<-0
summary(sales_data$item_price)

############################################     PROBLEM-2    ############################################################

#Outlier Detection

query1<-sqldf('SELECT date_block_num,(sum(item_cnt_day) *AVG(item_price)) as Total_revenue
              FROM train_data WHERE shop_id=0 GROUP BY date_block_num ')
ggplot(data=query1,aes(x=date_block_num,y=Total_revenue))+labs(x="Months",y="Total Revenue", 
                                                               title="Shop 0", subtitle="Highest Sale",
                                                               fill="Months")+geom_point()

query1<-sqldf('SELECT date_block_num,(sum(item_cnt_day) *AVG(item_price)) as Total_revenue
              FROM train_data WHERE shop_id=1 GROUP BY date_block_num ')
ggplot(data=query1,aes(x=date_block_num,y=Total_revenue))+labs(x="Months",y="Total Revenue", 
                                                               title="Shop 1", subtitle="Highest Sale",
                                                               fill="Months")+geom_point()
query1<-sqldf('SELECT date_block_num,(sum(item_cnt_day) *AVG(item_price)) as Total_revenue
              FROM train_data WHERE shop_id=2 GROUP BY date_block_num ')
ggplot(data=query1,aes(x=date_block_num,y=Total_revenue))+labs(x="Months",y="Total Revenue", 
                                                               title="Shop 2", subtitle="Highest Sale",
                                                               fill="Months")+geom_point()
query1<-sqldf('SELECT date_block_num,(sum(item_cnt_day) *AVG(item_price)) as Total_revenue
              FROM train_data WHERE shop_id=3 GROUP BY date_block_num ')
ggplot(data=query1,aes(x=date_block_num,y=Total_revenue))+labs(x="Months",y="Total Revenue", 
                                                               title="Shop 3", subtitle="Highest Sale",
                                                               fill="Months")+geom_point()
query1<-sqldf('SELECT date_block_num,(sum(item_cnt_day) *AVG(item_price)) as Total_revenue
              FROM train_data WHERE shop_id=4 GROUP BY date_block_num ')
ggplot(data=query1,aes(x=date_block_num,y=Total_revenue))+labs(x="Months",y="Total Revenue", 
                                                               title="Shop 4", subtitle="Highest Sale",
                                                               fill="Months")+geom_point()
query1<-sqldf('SELECT date_block_num,(sum(item_cnt_day) *AVG(item_price)) as Total_revenue
              FROM train_data WHERE shop_id=5 GROUP BY date_block_num ')
ggplot(data=query1,aes(x=date_block_num,y=Total_revenue))+labs(x="Months",y="Total Revenue", 
                                                               title="Shop 5", subtitle="Highest Sale",
                                                               fill="Months")+geom_point()
query1<-sqldf('SELECT date_block_num,(sum(item_cnt_day) *AVG(item_price)) as Total_revenue
              FROM train_data WHERE shop_id=6 GROUP BY date_block_num ')
ggplot(data=query1,aes(x=date_block_num,y=Total_revenue))+labs(x="Months",y="Total Revenue", 
                                                               title="Shop 6", subtitle="Highest Sale",
                                                               fill="Months")+geom_point()
############################################     PROBLEM-3    ############################################################


#Feature engineering adding day,month,year in data

library(lubridate)
#fromatting date
train_data$date<-dmy(train_data$date)

#adding columns
train_data$year<-year(train_data$date)
train_data$month<-month(train_data$date)
train_data$day<-day(train_data$date)
train_data$weekday<-weekdays(train_data$date)

#adding a unique id which is a combination of shop_id and item_id(shop_id+"-"+item_id) 

train_data$ID<-paste(train_data$shop_id,train_data$item_id,sep="_")

#removing unnecssary column
train_data$item_name<-NULL
train_data$item_category_name<-NULL
train_data$shop_name<-NULL
train_data$date<-NULL

#adding new column total Revenue to a duplicate dataFrame(similar to traindata) for more Exploratory Analysis

library(sqldf)
train_data_1<-sqldf('SELECT date_block_num,shop_id,item_id,item_cnt_day,item_price FROM train_data 
             GROUP BY date_block_num,shop_id,item_id')


train_data_1$total_sales_per_month<-(train_data_1$item_price*train_data_1$item_cnt_day)

shop_sales_per_month<-sqldf('SELECT shop_id,date_block_num,sum(total_sales_per_month) as "Total_Revenue" FROM train_data_1 GROUP BY shop_id,date_block_num')
total_revenue_month<-sqldf('SELECT date_block_num,sum(total_sales_per_month) as Total_Revenue FROM train_data_1 GROUP BY date_block_num')

ggplot(data = total_revenue_month) +
  aes(x=reorder(total_revenue_month$date_block_num,-total_revenue_month$Total_Revenue), y=total_revenue_month$Total_Revenue,fill=total_revenue_month$date_block_num) +
  geom_bar(stat = "identity",color="Black") +
  labs(x="Months",y="Total Revenue", title="Most popular Month", subtitle="Highest Sale",
       fill="Months") +
  geom_text(aes(label = paste ("",round(total_revenue_month$Total_Revenue))),size=4,hjust=1.1,vjust=.5,angle=90,color="black") +
  theme(legend.position = "") +
  theme(plot.title = element_text(color="grey", size=14, face="bold",hjust=.5, vjust=0.5)) +
  theme(plot.subtitle = element_text(color="blue", size=14, face="bold",hjust=.5, vjust=0.5)) +
  theme(axis.text.x=element_text(face = "bold",color = "palegreen4")) +
  theme(axis.text.y=element_text(face = "bold",color = "palegreen4"))



#model-1 linear regression
library(tictoc)
tic("time taken by linear regression")
linear_model<-lm( formula=item_cnt_day ~ shop_id + item_id,
                  data=train_data)
toc()
pred<-predict(linear_model,test_data[,c("shop_id","item_id")])

result=data.frame(shop_id=test_data$shop_id,item_id=test_data$item_id,item_cnt_pred=pred)

#Validation
#calculating rmse value
library(Metrics)
#RMSE value
rmse(result$item_cnt_pred, test_data$item_cnt_day)
#MSE value
mse(result$item_cnt_pred, test_data$item_cnt_day)
#final_result=data.frame(shop_id=test_data$shop_id,item_id=test_data$item_id,total_revenue=(result$total_revenue+result2$total_revenue)/2)

#Model-2(GBM)
library(gbm)
tic("Time Taken by GBM Model ")
gbm_model  =  gbm(item_cnt_day ~ shop_id + item_id,
                  data = train_data,
                  shrinkage = 0.001,
                  distribution = "gaussian",
                  n.trees = 1000,
                  interaction.depth = 1, 
                  bag.fraction = 0.5,
                  train.fraction = 0.8,
                  cv.folds = 10,
                  n.cores = 1,
                  verbose = T)

toc()
pred2 <- predict(gbm_model,newdata = test_data[,c("shop_id","item_id")], n.trees = 1000)
result2=data.frame(shop_id=test_data$shop_id,item_id=test_data$item_id,item_cnt_day_pred2=pred2)
#RMSE value
rmse(result2$item_cnt_day_pred2, test_data$item_cnt_day)

#MSE value
mse(result2$item_cnt_day_pred2, test_data$item_cnt_day)


#################################################################################################

set.seed(2019)
nrows<-dim(train_data)[1]
#randomize

randTraindata<-train_data[sample(1:nrows),]


#no of folds
k<-10

#splitting index

splitIndex<-(1:nrows)%%k
#converting into factor
splitFactor<-factor(splitIndex[order(splitIndex)])

train_sub<-split(randTraindata,splitFactor)
print(dim(train_sub[[1]]))

m1_rmse<-list()
m2_rmse<-list()
for(i in seq(1,k)){
  tr_data<-NULL
  Va_Data<-NULL
  for(j in seq(1,k)){
    if(j !=i){
      tr_data<-rbind(tr_data,train_sub[[j]])
    }
    else{
      Va_Data<-train_sub[[j]]
    }
  }
  linear_model<-lm( formula=item_cnt_day ~ shop_id + item_id,data=tr_data)
  gbm_model  =  gbm(item_cnt_day ~ shop_id + item_id,
                    data = tr_data,
                    shrinkage = 0.01,
                    distribution = "gaussian",
                    n.trees = 100,
                    interaction.depth = 5, 
                    bag.fraction = 0.5,
                    train.fraction = 0.8,
                    n.cores = -1,
                    verbose = T)
  
  pred2 <- predict(gbm_model,newdata = Va_Data[,c("shop_id","item_id")], n.trees = 100)
  result2=data.frame(shop_id=Va_Data$shop_id,item_id=Va_Data$item_id,item_cnt_day_pred2=pred2)
  m2_rmse[[i]]<-rmse(result2$item_cnt_day_pred2, Va_Data$item_cnt_day)
  pred<-predict(linear_model,Va_Data[,c("shop_id","item_id")])
  result=data.frame(shop_id=Va_Data$shop_id,item_id=Va_Data$item_id,item_cnt_pred=pred)
  m1_rmse[[i]]<-(rmse(result$item_cnt_pred, Va_Data$item_cnt_day))
}


rmse_1 <- data.frame(matrix(unlist(m1_rmse), nrow=length(m1_rmse), byrow=T))
rmse_2 <- data.frame(matrix(unlist(m2_rmse), nrow=length(m2_rmse), byrow=T))


colnames(rmse_1) <- c("rmse")
colnames(rmse_2) <- c("rmse")


library(Rmisc)
#Calculating Confidence Interval
#MODEL-1(Linear regression)
CI(rmse_1$rmse,ci=.95)

CI(rmse_1$rmse,ci=.90)

CI(rmse_1$rmse,ci=.80)

#MODEL-2(GBM Model)

CI(rmse_2$rmse,ci=.95)

CI(rmse_2$rmse,ci=.90)

CI(rmse_2$rmse,ci=.80)