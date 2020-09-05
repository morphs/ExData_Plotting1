#Read data and convert to date

houses<-read.table("household_power_consumption.txt",sep = ";",header = T)
houses$Date<-strptime(houses$Date,format = "%d/%m/%Y")
houses<-houses[(houses$Date<=strptime("2007-02-02",format="%Y-%m-%d") & houses$Date>=strptime("2007-02-01",format="%Y-%m-%d")),]

#File for graph and create histogram

png(filename = "plot1.png")
hist(as.numeric(houses$Global_active_power),col="red",xlab = "Global Active Power (kilowatts",main = "Global Active Power")
dev.off()