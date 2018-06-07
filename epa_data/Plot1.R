#Set the working directory to where the files are present.
setwd("/Users/vedantgadia/Documents/R-Coursera/Assignment_2/epa_data/")

#Read the Files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Aggregating the emissions according to year
agg <- aggregate(Emissions ~ year, NEI, sum)

#Opening the Graphics Device
quartz()

#Plotting the graph
plot(agg$year, agg$Emissions/ 10^6 , type = "b", xlab = "Year", ylab = "Total Emissions of PM 2.5 (10^6) tons", main ="Total PM 2.5 Emissions over the years" , col = "red")

#Saving the plot as a png file
dev.copy(png, filename = "Plot1.png")

#Closing the Graphics Device
dev.off()

