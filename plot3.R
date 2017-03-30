
#3. Of the four types of sources indicated by the type 
#(point, nonpoint, onroad, nonroad) variable, which of these 
#four sources have seen decreases in emissions from 1999-2008 for Baltimore City? 
#Which have seen increases in emissions from 1999-2008? 
#Use the ggplot2 plotting system to make a plot answer this question.

library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")

SCC <- readRDS("Source_Classification_Code.rds")

#Subset Baltimore city data and sum emissions
Bcity <- subset(NEI, fips == "24510")

AggregateBcityType <- aggregate(Bcity[c("Emissions")], list(type = Bcity$type, 
                      year = Bcity$year), sum)

#Line graph of all types of emisssions
qplot(year, Emissions, data = AggregateBcityType, color = type, geom = "line") + 
    ggtitle("Total PM25 Emissions in Baltimore City by Type") +
    xlab("Year") + ylab("PM25 Emissions")

dev.copy(png, file="plot3.png")

dev.off()
