# Script to create the first plot for the Assignment: Course Project 1,
# Exploratory Data Analysis course.
library(lubridate)

# Download the data file from UCI if it is not already in a local file.
if (!file.exists("household_power_consumption.zip")) {
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,destfile="household_power_consumption.zip",method="curl",mode = "wb")
}

# Read the file from the zip file.
data <- read.table(unz("household_power_consumption.zip","household_power_consumption.txt"),
                   header = T,sep = ";",stringsAsFactors = FALSE, na.strings = "?")
# There are 2M lines on that data set. Let's filter some, reduce to 2880.
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
# Let's unify the date and time.
data$TS <- dmy_hms(paste(data$Date,data$Time))
# Let's correct the classes.
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
data$Voltage <- as.numeric(data$Voltage)

# Let's create the line plot, on a PNG file,
png(filename="plot4.png")
par(mfrow=c(2,2))
# Top left plot
plot(data$TS,data$Global_active_power,type = "l",
     ylab = "Global Active Power (kilowatts)",xlab="")
# Top right plot
plot(data$TS,data$Voltage,type = "l",
     ylab = "Voltage",xlab="datetime")
# Bottom left plot
plot(data$TS,data$Sub_metering_1,type = "n",
     ylab = "Energy sub metering",xlab="")
lines(data$TS,data$Sub_metering_1,type = "l",col="black")
lines(data$TS,data$Sub_metering_2,type = "l",col="red")
lines(data$TS,data$Sub_metering_3,type = "l",col="blue")
legend("topright",lty=c(1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
# Bottom right plot
plot(data$TS,data$Global_reactive_power,type = "l",
     ylab = "Global_reactive_power",xlab="datetime")
dev.off()

# Clean up (since we will commit this to GIT)
if (file.exists("household_power_consumption.zip")) {
  file.remove("household_power_consumption.zip")
}