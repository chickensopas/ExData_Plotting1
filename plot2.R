data_int <-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
data <- subset(data_int, data_int$Date == "1/2/2007" | data_int$Date == "2/2/2007")

png("plot2.png", width = 480, height = 480)

data$Date <- as.Date(data$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

    
plot(data$Global_active_power~data$Datetime, type = "l", xlab = "", ylab = 'Global Active Power (kilowatts)')

dev.off()
