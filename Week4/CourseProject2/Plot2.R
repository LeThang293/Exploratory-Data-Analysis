############  2. ################
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008?
# Use the base plotting system to make a plot answering this question.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#select Baltimore and aggregate bu year
baltimore <- NEI[NEI$fips=="24510",]
aggBaltimore <- aggregate(Emissions ~ year, baltimore,sum)

# open device
png(filename='plot2.png',width=480,height=480,units='px')
barplot(
  aggBaltimore$Emissions,
  names.arg=aggBaltimore$year,
  xlab="Year",
  ylab="PM2.5 emissions in tons",
  main="Total PM2.5 emissions in the Baltimore City"
)
# turn off device
x<-dev.off()