setwd("C:/Users/Kevin/SkyDrive/Documents/Personal/Coursera/Exploratory Data Analysis")

##load in data file
durl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(durl,destfile="power.zip")
unzip("power.zip")
power <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors =FALSE, na.strings = "?")

##subset to 2 required days in February
data <- subset(power, as.Date(power$Date, "%d/%m/%Y") >='2007-02-01' & as.Date(power$Date, "%d/%m/%Y") <= '2007-02-02')

##convert date from chr
data$Date2 <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

##build line graph
png(filename ="plot3.png", width = 480, height = 480)
plot(data$Date2, data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab="")
lines(data$Date2, data$Sub_metering_2, col="red")
lines(data$Date2, data$Sub_metering_3, col="blue")
legend("topright", lty=c(1,1),col=c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.off()





