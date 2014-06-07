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

##build histogram
png(filename ="plot1.png", width = 480, height = 480)
hist(data$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main ="Global Active Power")
dev.off()