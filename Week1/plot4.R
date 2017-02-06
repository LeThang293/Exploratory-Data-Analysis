library(data.table)

# load txt into data with separator ";",  replace ? as NA, read dates 2007-02-01 and 2007-02-02
data<-fread("household_power_consumption.txt",sep=";", na.strings=c("?","NA"))[,Date:=as.Date(Date,format="%d/%m/%Y")
                                                                               ][Date %in% seq(from=as.Date("2007-02-01"),to=as.Date("2007-02-02"),by="day")]

# open device
png(filename='plot4.png',width=480,height=480,units='px')

# concatinate datetime
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime) 

par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(data, {
  # first chart
  plot(Global_active_power ~ Datetime, type = "l", 
       ylab = "Global Active Power", xlab = "")
  # second
  plot(Voltage ~ Datetime, type = "l", ylab = "Voltage", xlab = "datetime")
  # third with legend
  plot(Sub_metering_1 ~ Datetime, type = "l", ylab = "Energy sub metering", xlab = "")
        lines(Sub_metering_2 ~ Datetime, col = 'Red')
        lines(Sub_metering_3 ~ Datetime, col = 'Blue')
        legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 1, bty = "n",
                           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  # last      
  plot(Global_reactive_power ~ Datetime, type = "l", 
       ylab = "Global_rective_power", xlab = "datetime")
})


# turn off device
x<-dev.off()