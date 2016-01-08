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
# Let's correct the Global_active_power class.
data$Global_active_power <- as.numeric(data$Global_active_power)

# Let's create the line plot, on a PNG file,
png(filename="plot2.png")
plot(data$TS,data$Global_active_power,type = "l",
     ylab = "Global Active Power (kilowatts)",xlab="")
dev.off()

# Clean up (since we will commit this to GIT)
if (file.exists("household_power_consumption.zip")) {
  file.remove("household_power_consumption.zip")
}
