setClass('myDate')
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )

input_data <- read.table("household_power_consumption.txt",header = TRUE, sep=";",na.strings = "?",
                         colClasses = c('myDate',NA,'numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
mydata <- subset(input_data, Date==as.Date('2007-02-01',"%Y-%m-%d" ) | Date==as.Date('2007-02-02',"%Y-%m-%d" ) )

png("plot1.png", width = 480, height = 480)
hist(mydata$Global_active_power,
     xlab="Global Active Power (kilowatts)",
     main="Global Active Power",
     ylim=c(0,1200),
     col="red")
dev.off()