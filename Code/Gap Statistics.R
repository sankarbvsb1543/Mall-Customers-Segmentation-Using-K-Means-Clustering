library(dplyr)
library(magrittr)
library(cluster)
library(ggplot2)
data(mall_customers)
#Setting seed to 125 for reproducibility
set.seed(124)

#Using Gap Statistics to get the optimal number of clusters
gap_stat<-clusGap(mall_customers[,3:5], FUN=kmeans, nstart=25, K.max = 10, B=50)

gap_stat$Tab
S
gapdf <- as.data.frame(gap_stat$Tab)

gapdf %>%
  ggplot(aes(x=1:nrow(gapdf))) +
  geom_line(aes(y=logW),color="blue")+
  geom_point(aes(y=logW),color="blue") +
  geom_line(aes(y=E.logW),color="green")+
  geom_point(aes(y=E.logW),color="green") +
  labs(x="Number of clusters")

#gap curve
gapdf %>%
  ggplot(aes(x=1:nrow(gapdf)))+
  geom_line(aes(y=gap),color="red") +
  geom_point(aes(y=gap),color="red") +
  geom_errorbar((aes(ymin=gap-SE.sim,ymax=gap+SE.sim)),color="red") +
  labs(x="Number of (atlast) clusters")

#OR
plot(gap_stat)

# Therefore by looking at the above graph we can say that k=6