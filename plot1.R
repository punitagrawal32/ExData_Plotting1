project<- read.table("household_power_consumption.txt", sep= ";" , header= T, stringsAsFactors = F)
# reading the project data into R
View(project)
# viewing the data
project<- project[,-6]
# Removing the column as it will not be used in our exploration
project<- filter(project, Date=="1/2/2007"| Date=="2/2/2007")
# filter data so only the data for Feb 1 and Feb 2 remains
windows()
# opening the graphics device
png("plot1.png", width = 480, height = 480, units = "px")
# creating the file device
hist(as.numeric(project$Global_active_power), col="red",xlab= "Global Active Power (kilowatts)", main="Global Active Power")
# making the plot
dev.off()
# closing the device