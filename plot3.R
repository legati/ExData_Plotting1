#Explorative Data Analysis - Course Project 1 - plot3

#Data prep
input <- read.table("data/household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
startDate <- as.Date('2007-02-01')
finishDate <- as.Date('2007-02-02')
input_sub <- subset(input, as.Date(strptime(Date, format = "%d/%m/%Y")) >= startDate & as.Date(strptime(Date, format = "%d/%m/%Y")) <= finishDate, select = c(Date, Time, Sub_metering_1, Sub_metering_2, Sub_metering_3))
timeline <- as.POSIXct(strptime(paste(as.vector(input_sub$Date), as.vector(input_sub$Time)), "%d/%m/%Y %H:%M:%S"))

#Plotting
plot(timeline, as.numeric(input_sub$Sub_metering_1), type = 'l', xlab = "", ylab = "Energy sub metering")
lines(timeline, as.numeric(input_sub$Sub_metering_2), col = 'red')
lines(timeline, as.numeric(input_sub$Sub_metering_3), col = 'blue')
legend("topright", col = c('black', 'red', 'blue'), lty = 1, legend = c('Sub_metering_1 ', 'Sub_metering_2 ', 'Sub_metering_3 '))

#Exporting to .png file
dev.copy(device = png, file = 'plot3.png')
dev.off()

