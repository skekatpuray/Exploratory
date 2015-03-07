df <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date = '2/2/2007' or Date = '1/2/2007'",sep = ";", header=TRUE)
df$DateTime <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")

png(file = "plot2.png", width = 480, height = 480)

with(df, plot(DateTime, as.numeric(Global_active_power), ylab="Global Active Power (kilowatts)", type="l"))

dev.off()