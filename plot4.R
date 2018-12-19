## First we set the working directory
setwd("exdata_data_household_power_consumption")
library(dplyr)

## We read the data, the data readed is household_power_consumption2.txt, the lighter version of the dataset
## were there is only the two day we want to analyse. We set also the classe of the colome.
data <- read.csv("household_power_consumption2.txt", sep = ";", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

## We formate the date from the class character to the class Date
data[,1] <- as.Date(data[1], "%a/%m/%Y")

##We formate the time
data[,2] <- format(data$Time, format = "%H:%M:%S")

## We create a new variable time that will be the reference for the x axis for the plot 2, 3, 4
time <-as.POSIXct(paste(data$Date, data$Time))

## We create a new png file and store the plot in it. The default parameter for the png function is already 
## width of 480 pixels and a height of 480 pixels
png(file = "plot4.png")

## We start with par() to make several graphic on one display
par(mfrow = c(2,2))

## First plot, plot number 2
plot(time, data$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab = "")

## second plot the voltage
plot(time, data$Voltage, ylab = "Voltage", xlab = "datetime", type = "l")

## Third plot the plot number 3
plot(time, data$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "")
points(time, data$Sub_metering_1, type = "l", col = "black")
points(time, data$Sub_metering_2, type = "l", col = "red")
points(time, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "SUb_metering_2", "Sub_metering_3"), lty = 1, cex = 0.8)

##Last plot new plot of the reactive power
plot(time, data$Global_reactive_power, ylab = "Global_reactive_power", xlab = "datetime", type = "l")

## Don't forget to close the device
dev.off()