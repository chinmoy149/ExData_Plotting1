URL <- "D:/R/exdata_data_household_power_consumption/household_power_consumption.txt"
datafile <- read.table (URL, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

#Subsetting the table for the given time period
subData <- datafile [datafile$Date %in% c ("1/2/2007","2/2/2007"), ]


globalActivePower <- as.numeric (subData$Global_active_power)

#Setting the graphics device
png ("D:/R/exdata_data_household_power_consumption/plot1.png", width = 480, height = 480)
#creating a histogram
hist (globalActivePower, col = "green", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
#shutting down the graphics device