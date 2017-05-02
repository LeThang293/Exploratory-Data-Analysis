
############  1. ################
#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
#Using the base plotting system, make a plot showing the total PM2.5 emission 
#from all sources for each of the years 1999, 2002, 2005, and 2008.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# agg Emission from all sources by years
aggEmi <- aggregate(Emissions ~ year,NEI, sum)

# open device
png(filename='plot1.png',width=480,height=480,units='px')

barplot(
  (aggEmi$Emissions)/10^6,
  names.arg=aggTotals$year,
  xlab="Year",
  ylab="PM2.5 emissions 10^6 Tons",
  main="Total PM2.5 emissions from all sources"
)

# turn off device
x<-dev.off()
