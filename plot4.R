setwd("~/Documents/Rcourse/course4/week1")
DF<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
library(data.table)
DT <- as.data.table(DF)

DT2<-subset(DT,Date=="1/2/2007"|Date=="2/2/2007")

DT2[,datetime:=strptime(paste(DT2$Date,DT2$Time),"%d/%m/%Y %H:%M:%S")]


png(filename="./plot4.png",width=480,height=480,units="px")
par(mfcol=c(2,2))
with(DT2,plot(datetime,Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=""))


with(DT2,plot(datetime,Sub_metering_1,type="l",col="dark grey",ylab="Energy sub metering",xlab=""))
lines(DT2$datetime,DT2$Sub_metering_2,col="red")
lines(DT2$datetime,DT2$Sub_metering_3,col="blue")
legend("topright",pch="-",col=c("dark grey","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))



with(DT2,plot(datetime,Voltage,type="l",ylab="Voltage",xlab=""))



with(DT2,plot(datetime,Global_reactive_power,type="l"))

dev.off()
