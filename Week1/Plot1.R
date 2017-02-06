library(data.table)

# load txt into data with separator ";",  replace ? as NA, read dates 2007-02-01 and 2007-02-02
data<-fread("household_power_consumption.txt",sep=";", na.strings=c("?","NA"))[,Date:=as.Date(Date,format="%d/%m/%Y")
                                                                               ][Date %in% seq(from=as.Date("2007-02-01"),to=as.Date("2007-02-02"),by="day")]

# open device
png(filename='plot1.png',width=480,height=480,units='px')

#plot 1
hist(data$Global_active_power
     ,col = "red", main = paste("Global Active Power"), xlab = "Global Active Power (kilowatts)") 

# turn off device
x<-dev.off()

