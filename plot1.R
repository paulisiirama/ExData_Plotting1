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

# Create Plot 1.

# Set device.
png(file = "plot1.png")

# Do plotting.
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowats)")

# Device off.
dev.off()