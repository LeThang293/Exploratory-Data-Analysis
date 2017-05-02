# 5. How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?
# Find motor vehicle sourcesin Baltimore and do aggregation
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
baltimoreMotor <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",]
#aggBaltimoreMotor <- aggregate(Emissions ~ year, baltimoreMotor,sum)

library(ggplot2)
# open device
png(filename='plot5.png',width=480,height=480,units='px')
ggplot(baltimoreMotor, aes(x=factor(year), y=Emissions)) +
  geom_bar(stat="summary",fun.y="sum") +
  xlab("Year") +
  ylab(expression("Total PM"[2.5]*" emissions in tons")) +
  ggtitle("Emissions from motor vehicle sources in Baltimore City from 1999-2008")
# turn off device
x<-dev.off()