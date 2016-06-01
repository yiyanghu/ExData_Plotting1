# import data with date ranges
library(data.table)
fullFile <- fread("../household_power_consumption.txt",header= TRUE,na.strings="?",sep=";")

fullFile$Date <- as.Date(fullFile$Date, format = "%d/%m/%Y")
data <- fullFile[Date >="2007-02-01" & Date <="2007-02-02"]

# remove extra files
rm(fullFile)


# plot the image
par(las=1)
hist(data$Global_active_power,main="Global Active Power", xlab="Global Active Power (kilowatts)",ylab="Frequency",col="Red")
dev.copy(png,file="plot1.png")
dev.off()

