source('readHouseConsumption.R')

# set path for original housing data
originalDataPath <- "./data/household_power_consumption.txt"
selectedData <- suppressWarnings(readHouseConsumption(originalDataPath))
hist(selectedData$Global_active_power, col="red", ylim = c(0, 1200), xlab = "Global Active Power (killowatts)", main="Global Active Power")

# copy to png
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()