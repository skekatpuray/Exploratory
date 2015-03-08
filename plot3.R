## Packages necessary to run the code
library(sqldf)
library(dplyr)

##Read csv file based on condition that Date is either 2/2/2007 or 1/2/2007
df <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date = '2/2/2007' or Date = '1/2/2007'",sep = ";", header=TRUE)

##Generate a new column of type date. 
df$DateTime <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")

##Create png graphic device for plots.
png(file = "plot3.png", width = 480, height = 480)

##Generate initial plot for Sub_metering_1 on y-axis and datetime on x-axis
plot(df$DateTime, as.numeric(df$Sub_metering_1), ylab="Energy sub metering", type="l")

##Add Sub_metering_2 variable to existing plot.
points(df$DateTime, as.numeric(df$Sub_metering_2), col="red", type="l")

##Add sub_metering_3 to existing plot.
points(df$DateTime, as.numeric(df$Sub_metering_3), col="blue", type="l")

##Generate legend for all three measurements with individual colors.
legend("topright", lty = c(1, 1, 1), col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()