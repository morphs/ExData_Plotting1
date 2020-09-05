#Read data and convert values

houses<-read.table("household_power_consumption.txt",sep = ";",header = T)
houses$Date<-strptime(houses$Date,format = "%d/%m/%Y")
houses<-houses[(houses$Date<=strptime("2007-02-02",format="%Y-%m-%d") & houses$Date>=strptime("2007-02-01",format="%Y-%m-%d")),]
houses$Global_active_power<-as.numeric(houses$Global_active_power)
x=strptime(paste(houses$Date,houses$Time),format="%Y-%m-%d %H:%M:%S")

#File to save graph and create Plot

png(filename = "plot2.png")
plot(x=x,
     y= houses$Global_active_power,type = "l",
     ylab = "Global Active Power (kilowatts)",xlab="")
dev.off()