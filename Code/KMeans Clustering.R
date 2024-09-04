library(dplyr)
library(magrittr)
library(cluster)
library(ggplot2)
#From Gap Statistics, we know that k=6
#Creating the customer clusters with KMeans
km <- kmeans(mall_customers[,3:5],6,iter.max = 100,
             nstart = 50,algorithm="Lloyd")

#printing the result
km

#Showing the six K-Means clusters
clusplot(mall_customers,km$cluster,color=TRUE,
         shade=TRUE,labels=0,lines=0)

#As from the clusplot, we know that there are two components explain 66.5%
#of the point variability
#We already Know the Two components from Principal Component Analysis
#They are annual income and spending score. So,

# Set seed to 1
set.seed(1)

#Create a plot of the customers segments
mall_customers %>%  
  ggplot(aes(x = annual_income , y = spending_score)) + 
  geom_point(stat = "identity", aes(color = as.factor(km$cluster))) +
  scale_color_discrete(name = " ", 
                       breaks=c("1", "2", "3", "4", "5","6"),
                       labels=c("Cluster 1", "Cluster 2", "Cluster 3", 
                                "Cluster 4", "Cluster 5","Cluster 6")) +
  ggtitle("Segments of Mall Customers", 
          subtitle = "Using K-means Clustering")

#To make the plot more consumable we can classify each cluster by 
#annual income and spending score
mall_customers %>%
  ggplot(aes(x = annual_income , y = spending_score)) + 
  geom_point(stat = "identity", aes(color = as.factor(km$cluster))) +
  scale_color_discrete(name = " ", 
                       breaks=c("1", "2", "3", "4", "5","6"),
                       labels=c("High Income, Low Spending", "Low Income, Low Spending", "Medium Income, Medium Spending", 
                                "Medium Income, Medium Spending", "Low Income, High Spending","High Income, High Spending")) +
  labs(x="Annual Income", y="Spending Score") +
  ggtitle("Segments of Mall X Customers", 
          subtitle = "Using K-means Clustering")


#"High Income, Low Spending", "Low Income, Low Spending", "Medium Income, Medium Spending", 
#"Medium Income, Medium Spending", "Low Income, High Spending","High Income, High Spending"
#are the six clusters of the mall customers data.

