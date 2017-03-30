
#1. Have total emissions from PM2.5 decreased in the United States 
#from 1999 to 2008? Using the base plotting system, 
#make a plot showing the total PM2.5 emission from all sources 
#for each of the years 1999, 2002, 2005, and 2008.


getwd()

NEI <- readRDS("summarySCC_PM25.rds")

SCC <- readRDS("Source_Classification_Code.rds")

#Summing up emissions by year
Aggregate <- aggregate(Emissions ~ year, NEI, sum)

#Line Plot showing Emissions going down over time
plot(Aggregate, main = "Total PM25 Emissions", type = "l", xlab = "Year", 
     ylab = "PM25 Emissions", pch = 20)


dev.copy(png, file="plot1.png")

dev.off()


