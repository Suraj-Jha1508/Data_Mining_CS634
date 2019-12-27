getwd()
setwd("./R")
car<-read.csv("car.data",header=FALSE)
names(car)<-c("Buying","Maintenance","Doors","Person","Lug_boot","Safety","Class Values")
mat_car=as.matrix(car)

#Question1 and 2:Find the set of cars that have the highest similarity/dissimilarity with each other.
  #Ranking
  for (i in 1:1728){
    for (j in 1:7){
      if (j == 1 || j ==2){
        if(mat_car[i,j] == "vhigh"){
          mat_car[i,j] = 4
        }else{
          if(mat_car[i,j] == "high"){
            mat_car[i,j] = 3
          }else{
            if(mat_car[i,j] == "med"){
              mat_car[i,j] = 2
            }else{
              if(mat_car[i,j] == "low")
                mat_car[i,j] = 1
            }
          }
        }
      }else{
        if(j == 3){
          if(mat_car[i,j] == "5more"){
            mat_car[i,j] = 4
          }else{
            if(mat_car[i,j] == "4"){
              mat_car[i,j] = 3
            }else{
              if(mat_car[i,j] == "3"){
                mat_car[i,j] = 2
              }else{
                if(mat_car[i,j] == "2"){
                  mat_car[i,j] = 1
                }
              }
            }
          }
        }else{
          if(j == 4){
            if(mat_car[i,j] == "more"){
              mat_car[i,j] = 3
            }else{
              if(mat_car[i,j] == "4"){
                mat_car[i,j] = 2
              }else{
                if(mat_car[i,j] == "2"){
                  mat_car[i,j] = 1
                }
              }
            }
          }else{
            if(j == 5){
              if(mat_car[i,j] == "big"){
                mat_car[i,j] = 3
              }else{
                if(mat_car[i,j] == "med"){
                  mat_car[i,j] = 2
                }else{
                  if(mat_car[i,j] == "small"){
                    mat_car[i,j] = 1
                  }
                }
              }
            }else{
              if(j == 6){
                if(mat_car[i,j] == "high"){
                  mat_car[i,j] = 3
                }else{
                  if(mat_car[i,j] == "med"){
                    mat_car[i,j] = 2
                  }else{
                    if(mat_car[i,j] == "low"){
                      mat_car[i,j] = 1
                    }
                  }
                }
              }else{
                if(j == 7){
                  if(mat_car[i,j] == "vgood"){
                    mat_car[i,j] = 4
                  }else{
                    if(mat_car[i,j] == "good"){
                      mat_car[i,j] = 3
                    }else{
                      if(mat_car[i,j] == "acc"){
                        mat_car[i,j] = 2
                      }else{
                        if(mat_car[i,j] == "unacc"){
                          mat_car[i,j] = 1
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
      
      
    }
  }
#normalization
v=c(1,2,3,7)
for(i in 1:1728){
  for(j in 1:7){
    if(j == 1 || j == 2 || j == 3 || j == 7){
      mat_car[i,j]=(as.numeric(mat_car[i,j])-1)/3
    }else{
      mat_car[i,j]=(as.numeric(mat_car[i,j])-1)/2
    }
  }
}

dissim=matrix(nrow=1728, ncol=1728)
sim=matrix(nrow=1728, ncol=1728)

#similarity and dissimilarity calculation

for(i in 1:1728){
  for(j in 1:1728){
    dissim[i,j]=0
    sim[i,j]=0
    if(i==j){
      dissim[i,j]=0
    }else{
      for(k in 1:7){
        dissim[i,j]=dissim[i,j]+((as.numeric(mat_car[i,k])-as.numeric(mat_car[j,k]))^2)
      }
    }
    dissim[i,j]=(dissim[i,j])^(1/2)
    sim[i,j]=1-dissim[i,j]
  }
}

#max function
max<-function(mat){
  list=c(0,0,0)
  for(i in 1:1728){
    for(j in 1:1728){
      if(i==j){
        next
      }else{
        if(mat[i,j]>list[1]){
          list[1]=mat[i,j]
          list[2]=i
          list[3]=j
        }
      }
    }
  }
  print(list)
}

#dissimilatry matrix max
max(dissim)
#similatry matrix
max(sim)

#Question3. Find the two categorical attributes that have the highest positive/negative correlation. Draw a scatter plot of these two attributes. Analyze the correlation using the following significance levels:

#0.01, 0.05, 0.001 (5)

data<-data.matrix(car)
data<-t(data)

#significance level: 0.05
cor.test(data[1,],data[2,],method="pearson",conf.level = 0.95)
cor.test(data[1,],data[3,],method="pearson",conf.level = 0.95)
cor.test(data[1,],data[4,],method="pearson",conf.level = 0.95)
cor.test(data[1,],data[5,],method="pearson",conf.level = 0.95)
cor.test(data[1,],data[6,],method="pearson",conf.level = 0.95)
cor.test(data[1,],data[7,],method="pearson",conf.level = 0.95)
cor.test(data[2,],data[3,],method="pearson",conf.level = 0.95)
cor.test(data[2,],data[4,],method="pearson",conf.level = 0.95)
cor.test(data[2,],data[5,],method="pearson",conf.level = 0.95)
cor.test(data[2,],data[6,],method="pearson",conf.level = 0.95)
cor.test(data[2,],data[7,],method="pearson",conf.level = 0.95)
cor.test(data[3,],data[4,],method="pearson",conf.level = 0.95)
cor.test(data[3,],data[5,],method="pearson",conf.level = 0.95)
cor.test(data[3,],data[6,],method="pearson",conf.level = 0.95)
cor.test(data[3,],data[7,],method="pearson",conf.level = 0.95)
cor.test(data[4,],data[5,],method="pearson",conf.level = 0.95)
cor.test(data[4,],data[6,],method="pearson",conf.level = 0.95)
cor.test(data[4,],data[7,],method="pearson",conf.level = 0.95)
cor.test(data[5,],data[6,],method="pearson",conf.level = 0.95)
cor.test(data[5,],data[7,],method="pearson",conf.level = 0.95)
cor.test(data[6,],data[7,],method="pearson",conf.level = 0.95)

#significance level: 0.01
cor.test(data[1,],data[2,],method="pearson",conf.level = 0.99)
cor.test(data[1,],data[3,],method="pearson",conf.level = 0.99)
cor.test(data[1,],data[4,],method="pearson",conf.level = 0.99)
cor.test(data[1,],data[5,],method="pearson",conf.level = 0.99)
cor.test(data[1,],data[6,],method="pearson",conf.level = 0.99)
cor.test(data[1,],data[7,],method="pearson",conf.level = 0.99)
cor.test(data[2,],data[3,],method="pearson",conf.level = 0.99)
cor.test(data[2,],data[4,],method="pearson",conf.level = 0.99)
cor.test(data[2,],data[5,],method="pearson",conf.level = 0.99)
cor.test(data[2,],data[6,],method="pearson",conf.level = 0.99)
cor.test(data[2,],data[7,],method="pearson",conf.level = 0.99)
cor.test(data[3,],data[4,],method="pearson",conf.level = 0.99)
cor.test(data[3,],data[5,],method="pearson",conf.level = 0.99)
cor.test(data[3,],data[6,],method="pearson",conf.level = 0.99)
cor.test(data[3,],data[7,],method="pearson",conf.level = 0.99)
cor.test(data[4,],data[5,],method="pearson",conf.level = 0.99)
cor.test(data[4,],data[6,],method="pearson",conf.level = 0.99)
cor.test(data[4,],data[7,],method="pearson",conf.level = 0.99)
cor.test(data[5,],data[6,],method="pearson",conf.level = 0.99)
cor.test(data[5,],data[7,],method="pearson",conf.level = 0.99)
cor.test(data[6,],data[7,],method="pearson",conf.level = 0.99)

#significance level: 0.001
cor.test(data[1,],data[2,],method="pearson",conf.level = 0.999)
cor.test(data[1,],data[3,],method="pearson",conf.level = 0.999)
cor.test(data[1,],data[4,],method="pearson",conf.level = 0.999)
cor.test(data[1,],data[5,],method="pearson",conf.level = 0.999)
cor.test(data[1,],data[6,],method="pearson",conf.level = 0.999)
cor.test(data[1,],data[7,],method="pearson",conf.level = 0.999)
cor.test(data[2,],data[3,],method="pearson",conf.level = 0.999)
cor.test(data[2,],data[4,],method="pearson",conf.level = 0.999)
cor.test(data[2,],data[5,],method="pearson",conf.level = 0.999)
cor.test(data[2,],data[6,],method="pearson",conf.level = 0.999)
cor.test(data[2,],data[7,],method="pearson",conf.level = 0.999)
cor.test(data[3,],data[4,],method="pearson",conf.level = 0.999)
cor.test(data[3,],data[5,],method="pearson",conf.level = 0.999)
cor.test(data[3,],data[6,],method="pearson",conf.level = 0.999)
cor.test(data[3,],data[7,],method="pearson",conf.level = 0.999)
cor.test(data[4,],data[5,],method="pearson",conf.level = 0.999)
cor.test(data[4,],data[6,],method="pearson",conf.level = 0.999)
cor.test(data[4,],data[7,],method="pearson",conf.level = 0.999)
cor.test(data[5,],data[6,],method="pearson",conf.level = 0.999)
cor.test(data[5,],data[7,],method="pearson",conf.level = 0.999)
cor.test(data[6,],data[7,],method="pearson",conf.level = 0.999)

#scatter plot
plot(car$Buying,car$`Class Values`,xlab="Buying",
     ylab="Class Value",
     main="Scatter-plot for highest +ve correlation")

plot(car$Doors,car$`Class Values`,xlab="Door",
     ylab="Class Value",
     main="Scatter-plot for highest -ve correlation")

#Question4.

car_vgood<-car[car$`Class Values`=="vgood",]

mat_car=as.matrix(car_vgood)

#Question1 and 2:Find the set of cars that have the highest similarity/dissimilarity with each other.
#Ranking
for (i in 1:65){
  for (j in 1:7){
    if (j == 1 || j ==2){
      if(mat_car[i,j] == "vhigh"){
        mat_car[i,j] = 4
      }else{
        if(mat_car[i,j] == "high"){
          mat_car[i,j] = 3
        }else{
          if(mat_car[i,j] == "med"){
            mat_car[i,j] = 2
          }else{
            if(mat_car[i,j] == "low")
              mat_car[i,j] = 1
          }
        }
      }
    }else{
      if(j == 3){
        if(mat_car[i,j] == "5more"){
          mat_car[i,j] = 4
        }else{
          if(mat_car[i,j] == "4"){
            mat_car[i,j] = 3
          }else{
            if(mat_car[i,j] == "3"){
              mat_car[i,j] = 2
            }else{
              if(mat_car[i,j] == "2"){
                mat_car[i,j] = 1
              }
            }
          }
        }
      }else{
        if(j == 4){
          if(mat_car[i,j] == "more"){
            mat_car[i,j] = 3
          }else{
            if(mat_car[i,j] == "4"){
              mat_car[i,j] = 2
            }else{
              if(mat_car[i,j] == "2"){
                mat_car[i,j] = 1
              }
            }
          }
        }else{
          if(j == 5){
            if(mat_car[i,j] == "big"){
              mat_car[i,j] = 3
            }else{
              if(mat_car[i,j] == "med"){
                mat_car[i,j] = 2
              }else{
                if(mat_car[i,j] == "small"){
                  mat_car[i,j] = 1
                }
              }
            }
          }else{
            if(j == 6){
              if(mat_car[i,j] == "high"){
                mat_car[i,j] = 3
              }else{
                if(mat_car[i,j] == "med"){
                  mat_car[i,j] = 2
                }else{
                  if(mat_car[i,j] == "low"){
                    mat_car[i,j] = 1
                  }
                }
              }
            }else{
              if(j == 7){
                if(mat_car[i,j] == "vgood"){
                  mat_car[i,j] = 4
                }else{
                  if(mat_car[i,j] == "good"){
                    mat_car[i,j] = 3
                  }else{
                    if(mat_car[i,j] == "acc"){
                      mat_car[i,j] = 2
                    }else{
                      if(mat_car[i,j] == "unacc"){
                        mat_car[i,j] = 1
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    
    
  }
}
#normalization
v=c(1,2,3,7)
for(i in 1:65){
  for(j in 1:7){
    if(j == 1 || j == 2 || j == 3 || j == 7){
      mat_car[i,j]=(as.numeric(mat_car[i,j])-1)/3
    }else{
      mat_car[i,j]=(as.numeric(mat_car[i,j])-1)/2
    }
  }
}

dissim=matrix(nrow=65, ncol=65)
sim=matrix(nrow=65, ncol=65)

#similarity and dissimilarity calculation

for(i in 1:65){
  for(j in 1:65){
    dissim[i,j]=0
    sim[i,j]=0
    if(i==j){
      dissim[i,j]=0
    }else{
      for(k in 1:7){
        dissim[i,j]=dissim[i,j]+((as.numeric(mat_car[i,k])-as.numeric(mat_car[j,k]))^2)
      }
    }
    dissim[i,j]=(dissim[i,j])^(1/2)
    sim[i,j]=1-dissim[i,j]
  }
}