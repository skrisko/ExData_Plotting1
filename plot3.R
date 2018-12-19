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
png(file = "plot3.png")

## We want several data on the same graphic we start to create a blank craphic with the parameter type  "n"
plot(time, data$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "")

## We add the different with the function points, type = "l" to have a graphic with line
points(time, data$Sub_metering_1, type = "l", col = "black")
points(time, data$Sub_metering_2, type = "l", col = "red")
points(time, data$Sub_metering_3, type = "l", col = "blue")

## Last step we create the legend
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "SUb_metering_2", "Sub_metering_3"), lty = 1, cex = 0.8)

## Don't forget to close the device
dev.off()