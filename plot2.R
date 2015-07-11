#Assumption: lubridate package is already installed
library(lubridate)
source('readHouseConsumption.R')

# set path for original housing data
originalDataPath <- "./data/household_power_consumption.txt"
selectedData <- suppressWarnings(readHouseConsumption(originalDataPath))

# Combining date and time
selData$DateTime <- ymd_hms(paste(selData$Date, selData$Time))
plot(selData$DateTime, selData$Global_active_power, type="l", xlab = "", ylab="Global Active Power (killowatts)")

# copy to png
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()