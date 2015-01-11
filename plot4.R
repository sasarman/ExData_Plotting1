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

#plot4
par(mfrow=c(2,2),mar=c(2,4,0,3),oma=c(0,1,0,0))
with(myData,
{plot(DateTime, Global_active_power, type="l", ylab="Global Active Power", xlab="")
 plot(DateTime, Voltage, type="l", ylab="Voltage", xlab="datetime")
 plot(DateTime, Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
 points(DateTime, Sub_metering_1, type="l", col="black")
 points(DateTime, Sub_metering_2, type="l", col="red")
 points(DateTime, Sub_metering_3, type="l", col="blue")
 legend("topright", lty=1, bty="n", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.75)
 plot(DateTime, Global_reactive_power, type="l", xlab="datetime")
})
dev.copy(png, file="plot4.png", height=480, width=480, pointsize=11)
dev.off()
