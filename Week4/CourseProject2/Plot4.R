# 4. Across the United States, 
# how have emissions from coal combustion-related sources changed from 1999-2008?
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
# Find coal combustion-related sources
hasCombustionCoal <- grepl("Fuel Comb.*Coal", SCC$EI.Sector)
srcCombustionCoal <- SCC[hasCombustionCoal,]

# Find and aggregate emissions from coal combustion-related sources
emissCombustionCoal <- NEI[(NEI$SCC %in% srcCombustionCoal$SCC), ]

# plot
library(ggplot2)

# open device
png(filename='plot4.png',width=480,height=480,units='px')

ggplot(emissCombustionCoal, aes(x=factor(year), y=Emissions)) +
  geom_bar(stat="summary",fun.y="sum") +
  xlab("Year") +
  ylab(expression("Total PM"[2.5]*" emissions in tons")) +
  ggtitle("Emissions from coal combustion-related sources from 1999-2008")

# turn off device
x<-dev.off()