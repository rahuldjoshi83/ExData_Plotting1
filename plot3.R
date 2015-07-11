#Assumption: lubridate package is already installed
library(lubridate)
source('readHouseConsumption.R')

# set path for original housing data
originalDataPath <- "./data/household_power_consumption.txt"
selData <- suppressWarnings(readHouseConsumption(originalDataPath))

# Combining date and time
selData$DateTime <- ymd_hms(paste(selData$Date, selData$Time))

# Directly plotting in png to avoid stripping of letters in legend
png(file="plot3.png", height=480, width=480)

plot(selData$DateTime, selData$Sub_metering_1, type="n", ylab = "Energy Sub metering", xlab="")
points(selData$DateTime, selData$Sub_metering_1, type = "l")
points(selData$DateTime, selData$Sub_metering_2, col="red", type = "l")
points(selData$DateTime, selData$Sub_metering_3, col="blue", type = "l")
legend("topright", lty=c(1,1,1), col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
