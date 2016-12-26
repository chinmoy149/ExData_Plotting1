URL <- "D:/R/exdata_data_household_power_consumption/household_power_consumption.txt"
datafile <- read.table (URL, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
subData <- datafile [datafile$Date %in% c ("1/2/2007","2/2/2007"), ]

#using striptime function
datetime <- strptime (paste (subData$Date, subData$Time, sep = " "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric (subData$Global_active_power)

#setting the graphics device
png ("D:/R/exdata_data_household_power_consumption/plot2.png", width = 480, height = 480)
plot (datetime, globalActivePower, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
#closing the graphics device