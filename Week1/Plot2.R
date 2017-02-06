library(data.table)

# load txt into data with separator ";",  replace ? as NA, read dates 2007-02-01 and 2007-02-02
data<-fread("household_power_consumption.txt",sep=";", na.strings=c("?","NA"))[,Date:=as.Date(Date,format="%d/%m/%Y")
                                                                               ][Date %in% seq(from=as.Date("2007-02-01"),to=as.Date("2007-02-02"),by="day")]

# open device
png(filename='plot2.png',width=480,height=480,units='px')

# concatinate datetime
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime) 

plot(data$Global_active_power ~ data$Datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")

# turn off device
x<-dev.off()
