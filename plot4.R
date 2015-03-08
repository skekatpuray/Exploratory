## Packages necessary to run the code
library(sqldf)
library(dplyr)

##Read csv file based on condition that Date is either 2/2/2007 or 1/2/2007
df <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date = '2/2/2007' or Date = '1/2/2007'",sep = ";", header=TRUE)

##Generate a new column of type date. 
df$DateTime <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")

##Create png graphic device for plots.
png(file = "plot4.png", width = 480, height = 480)

##Set up 2x2 plot holder.
par(mfrow=c(2,2))
with (df,{
  plot(DateTime, as.numeric(Global_active_power), xlab="", ylab="Global Active Power (kilowatts)", type="l")	##Plot-1
  plot(DateTime, as.numeric(Voltage), type="l",  xlab="datetime", ylab="Voltage")				##Plot-2
  plot(DateTime, as.numeric(Sub_metering_1), xlab="", ylab="Energy sub metering", type="l")			##Plot-3
  points(DateTime, as.numeric(Sub_metering_2), col="red", type="l")
  points(DateTime, as.numeric(Sub_metering_3), col="blue", type="l")
  legend("topright", lty = c(1, 1, 1), bty = "n", col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  plot(DateTime, as.numeric(Global_reactive_power), type="l",  xlab="datetime", ylab="Global_reactive_power")	##Plot-4
})
dev.off()  