## Load the whole dataset.
all.power <- read.table("./project1/household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)

## Fix dates and subset for the desired dates.
all.power$Date <- as.Date(all.power$Date, "%d/%m/%Y")
sub.power <- subset(all.power, Date == "2007-02-01" | Date == "2007-02-02")

## Open the png file for the graph and populate with the graph.
png(filename = "plot1.png")
hist(as.numeric(sub.power$Global_active_power), col = "red", main = "Global Active Power", xlab = "Global Active Power (Kilowats)")
dev.off()