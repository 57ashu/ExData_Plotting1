##reading data
init_data <- read.table("household_power_consumption.txt", sep = ";", 
                        header = T, colClasses = "character")

## converting classes of columns
init_data$Date <- as.Date(init_data$Date, format = "%d/%m/%Y")
init_data$Time <- format(init_data$Time, format="%H:%M:%S")
init_data$Global_active_power <- as.numeric(init_data$Global_active_power)
init_data$Global_reactive_power <- as.numeric(init_data$Global_reactive_power)
##init_data$Voltage <- as.numeric(init_data$Voltage)
init_data$Global_intensity <- as.numeric(init_data$Global_intensity)
##init_data$Sub_metering_1 <- as.numeric(init_data$Sub_metering_1)
##init_data$Sub_metering_2 <- as.numeric(init_data$Sub_metering_2)
##init_data$Sub_metering_3 <- as.numeric(init_data$Sub_metering_3)

##subset data for first two days of Feb-2007
Sub_Data <- subset(init_data, Date == "2007-02-01" | Date == "2007-02-02")

##plot histogram
png("plot1.png", width=480, height=480)
hist(Sub_Data$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()