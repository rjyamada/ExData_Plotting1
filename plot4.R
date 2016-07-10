# read data from txt file
data <- read.csv("./data/household_power_consumption.txt", sep=";", na.strings="?")

# convert data formats
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Voltage <- as.numeric(data$Voltage)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)

# filter data
data <- data[data$Date >= as.Date("2007-02-01") & data$Date<=as.Date("2007-02-02"),]

# output data to png
png(filename="plot4.png", width=480, height=480, units="px")
par(mfrow = c(2, 2))

plot(data$Global_active_power, type = "l", xlab="", xaxt="n", ylab = "Global Active Power")
axis(1, at=c(1, as.integer(nrow(data)/2), nrow(data)), labels=c("Thu", "Fri", "Sat"))

plot(data$Voltage, type = "l", xlab="datetime", xaxt="n", ylab = "Voltage")
axis(1, at=c(1, as.integer(nrow(data)/2), nrow(data)), labels=c("Thu", "Fri", "Sat"))

with(data, plot(Sub_metering_1, type = "l", xlab="", xaxt="n", ylab = "Energy sub metering"))
with(data, lines(Sub_metering_2, col="red"))
with(data, lines(Sub_metering_3, col="blue"))
axis(1, at=c(1, as.integer(nrow(data)/2), nrow(data)), labels=c("Thu", "Fri", "Sat"))
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(data$Global_reactive_power, type = "l", xlab="datetime", xaxt="n", ylab = "Global_reactive_power")
axis(1, at=c(1, as.integer(nrow(data)/2), nrow(data)), labels=c("Thu", "Fri", "Sat"))

dev.off()