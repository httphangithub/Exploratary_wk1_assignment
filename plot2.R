setwd("~/Documents/Rcourse/course4/week1")
DF<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
library(data.table)
DT <- as.data.table(DF)

DT2<-subset(DT,Date=="1/2/2007"|Date=="2/2/2007")

DT2[,datetime:=strptime(paste(DT2$Date,DT2$Time),"%d/%m/%Y %H:%M:%S")]


png(filename="./plot2.png",width=480,height=480,units="px")

with(DT2,plot(datetime,Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=""))

dev.off()

