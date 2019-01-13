data_int <-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
data <- subset(data_int, data_int$Date == "1/2/2007" | data_int$Date == "2/2/2007")

png("plot4.png", width = 480, height = 480)

data$Date <- as.Date(data$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

par(mfrow = c(2,2))

##plot1
plot(data$Global_active_power~data$Datetime, type = "l", xlab = "", ylab = 'Global Active Power (kilowatts)')

##plot2
plot(data$Voltage~data$Datetime, type = "l", xlab = "datetime", ylab = "Voltage")

##plot3
plot(data$Sub_metering_1~data$Datetime, type = "l", xlab = "", ylab = 'Energy Sub Metering')
lines(data$Sub_metering_2~data$Datetime, col = 'red')
lines(data$Sub_metering_3~data$Datetime, col = 'blue')
legend("topright", lty=1, lwd =3, col=c("black","red","blue") ,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

##plot4
plot(data$Global_reactive_power~data$Datetime, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()



