dataFile <- read.table("./data/household_power_consumption.txt", header=T, sep=";", stringsAsFactors = F, na.strings="?")
dataFile$Date <- as.Date(dataFile$Date, "%d/%m/%Y")
fencedData <- dataFile[dataFile$Date >= as.Date("2007-02-01") & dataFile$Date <= as.Date("2007-02-02"),]
fencedData$DateTime <- as.POSIXlt(paste(fencedData$Date, fencedData$Time), "%d/%m/%Y %H:%M:%S")



png("plot4.png", width=480, height=480)
par(bg=NA)
par(mfrow=c(2,2))
# Top left is the same as graph 2
plot(fencedData$DateTime, fencedData$Global_active_power, type="l", xlab="", ylab="Global Active Power")

# Top right, voltate over time
plot(fencedData$DateTime, fencedData$Voltage, type="l", xlab="datetime", ylab="Voltage")

#Bottom left, same as 3 except legend
plot(fencedData$DateTime, fencedData$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(fencedData$DateTime, fencedData$Sub_metering_2, col="red")
lines(fencedData$DateTime, fencedData$Sub_metering_3, col="blue")
legend("topright", bty="n", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1)

# Bottom right, reactive power over time
plot(fencedData$DateTime, fencedData$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()