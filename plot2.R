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
plot(data$dateTime,data$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.copy(png,file="plot2.png",width=480,height=480)
dev.off()