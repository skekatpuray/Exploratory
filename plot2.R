## Packages necessary to run the code
library(sqldf)
library(dplyr)

##Read csv file based on condition that Date is either 2/2/2007 or 1/2/2007
df <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date = '2/2/2007' or Date = '1/2/2007'",sep = ";", header=TRUE)

##Generate a new column of type date. 
df$DateTime <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")

##Create png graphic device for plots.
png(file = "plot2.png", width = 480, height = 480)

##Generate plot for global active power on datetime on x-axis and global active power on y-axis. 
with(df, plot(DateTime, as.numeric(Global_active_power), ylab="Global Active Power (kilowatts)", type="l"))

##Turn off graphic device to create png output file.
dev.off()