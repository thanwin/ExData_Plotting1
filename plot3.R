## File
file <- "household_power_consumption.txt"
 
## read the file onto memory
df <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE) 

#subset the df to required dates
df <- subset(df, as.Date(Date, "%d/%m/%Y") == "2007-02-01" | as.Date(Date, "%d/%m/%Y") == "2007-02-02")

datetime <- strptime(paste(df$Date, df$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#plot diagram
plot(datetime, as.numeric(df$Sub_metering_1), type="l", xlab="", ylab="Energy sub metering")
lines(datetime, as.numeric(df$Sub_metering_2), col="red")
lines(datetime, as.numeric(df$Sub_metering_3), col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1), cex=.5)

#copy the screen output to file
dev.copy(png, "plot3.png", width=480, height=480)

#close the device
dev.off()
