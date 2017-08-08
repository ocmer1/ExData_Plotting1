power <- read.table("household_power_consumption.txt", sep=";", na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), header = TRUE)
power <- power[grepl("^1/2/2007|^2/2/2007", power$Date),]
power$datetime <- strptime(paste(power$Date, power$Time), format = "%d/%m/%Y %H:%M:%S")
png(filename = "plot3.png")
plot(power$datetime, power$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab="")
points(power$datetime, power$Sub_metering_2, type = "l", col = "red")
points(power$datetime, power$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd = 1)
dev.off()
