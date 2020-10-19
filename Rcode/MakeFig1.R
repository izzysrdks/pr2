#! /usr/bin/Rscript

Full_data<-read.csv("clean_data/Full_data.csv")

# plot of Engagement vs TNF
png("figs/fig1.png")
plot(y = Full_data$change_TNF, x = Full_data$change_engage,
     xlab = "Change in Engagement", ylab = "Change in TNF Alpha")
dev.off()