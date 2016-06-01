# import data with date ranges
library(data.table)
fullFile <- fread("../household_power_consumption.txt",header= TRUE,na.strings="?",sep=";")

fullFile$Date <- as.Date(fullFile$Date, format = "%d/%m/%Y")
data <- fullFile[Date >="2007-02-01" & Date <="2007-02-02"]

# remove extra files
rm(fullFile)

# create a new variable combining date and time
datetime <- paste(data$Date,data$Time)
data$dateTime <- as.POSIXct(datetime)

# create plot
plot(data$dateTime,data$Sub_metering_1,type="l",lty=1,lwd=1,xlab="",ylab="Energy sub metering",col="black")
lines(data$dateTime,data$Sub_metering_2,lty=1,lwd=1,col="red")
lines(data$dateTime,data$Sub_metering_3,lty=1,lwd=1,col="blue")

legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png,file="plot3.png",width=480,height=480)
dev.off()