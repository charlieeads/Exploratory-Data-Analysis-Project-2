
#5. How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

NEI <- readRDS("summarySCC_PM25.rds")

SCC <- readRDS("Source_Classification_Code.rds")

names(SCC)

names(NEI)

unique(NEI[c("type")])

#Subset Baltimore City Motor Vehicle Data
BCityCar <- subset(NEI, fips == "24510" & type=="ON-ROAD")

#Graph bar graph showing emissions for 1999-2008
graph2 <- ggplot(BCityCar, aes(factor(year), Emissions, fill = year)) + geom_bar(stat= "identity", width = .5) +
xlab("Year") + ylab("Car PM25 Emissions") + ggtitle("Total Car PM25 Emissions Baltimore City") 

print(graph2)

dev.copy(png, file="plot5.png")

dev.off()
