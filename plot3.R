##reading data
init_data <- read.table("household_power_consumption.txt", sep = ";", 
                        header = T, colClasses = "character")

## converting classes of columns
init_data$Date <- as.Date(init_data$Date, format = "%d/%m/%Y")
##init_data$Global_active_power <- as.numeric(init_data$Global_active_power)
##init_data$Global_reactive_power <- as.numeric(init_data$Global_reactive_power)
##init_data$Voltage <- as.numeric(init_data$Voltage)
##init_data$Global_intensity <- as.numeric(init_data$Global_intensity)
init_data$Sub_metering_1 <- as.numeric(init_data$Sub_metering_1)
init_data$Sub_metering_2 <- as.numeric(init_data$Sub_metering_2)
init_data$Sub_metering_3 <- as.numeric(init_data$Sub_metering_3)

##subset data for first two days of Feb-2007
Sub_Data <- subset(init_data, Date == "2007-02-01" | Date == "2007-02-02")

timestamp <- strptime(paste(Sub_Data$Date, Sub_Data$Time, 
                            sep = " "), format = "%Y-%m-%d %H:%M:%S")

##plot line graph
png("plot3.png", width = 480, height = 480)
plot(timestamp, Sub_Data$Sub_metering_1, ylab = "Energy Sub Metering", xlab = "", type = "l")
lines(timestamp, Sub_Data$Sub_metering_2, type = "l", col = "red")
lines(timestamp, Sub_Data$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()