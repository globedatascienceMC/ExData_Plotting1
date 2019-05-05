#read table
data <- read.table("household_power_consumption.txt", header=TRUE, sep= ";", na.strings="?")
head <- head(data)
View(head)

#change Date into date factor and add DateTime to data
library(lubridate)
data$Date <- dmy(data$Date)
data$Time <- hms(data$Time)
data <- subset(data, Date == "2007-02-01" | Date=="2007-02-02")
DateTime <- paste(data$Date, data$Time)
data$DateTime <- as.POSIXct(DateTime)

png("plot3.png", width=480, height=480)
plot(data$DateTime, data$Sub_metering_1, type="l",
     xlab="", ylab="Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright", lty= 1, lwd=2, col=c("black", "blue", "red"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()