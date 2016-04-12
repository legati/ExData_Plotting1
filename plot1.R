#Explorative Data Analysis - Course Project 1 - plot1

#Data prep
input <- read.table("data/household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
startDate <- as.Date('2007-02-01')
finishDate <- as.Date('2007-02-02')
input_sub <- subset(input, as.Date(strptime(Date, format = "%d/%m/%Y")) >= startDate & as.Date(strptime(Date, format = "%d/%m/%Y")) <= finishDate, select = c(Global_active_power))

#Plotting
hist(as.numeric(input_sub$Global_active_power), col = 'orangered3', xlab = 'Global Active Power (kilowatts)', main = 'Global Active Power')

#Exporting to .png file
dev.copy(device = png, file = 'plot1.png')
dev.off()

