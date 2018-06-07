#Set the working directory to where the files are present.
setwd("/Users/vedantgadia/Documents/R-Coursera/Assignment_2/epa_data/")

#Read the Files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Aggregating the coal emissions according to year
coal_scc <- SCC[grepl('coal', SCC$Short.Name),]
coal_emissions <- NEI[NEI$SCC %in% coal_scc$SCC,]
agg <- aggregate(Emissions ~ year, coal_emissions, sum)

#Opening the Graphics Device
quartz()

#Plotting the graph
plot(agg$year, agg$Emissions, type = "b", col = "green", xlab = "Year", ylab = "Coal Emissions", main = "Total Coal Emissions over the years")

#Saving the plot as a png file
dev.copy(png, filename = "Plot4.png")

#Closing the Graphics Device
dev.off()

