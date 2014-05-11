data.path <- "path/to/household_power_consumption.txt"

# Read data. Use header = T to get column headers.
# Missing values are coded as "?", so use na.strings = "?".
data <- read.table(data.path, header = T, sep = ";", na.strings = "?")

# Convert Date field to actual Date.
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# Conver Time field to actual Time.
data$Time <- strptime(data$Time, "%H:%M:%S")

# Subset data as told.
data <- data[data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"),]

# Create plot 3.

# Set device.
png(file = "plot3.png")

# Plot and data points.
plot(data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", xaxt = "n")
points(data$Sub_metering_2, type = "l", col = "red")
points(data$Sub_metering_3, type = "l", col = "blue")

# Add legends
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Axis.
axis(1, at = c(0, nrow(data)/2, nrow(data)), labels = c("Thu", "Fri", "Sat"))

# Device off.
dev.off()