# read in household_power_consumption.txt data file 
powerData <- read.table("./exdata-data-household_power_consumption/household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors=TRUE)
#dim(powerData)
#str(powerData)
#head(powerData)
#object.size(powerData) #memory size

# coerce to POSIXct format
powerData$DateTime <- as.POSIXct(paste(powerData$Date, powerData$Time), format='%d/%m/%Y %H:%M:%S')

#subset to dates from 2007-02-01 and 2007-02-02
library(dplyr)
myData <- filter(powerData, DateTime >= as.POSIXct("2007-02-01 00:00:00"), DateTime < as.POSIXct("2007-02-03 00:00:00"))
#dim(myData)
#head(myData)
#tail(myData)

#plot2
par(mfrow=c(1,1), mar=c(4,4,2,1))
with(myData, plot(DateTime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
