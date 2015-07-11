#Assumption: lubridate package is already installed
library(lubridate)
source('readHouseConsumption.R')

# set path for original housing data
originalDataPath <- "./data/household_power_consumption.txt"
selData <- suppressWarnings(readHouseConsumption(originalDataPath))

# Combining date and time
selData$DateTime <- ymd_hms(paste(selData$Date, selData$Time))

# Directly plotting in png to avoid stripping of letters in legend
png(file="plot4.png", height=480, width=480)

par(mfrow = c(2,2))
# 1st Graph
plot(selData$DateTime, selData$Global_active_power, type="l", xlab = "", ylab="Global Active Power", cex.lab=0.75)
# 2nd Graph
plot(selData$DateTime, selData$Voltage, type="l", xlab = "datetime", ylab="Voltage", cex.lab=0.75)
# 3rd Graph
plot(selData$DateTime, selData$Sub_metering_1, type="n", ylab = "Energy Sub metering", xlab="", cex.lab=0.75)
points(selData$DateTime, selData$Sub_metering_1, type = "l")
points(selData$DateTime, selData$Sub_metering_2, col="red", type = "l")
points(selData$DateTime, selData$Sub_metering_3, col="blue", type = "l")
legend("topright", lty=c(1,1,1), col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), box.lwd = 0, cex = 0.5)
# 4th Graph 
plot(selData$DateTime, selData$Global_reactive_power, type="l", cex.lab=0.75, xlab = "datetime", ylab="Global_rective_power")
dev.off()

