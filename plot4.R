#Read data and convert values

houses<-read.table("household_power_consumption.txt",sep = ";",header = T)
houses$Date<-strptime(houses$Date,format = "%d/%m/%Y")
houses<-houses[(houses$Date<=strptime("2007-02-02",format="%Y-%m-%d") & houses$Date>=strptime("2007-02-01",format="%Y-%m-%d")),]
houses$Global_active_power<-as.numeric(houses$Global_active_power)
houses$Sub_metering_1<-as.numeric(houses$Sub_metering_1)
houses$Sub_metering_2<-as.numeric(houses$Sub_metering_2)
houses$Sub_metering_3<-as.numeric(houses$Sub_metering_3)
houses$Voltage<-as.numeric(houses$Voltage)
houses$Global_reactive_power<-as.numeric(houses$Global_reactive_power)
x=strptime(paste(houses$Date,houses$Time),format="%Y-%m-%d %H:%M:%S")

#File to save graph

png(filename = "plot4.png")

#Adapt format 2 rows and columns of graph

par(mfrow=c(2,2))

#Create 4 graphs

plot(x=strptime(paste(houses$Date,houses$Time),format="%Y-%m-%d %H:%M:%S"),
     y= houses$Global_active_power,type = "l",
     ylab = "Global Active Power (kilowatts)",xlab="")
plot(x=strptime(paste(houses$Date,houses$Time),format="%Y-%m-%d %H:%M:%S"),
     y= houses$Voltage,type = "l",
     ylab = "Voltage",xlab="")

plot(x=x,
     y= houses$Sub_metering_1,type = "l",
     ylab = "Energy sub metering",xlab="",col="black")
lines(x=x,y=houses$Sub_metering_2, type = "l", col = "red")
lines(x=x,houses$Sub_metering_3, type = "l", col = "blue")
legend(x="topright",legend=names(houses)[7:9],col=c("black","red","blue"),lwd = 2)
plot(x=strptime(paste(houses$Date,houses$Time),format="%Y-%m-%d %H:%M:%S"),
     y= houses$Global_reactive_power,type = "l",
     ylab = "Global Active Power (kilowatts)",xlab="")

dev.off()