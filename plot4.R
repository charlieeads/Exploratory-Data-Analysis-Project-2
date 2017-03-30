
#4. Across the United States, how have emissions from coal 
#combustion-related sources changed from 1999-2008?

NEI <- readRDS("summarySCC_PM25.rds")

SCC <- readRDS("Source_Classification_Code.rds")

#subsetting Coal in NEI and SCC data
SCCCoal <- SCC[grepl("Coal" , SCC$Short.Name), ]

NEICoal <- NEI[NEI$SCC %in% SCCCoal$SCC, ]

#Graph bar graph showing total Coal emissions for 1999-2008
graph <- ggplot(NEICoal, aes(factor(year), Emissions, fill = year)) + xlab("Year") + geom_bar(stat= "identity", width = .5) +
ylab("Coal Combustion PM25 Emissions") + ggtitle("Total Coal Combustion PM25 Emissions") 

print(graph)

dev.copy(png, file="plot4.png")

dev.off()
