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

# Create plot 2.

# Set device.
png(file = "plot2.png")

# Do plotting.
plot(data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowats)", xaxt = "n")

# Correct axis. (There should be better way to do this)
axis(1, at = c(0, nrow(data)/2, nrow(data)), labels = c("Thu", "Fri", "Sat"))

# Device off.
dev.off()