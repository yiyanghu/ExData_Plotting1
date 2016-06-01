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
par(mfrow=c(2,2))

# 1st graph
plot(data$dateTime,data$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

# 2nd graph
plot(data$dateTime,data$Voltage,type="l",xlab="datetime",ylab="Voltage")

# 3rd graph
plot(data$dateTime,data$Sub_metering_1,type="l",lty=1,lwd=1,xlab="",ylab="Energy sub metering",col="black")
lines(data$dateTime,data$Sub_metering_2,lty=1,lwd=1,col="red")
lines(data$dateTime,data$Sub_metering_3,lty=1,lwd=1,col="blue")

legend("topright",lty=1,lwd=2, cex = 0.7,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# 4th graph
plot(data$dateTime,data$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")

dev.copy(png,file="plot4.png",width=480,height=480)
dev.off()

