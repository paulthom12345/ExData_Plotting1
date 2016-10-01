# Read and fence the data, add a timetime col
dataFile <- read.table("./data/household_power_consumption.txt", header=T, sep=";", stringsAsFactors = F, na.strings="?")
dataFile$Date <- as.Date(dataFile$Date, "%d/%m/%Y")
fencedData <- dataFile[dataFile$Date >= as.Date("2007-02-01") & dataFile$Date <= as.Date("2007-02-02"),]
fencedData$DateTime <- as.POSIXlt(paste(fencedData$Date, fencedData$Time), "%d/%m/%Y %H:%M:%S")

png("plot3.png", width=504, height=504)
# First plot 1 metering
plot(fencedData$DateTime, fencedData$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
# add the other two lines
lines(fencedData$DateTime, fencedData$Sub_metering_2, col="red")
lines(fencedData$DateTime, fencedData$Sub_metering_3, col="blue")

# set the legend
legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1)

dev.off()
