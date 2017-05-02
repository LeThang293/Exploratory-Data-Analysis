############  3. ################
# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? 
# Which have seen increases in emissions from 1999-2008? Use the ggplot2 plotting system to make 
# a plot answer this question.

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)
#select Baltimore and aggregate by year
baltimore <- NEI[NEI$fips=="24510",]
# open device
png(filename='plot3.png',width=480,height=480,units='px')

# facet grid transform the data into groups
ggplot(baltimore, aes(x=factor(year), y=Emissions, fill=type)) +
  geom_bar(stat="identity") +
  facet_grid(. ~ type) + 
  theme_bw() + guides(fill=FALSE) +
  xlab("Year") +
  ylab(expression("Total PM"[2.5]*" emission in tons")) +
  ggtitle(expression("PM"[2.5]*paste(" emissions in Baltimore City ",
                                     " by all sources")))

# turn off device
x<-dev.off()