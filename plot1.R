dataFile <- read.table("./data/household_power_consumption.txt", header=T, sep=";", stringsAsFactors = F, na.strings="?")

dataFile$Date <- as.Date(dataFile$Date, "%d/%m/%Y")
fencedData <- dataFile[dataFile$Date >= as.Date("2007-02-01") & dataFile$Date <= as.Date("2007-02-02"),]

png("plot1.png", width=480, height=480)
hist(fencedData$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
dev.off()