#Read data and convert values

houses<-read.table("household_power_consumption.txt",sep = ";",header = T)
houses$Date<-strptime(houses$Date,format = "%d/%m/%Y")
houses<-houses[(houses$Date<=strptime("2007-02-02",format="%Y-%m-%d") & houses$Date>=strptime("2007-02-01",format="%Y-%m-%d")),]
houses$Global_active_power<-as.numeric(houses$Global_active_power)
houses$Sub_metering_1<-as.numeric(houses$Sub_metering_1)
houses$Sub_metering_2<-as.numeric(houses$Sub_metering_2)
houses$Sub_metering_3<-as.numeric(houses$Sub_metering_3)
x=strptime(paste(houses$Date,houses$Time),format="%Y-%m-%d %H:%M:%S")

#File to save graph and create Plot with 3 lines and different colors

png(filename = "plot3.png")
plot(x=x,
     y= houses$Sub_metering_1,type = "l",
     ylab = "Energy sub metering",xlab="",col="black")
lines(x=x,y=houses$Sub_metering_2, type = "l", col = "red")
lines(x=x,houses$Sub_metering_3, type = "l", col = "blue")
legend(x="topright",legend=names(houses)[7:9],col=c("black","red","blue"),lwd = 2)
dev.off()