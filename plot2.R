# read data from txt file
data <- read.csv("./data/household_power_consumption.txt", sep=";", na.strings="?")

# convert data formats
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Global_active_power <- as.numeric(data$Global_active_power)

# filter data
data <- data[data$Date >= as.Date("2007-02-01") & data$Date<=as.Date("2007-02-02"),]

# output data to png
png(filename="plot2.png", width=480, height=480, units="px")
plot(data$Global_active_power, type = "l", xlab="", xaxt="n", ylab = "Global Active Power (kilowatts)")
axis(1, at=c(1, as.integer(nrow(data)/2), nrow(data)), labels=c("Thu", "Fri", "Sat"))
dev.off()