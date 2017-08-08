power <- read.table("household_power_consumption.txt", sep=";", na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), header = TRUE)
power <- power[grepl("^1/2/2007|^2/2/2007", power$Date),]
power$datetime <- strptime(paste(power$Date, power$Time), format = "%d/%m/%Y %H:%M:%S")
png(filename = "plot2.png")
plot(power$datetime, power$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab="")
dev.off()
