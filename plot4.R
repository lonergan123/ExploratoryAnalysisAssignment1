setwd("C:/Users/Kevin/SkyDrive/Documents/Personal/Coursera/Exploratory Data Analysis")

##load in data file
durl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(durl,destfile="power.zip")
unzip("power.zip")
power <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors =FALSE, na.strings = "?")

##subset to 2 required days in February
data <- subset(power, as.Date(power$Date, "%d/%m/%Y") >='2007-02-01' & as.Date(power$Date, "%d/%m/%Y") <= '2007-02-02')

##translate date/time from chr
data$Date2 <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

##build plot and save to png graphics device
png(filename ="plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
plot(data$Date2, data$Global_active_power, type = "n", 
     xlab = "", ylab = "Global Active Power (kilowatts)")
lines(data$Date2, data$Global_active_power)

plot(data$Date2, data$Voltage, type = "n", 
     xlab = "datetime", ylab = "Voltage")
lines(data$Date2, data$Voltage)

plot(data$Date2, data$Sub_metering_1, type = "n", 
     xlab = "", ylab = "Energy sub meeting")
lines(data$Date2, data$Sub_metering_1)
lines(data$Date2, data$Sub_metering_2, col = "red")
lines(data$Date2, data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black","red", "blue"),lty = c(1,1),bty="n")

plot(data$Date2, data$Global_reactive_power, type = "n", 
     xlab = "datetime")
lines(data$Date2, data$Global_reactive_power)
dev.off()