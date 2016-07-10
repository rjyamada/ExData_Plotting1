# read data from txt file
data <- read.csv("./data/household_power_consumption.txt", sep=";", na.strings="?")

# convert data formats
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Global_active_power <- as.numeric(data$Global_active_power)

# filter data
data <- data[data$Date >= as.Date("2007-02-01") & data$Date<=as.Date("2007-02-02"),]

# output data to png
png(filename="plot1.png", width=480, height=480, units="px")
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()