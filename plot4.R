#Explorative Data Analysis - Course Project 1 - plot4

#Data prep
input <- read.table("data/household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
startDate <- as.Date('2007-02-01')
finishDate <- as.Date('2007-02-02')
input_sub <- subset(input, as.Date(strptime(Date, format = "%d/%m/%Y")) >= startDate & as.Date(strptime(Date, format = "%d/%m/%Y")) <= finishDate, select = c(Date, Time, Global_active_power, Global_reactive_power, Voltage, Sub_metering_1, Sub_metering_2, Sub_metering_3))
timeline <- as.POSIXct(strptime(paste(as.vector(input_sub$Date), as.vector(input_sub$Time)), "%d/%m/%Y %H:%M:%S"))

#Multi-Plotting
par(mfrow = c(2,2), mar = c(4,4,1.5,2.5), cex.lab = 0.75)

#Sub-Plot1
plot(timeline, as.numeric(input_sub$Global_active_power), type = 'l', xlab = " ", ylab = "Global Active Power")

#Sub-Plot2
plot(timeline, as.numeric(input_sub$Voltage), type = 'l', xlab = "datetime", ylab = "Voltage")

#Sub-Plot3
plot(timeline, as.numeric(input_sub$Sub_metering_1), type = 'l', xlab = " ", ylab = "Energy sub metering")
lines(timeline, as.numeric(input_sub$Sub_metering_2), col = 'red')
lines(timeline, as.numeric(input_sub$Sub_metering_3), col = 'blue')
legend("topright", col = c('black', 'red', 'blue'), lty = 1, legend = c('Sub_metering_1 ', 'Sub_metering_2 ', 'Sub_metering_3 '), cex = 0.5)

#Sub-plot4
plot(timeline, as.numeric(input_sub$Global_reactive_power), type = 'h', xlab = 'datetime', ylab = 'Global_active_power')

#Exporting to a .png file
dev.copy(device = png, file = 'plot4.png')
dev.off()

