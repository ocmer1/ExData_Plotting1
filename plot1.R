power <- read.table("household_power_consumption.txt", sep=";", na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), header = TRUE)
power <- power[grepl("^1/2/2007|^2/2/2007", power$Date),]
power$datetime <- strptime(paste(power$Date, power$Time), format = "%d/%m/%Y %H:%M:%S")
png(filename = "plot1.png")
hist(power$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
