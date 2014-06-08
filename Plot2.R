hpc <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
hpc$Date <- as.character(hpc$Date)
hpc$Time <- as.character(hpc$Time)
hpc$Time <- strptime(paste(hpc$Date,hpc$Time), "%d/%m/%Y %H:%M:%S")
hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")
subset <- hpc[hpc$Date >= "2007-02-01" & hpc$Date <= "2007-02-02", ]
subset$Global_active_power <- as.numeric(levels(subset$Global_active_power)[subset$Global_active_power])
plot(subset$Time, subset$Global_active_power, type = "s", xlab = "", ylab = "Global Active Power (kilowatts)")

