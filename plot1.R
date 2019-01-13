data_int <-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
data <- subset(data_int, data_int$Date == "1/2/2007" | data_int$Date == "2/2/2007")

png("plot1.png", width = 480, height = 480)

par(mfrow = c(1,1))
hist(data$Global_active_power, col = 'red', xlab = "Global Active Power (kilowatts", main = "Global Active Power")

dev.off()
