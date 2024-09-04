library(dplyr)
library(magrittr)
library(cluster)
library(ggplot2)
#As the Mall_Customers data is Four dimensional(Age,Annual Income,Spending Scores,Gender),
#We need to convert the data from Four Dimensional to Two Dimensional
# We do this using Principal Component Analysis(PCA)
set.seed(120)

#Perform Principal Component Analysis(PCA)
pc <- prcomp(mall_customers[,3:5],scale=FALSE)

#Checking the summary of the PCA model
summary(pc)

#Results show that PC1 and PC2 contribute the most variance to the data

#Applying the PCA model on the data
pc$rotation[,1:2]

#The high correlation between PC1 and spending score is -0.786 and 
#PC2 and annual income is -0.808 show that 
#annual income and spending income are the 2 major components of the data.