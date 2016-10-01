# Read the data file in
dataFile <- read.table("./data/household_power_consumption.txt", header=T, sep=";", stringsAsFactors = F, na.strings="?")

# Get the date from a string to a date object. Then fence teh data around that date
dataFile$Date <- as.Date(dataFile$Date, "%d/%m/%Y")
fencedData <- dataFile[dataFile$Date >= as.Date("2007-02-01") & dataFile$Date <= as.Date("2007-02-02"),]

# create a 480x480 png
png("plot1.png", width=480, height=480)
hist(fencedData$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
dev.off()