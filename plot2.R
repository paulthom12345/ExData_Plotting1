# Read the data and fence the dates
dataFile <- read.table("./data/household_power_consumption.txt", header=T, sep=";", stringsAsFactors = F, na.strings="?")
dataFile$Date <- as.Date(dataFile$Date, "%d/%m/%Y")
fencedData <- dataFile[dataFile$Date >= as.Date("2007-02-01") & dataFile$Date <= as.Date("2007-02-02"),]

# I need datetime here, so use a POSIX date from the Date and Time
fencedData$DateTime <- as.POSIXlt(paste(fencedData$Date, fencedData$Time), "%d/%m/%Y %H:%M:%S")

# Create a 480x480 plot
png("plot2.png", width=480, height=480)
plot(fencedData$DateTime, fencedData$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()