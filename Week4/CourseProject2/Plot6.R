# 6 Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources 
# in Los Angeles County, California (fips == "06037"). 
# Which city has seen greater changes over time in motor vehicle emissions?
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Find motor vehicle sourcesin Baltimore and Los Angeles County
srcMotor2Cities <- NEI[NEI$fips %in% c("24510","06037") & NEI$type=="ON-ROAD",]

# plot
library(ggplot2)
png("plot6.png")
ggplot(srcMotor2Cities, aes(x=factor(year), y=Emissions,color=fips)) +
  geom_point(stat= "summary",fun.y="sum") + 
  ylab("Total emissions in tons") + 
  xlab("Year") +
  scale_colour_discrete(name = "City", label = c("Los Angeles","Baltimore")) + 
  ggtitle(expression("Motor vehicle emission in Baltimore and Los Angeles"))
# turn off device
x<-dev.off()