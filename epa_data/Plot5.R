#Set the working directory to where the files are present.
setwd("/Users/vedantgadia/Documents/R-Coursera/Assignment_2/epa_data/")

#Read the Files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Aggregating the motor vehicle emissions according to year in Baltimore
motor_emissions <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]
agg <- aggregate(Emissions ~ year, motor_emissions, sum)

#Opening the Graphics Device
quartz()

#Plotting the graph
barplot(height = agg$Emissions, names.arg = agg$year, col ="orange", xlab = "Year", ylab = "Motor Vehicle Emissions", main = "Total Motor Vehicle Emissions over the years")

#Saving the plot as a png file
dev.copy(png, filename = "Plot5.png")

#Closing the Graphics Device
dev.off()

