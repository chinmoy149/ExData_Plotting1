URL <- "D:/R/exdata_data_household_power_consumption/household_power_consumption.txt"
datafile <- read.table (URL, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
subData <- datafile [datafile$Date %in% c ("1/2/2007","2/2/2007"), ]

#striping the required data
#using the strptime function for time and dates
datetime <- strptime (paste (subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric (subData$Global_active_power)
globalReactivePower <- as.numeric (subData$Global_reactive_power)
voltage <- as.numeric (subData$Voltage)
subMetering1 <- as.numeric (subData$Sub_metering_1)
subMetering2 <- as.numeric (subData$Sub_metering_2)
subMetering3 <- as.numeric (subData$Sub_metering_3)


#Opening the graphics device
png ("D:/R/exdata_data_household_power_consumption/plot4.png", width = 480, height = 480)
par (mfrow = c (2, 2)) #row-wise function

plot (datetime, globalActivePower, type = "l", xlab = "", ylab = "Global Active Power", cex = 0.2)

plot (datetime, voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot (datetime, subMetering1, type = "l", ylab = "Energy Submetering", xlab = "")
#adding components to the graphs
lines (datetime, subMetering2, type = "l", col = "red")
#adding components to the graphs
lines (datetime, subMetering3, type = "l", col = "blue")
#setting the legends
legend ("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2.5, col = c ("black", "red", "blue"), bty = "o")

plot (datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
#closing the graphics device