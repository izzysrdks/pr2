#! /usr/bin/Rscript

source("Rcode/LoadPackages.R")

#read in TNF alpha data
TNF <- read.csv('raw_data/TNFalpha.csv')

#Get average for Pre and Post
TNF.edit <-
  TNF %>%
  group_by(ID) %>%
  summarise(avg_PRE_TNF = mean(TNFa_A05_pre), avg_POST_TNF = mean(TNFa_A05_post))
#Get change variable
TNF.edit <-
  TNF.edit %>%
  mutate(change_TNF = avg_POST_TNF - avg_PRE_TNF)
#Read in engagement data
engage <- read.csv('raw_data/Engage.csv')

Engage.edit <- 
	engage %>%
		mutate(change_engage = Post_engage - Pre_engage) %>%
		select(-Group)
#Read in demo data
demo <- read.csv('raw_data/Demographics.csv')

### Clean Demo Data  
#Only want Group, ID, Drop_out and Decline  

#Only keep certain variables  
Demo.edit <-
	demo %>%
		select(ID,group,Drop_out,Decline)

#Merge data
Full_data <-
  merge(Demo.edit,TNF.edit, by="ID")
Full_data <-
  merge(Full_data,Engage.edit,by="ID")
Full_data <- Full_data[Full_data$Drop_out != 1,]
Full_data <- Full_data[Full_data$Decline != 1,]

write.csv(Full_data,"clean_data/Full_data.csv")