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
png("plot4.png", width= 480, height= 480, units= "px")
# creating file device
par(mfcol=c(2,2))
# setting the dimensions to accomodate 4 graphs in 1 file 
plot(project$DateTime, project$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", main="", type="l")
# graph#1
plot(project$DateTime, project$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", main="")
# graph#2
lines(project$DateTime,project$Sub_metering_2,type="l", col="red")
# graph#2
lines(project$DateTime,project$Sub_metering_3,type="l", col="blue")
# graph#2
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),pch=c("-","-","-"),bty="n",pt.cex = c(2,2,2))
# graph#2
plot(project$DateTime, project$Voltage, xlab="datetime", ylab="Voltage", type="l")
# graph#3
plot(project$DateTime, project$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")
# graph#4
dev.off()
# closing the device
