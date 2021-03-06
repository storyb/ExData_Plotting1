## Load the whole dataset.
all.power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)

## Fix dates and subset for the desired dates.
all.power$Date <- as.Date(all.power$Date, "%d/%m/%Y")
sub.power <- subset(all.power, Date == "2007-02-01" | Date == "2007-02-02")

## Combine Date and Time for unique identifier.
sub.power$Date_Time <- strptime(paste(sub.power$Date, sub.power$Time), format = "%Y-%m-%d %H:%M:%S")

## Open the png file for the graph and populate with the graph.
png(filename = "plot4.png")
par(mfrow = c(2, 2), mar = c(4, 4, 4, 4))
##Upper left graph.
plot(sub.power$Date_Time, sub.power$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

##Upper right graph.
plot(sub.power$Date_Time, sub.power$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

##Lower left graph.
plot(sub.power$Date_Time, sub.power$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(sub.power$Date_Time, sub.power$Sub_metering_2, type = "l", col = "red")
lines(sub.power$Date_Time, sub.power$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1.1), lwd = c(2.5, 2.5, 2.5), col = c("black", "red", "blue"))

##Lower right graph.
plot(sub.power$Date_Time, sub.power$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()