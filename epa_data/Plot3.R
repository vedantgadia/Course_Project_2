#Set the working directory to where the files are present.
setwd("/Users/vedantgadia/Documents/R-Coursera/Assignment_2/epa_data/")

#Read the Files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Aggregating the emissions according to year in Baltimore
agg <- aggregate(Emissions ~ year + type, NEI[which(NEI$fips == 24510), ], sum)

#Opening the Graphics Device
quartz()

#Library for using the ggplot2 functions
library(ggplot2)

#Plotting the graph
g <- ggplot(agg, aes(year, Emissions, color = type))
g <- g + geom_line() + xlab("Year") + ylab("PM 2.5 Emissions") + ggtitle("Total PM 2.5 Emissions in Baltimore over the years") +theme_bw()
print(g)

#Saving the plot as a png file
dev.copy(png, filename = "Plot3.png")

#Closing the Graphics Device
dev.off()

