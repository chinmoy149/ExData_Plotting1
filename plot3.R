URL <- "D:/R/exdata_data_household_power_consumption/household_power_consumption.txt"
datafile <- read.table (URL, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
subData <- datafile [datafile$Date %in% c ("1/2/2007","2/2/2007"), ]

#striping the required data
#used the striptime function
datetime <- strptime (paste (subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric (subData$Global_active_power)
subMetering1 <- as.numeric (subData$Sub_metering_1)
subMetering2 <- as.numeric (subData$Sub_metering_2)
subMetering3 <- as.numeric (subData$Sub_metering_3)

#opening the graphics device
png ("D:/R/exdata_data_household_power_consumption/plot3.png", width = 480, height = 480)
plot (datetime, subMetering1, type = "l", ylab = "Energy Submetering", xlab = "")
lines (datetime, subMetering2, type = "l", col="red")
lines (datetime, subMetering3, type = "l", col="blue")
legend ("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2.5, col = c ("black", "red", "blue"))
#setting the legends
dev.off()
#closed the graphics device