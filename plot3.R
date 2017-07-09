setClass('myDate')
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )

input_data <- read.table("household_power_consumption.txt",header = TRUE, sep=";",na.strings = "?",
                         colClasses = c('myDate',NA,'numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
mydata <- subset(input_data, Date==as.Date('2007-02-01',"%Y-%m-%d" ) | Date==as.Date('2007-02-02',"%Y-%m-%d" ) )

png("plot3.png", width = 480, height = 480)

plot(as.POSIXct(paste(mydata$Date, mydata$Time), format="%Y-%m-%d %H:%M:%S"), 
     mydata$Sub_metering_1 ,
     type="l", 
     ylab = "Energy sub metering",
     xlab = ""
)
lines(as.POSIXct(paste(mydata$Date, mydata$Time), format="%Y-%m-%d %H:%M:%S"),mydata$Sub_metering_2, col = "red")
lines(as.POSIXct(paste(mydata$Date, mydata$Time), format="%Y-%m-%d %H:%M:%S"),mydata$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1, col=c("black", "red", "blue"))

dev.off()

