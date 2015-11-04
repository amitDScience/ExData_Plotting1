# Check the zip file is present or not
## If present unzip it, else stop execution and show error message
if (file.exists("exdata-data-household_power_consumption.zip")){
	unzip("exdata-data-household_power_consumption.zip")
} else {
	stop("exdata-data-household_power_consumption.zip does not exist!!")
}

# Read the data file
house_data <- read.table("household_power_consumption.txt" , header = TRUE, sep = ";", na.strings = "?")
# Subset the data for relevant dates
house_data <- house_data[ house_data$Date == "1/2/2007" | house_data$Date == "2/2/2007",]
# Create a new column datetime which clubs date with time
house_data$datetime <- as.POSIXct(paste(house_data$Date, house_data$Time), format="%d/%m/%Y %H:%M:%S")
# First create the plot on the screen device handle
png(file = "plot3.png")
with(house_data,{
plot(datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
points(datetime, Sub_metering_2, type = "l", col = "red")
points(datetime, Sub_metering_3, type = "l", col = "blue")
})
legend("topright", pch = c(NA, NA, NA), lty = c(1, 1, 1), col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
# Close the png device explicitly
dev.off()
# End of the script
