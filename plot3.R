project<- read.table("household_power_consumption.txt", sep= ";" , header= T, stringsAsFactors = F)
# reading the project data into R
View(project)
# viewing the data
project<- project[,-6]
# Removing the column as it will not be used in our exploration
project<- filter(project, Date=="1/2/2007"| Date=="2/2/2007")
# filter data so only the data for Feb 1 and Feb 2 remains
project$DateTime<- paste(project$Date,project$Time)
# Creating a new column called datetime by pasting the data and time side by side
class(project$DateTime)
# The column class is 'character'
project$DateTime<- strptime(project$DateTime, format= "%d/%m/%Y %H:%M:%S")
# chaning the class of the variable 
class(project$DateTime)
# New class is posixct and posixlt
windows()
# opening the graphics device
png("plot3.png", width= 480, height=480, units = "px")
# creating the file device
plot(project$DateTime, project$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", main="")
# plotting
lines(project$DateTime,project$Sub_metering_2,type="l", col="red")
# adding lines
lines(project$DateTime,project$Sub_metering_3,type="l", col="blue")
# adding lines 
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),pch=c("-","-","-"),pt.cex = c(2,2,2))
# adding legend
dev.off()
# closing device