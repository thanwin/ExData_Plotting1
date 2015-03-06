## File
file <- "household_power_consumption.txt"
 
## read the file onto memory
df <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE) 

#subset the df to required dates
df <- subset(df, as.Date(Date, "%d/%m/%Y") == "2007-02-01" | as.Date(Date, "%d/%m/%Y") == "2007-02-02")

datetime <- strptime(paste(df$Date, df$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#plot diagram
plot(datetime, as.numeric(df$Global_active_power), type="l", xlab="", ylab="Global Active Power (kilowatts)")

#copy the screen output to file
dev.copy(png, "plot2.png", width=480, height=480)

#close the device
dev.off()
