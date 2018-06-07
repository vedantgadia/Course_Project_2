#Set the working directory to where the files are present.
setwd("/Users/vedantgadia/Documents/R-Coursera/Assignment_2/epa_data/")

#Read the Files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Aggregating the emissions according to year in Baltimore
agg <- aggregate(Emissions ~ year, NEI[which(NEI$fips == 24510), ], sum)

#Opening the Graphics Device
quartz()

#Plotting the graph
barplot(height = agg$Emissions, names.arg =  agg$year, xlab = "Year", ylab = "Total Emissions of PM 2.5 in Baltimore", main = "Total PM 2.5 emission over the years", col = "yellow")

#Saving the plot as a png file
dev.copy(png, filename = "Plot2.png")

#Closing the Graphics Device
dev.off()

