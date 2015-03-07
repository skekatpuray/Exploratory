df <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date = '2/2/2007' or Date = '1/2/2007'",sep = ";", header=TRUE)
df$DateTime <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")

png(file = "plot3.png", width = 480, height = 480)

plot(df$DateTime, as.numeric(df$Sub_metering_1), ylab="Energy sub metering", type="l")

points(df$DateTime, as.numeric(df$Sub_metering_2), col="red", type="l")

points(df$DateTime, as.numeric(df$Sub_metering_3), col="blue", type="l")

legend("topright", lty = c(1, 1, 1), col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()