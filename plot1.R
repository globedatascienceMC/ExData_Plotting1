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

#plot 1
png("plot1.png", width=480, height=480)
hist(data$Global_active_power, col = "red", 
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab="Frequency")
dev.off()
