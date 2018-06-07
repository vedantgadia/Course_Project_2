#Set the working directory to where the files are present.
setwd("/Users/vedantgadia/Documents/R-Coursera/Assignment_2/epa_data/")

#Read the Files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Aggregating the Motor Vehicle emissions according to year in Baltimore and Los Angeles
Baltimore_motor_emissions <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]
LA_motor_emissions <- NEI[NEI$fips == "06037" & NEI$type == "ON-ROAD", ]
agg1 <- aggregate(Emissions ~ year + fips, Baltimore_motor_emissions, sum)
agg2 <- aggregate(Emissions ~ year + fips, LA_motor_emissions, sum)
motor_emissions <- rbind(agg1, agg2)

#Opening the Graphics Device
quartz()

#Library for using the ggplot2 functions
library(ggplot2)

#Plotting the graph
g <- ggplot(motor_emissions, aes(year, Emissions, color = fips))
g <- g + geom_line() +geom_point() +scale_color_discrete(name = "City", breaks = c("06037","24510"), labels= c("Los Angeles", "Baltimore")) +xlab("Year") + ylab("Motor Vehicle Emissions") + ggtitle("Comparision of Motor Vehicle Emissions in Baltimore and \n Los Angeles over the years") + theme_classic()
print(g)
#Saving the plot as a png file
dev.copy(png, filename = "Plot6.png")

#Closing the Graphics Device
dev.off()

