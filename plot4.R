
## File
file <- "household_power_consumption.txt"
 
## read the file onto memory
df <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE) 

#subset the df to required dates
df <- subset(df, as.Date(Date, "%d/%m/%Y") == "2007-02-01" | as.Date(Date, "%d/%m/%Y") == "2007-02-02")

#Reactive <- as.numeric(df$Global_reactive_power)
#Power <- as.numeric(df$Global_active_power)
#Voltage <- as.numeric(df$Voltage)
#datetime <- strptime(paste(df$Date, df$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
#Sub_metering_1 <- as.numeric(df$Sub_metering_1)
#Sub_metering_2 <- as.numeric(df$Sub_metering_2)
#Sub_metering_3 <- as.numeric(df$Sub_metering_3)

#four plots
par(mfrow=c(2,2))

#plot diagrams
plot(datetime, as.numeric(df$Global_active_power), type="l", xlab="", ylab="Global Active Power")
plot(datetime, as.numeric(df$Voltage), type="l", xlab="", ylab="Voltage")
plot(datetime, as.numeric(df$Sub_metering_1), type="l", xlab="", ylab="Energy sub metering")
lines(datetime, as.numeric(df$Sub_metering_2), col="red")
lines(datetime, as.numeric(df$Sub_metering_3), col="blue")
#pty(), bty (default - 0, suppresses the box - "n"), cex (default - 1, change to 0.5 to adjust the legend otherwise numbers are missing)
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1), bty="n", cex=.5)
plot(datetime, as.numeric(df$Global_reactive_power), type="l", xlab="datetime", ylab="Global_reactive_power")

#copy the screen output to file
dev.copy(png, "plot4.png", width=480, height=480)

#close the device
dev.off()
