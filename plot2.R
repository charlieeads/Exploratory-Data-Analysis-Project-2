
#2.Have total emissions from PM2.5 decreased in the Baltimore City, Maryland 
#(fips == "24510") from 1999 to 2008? 
#Use the base plotting system to make a plot answering this question.

NEI <- readRDS("summarySCC_PM25.rds")

SCC <- readRDS("Source_Classification_Code.rds")

#Subset Baltimore city data and sum emissions
Bcity <- subset(NEI, fips == "24510")

AggregateBcity <- aggregate(Emissions ~ year, Bcity, sum)

#Line Plot showing Emissions going down over time
plot(AggregateBcity, main = "Total PM25 Emissions in Baltimore City", type = "l", xlab = "Year", 
     ylab = "PM25 Emissions", pch = 20)


dev.copy(png, file="plot2.png")

dev.off()
