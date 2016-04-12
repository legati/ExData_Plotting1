#Explorative Data Analysis - Course Project 1 - plot2

#Data prep
input <- read.table("data/household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
startDate <- as.Date('2007-02-01')
finishDate <- as.Date('2007-02-02')
input_sub <- subset(input, as.Date(strptime(Date, format = "%d/%m/%Y")) >= startDate & as.Date(strptime(Date, format = "%d/%m/%Y")) <= finishDate, select = c(Date, Time, Global_active_power))
timeline <- as.POSIXct(strptime(paste(input_sub$Date, input_sub$Time), "%d/%m/%Y %H:%M:%S"))

#Plotting
plot(timeline, as.numeric(input_sub$Global_active_power), type = 'l', xlab = "", ylab = "Global Active Power (kilowatts)")

#Exporting to .png file
dev.copy(device = png, file = 'plot2.png')
dev.off()

