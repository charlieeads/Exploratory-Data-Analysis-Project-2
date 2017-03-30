
#6. Compare emissions from motor vehicle sources in Baltimore City with emissions from 
#motor vehicle sources in Los Angeles County, California (fips == "06037"). 
#Which city has seen greater changes over time in motor vehicle emissions?

NEI <- readRDS("summarySCC_PM25.rds")

SCC <- readRDS("Source_Classification_Code.rds")

#Subset LA Motor Vehicles and Baltimore City and Add City Column
LACar <- subset(NEI, fips == "06037" & type=="ON-ROAD")

LACar$city <- "LA"

BCityCar <- subset(NEI, fips == "24510" & type=="ON-ROAD")

BCityCar$city <- "Baltimore City"

BCity_LA <- rbind(BCityCar, LACar)

#Graph bar graph with 2 sections, one for LA, one for Baltimore City
graph3 <- ggplot(BCity_LA, aes(factor(year), Emissions, fill = city)) + geom_bar(stat= "identity", width = .5) +
facet_grid(scales="free", space="free", .~city) +
xlab("Year") + ylab("Car PM25 Emissions") + ggtitle("Total Car PM25 Emissions Baltimore City vs. LA") 

print(graph3)

dev.copy(png, file="plot6.png")

dev.off()
