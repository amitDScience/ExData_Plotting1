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
# First create the plot on the screen device handle
png(file = "plot1.png")
hist(house_data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
# Close the png device explicitly
dev.off()
# End of the script
