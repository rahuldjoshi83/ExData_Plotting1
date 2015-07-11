
readHouseConsumption <- function(originalDataPath="household_power_consumption.txt"){
        ## Assumption: original data file is available in current working directory

        selData <- read.table(originalDataPath, sep=";", na.strings = "?", stringsAsFactors=FALSE, 
                              skip=grep("^1/2/2007", readLines(originalDataPath))-1, nrows=2880)
        
        # parsing first column as date
        selData$V1 = as.Date(selData$V1, format="%d/%m/%Y")
        
        # changing column names
        names(selData) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
        selData
}