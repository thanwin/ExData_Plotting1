## File
file <- "household_power_consumption.txt"
 
## read the file onto memory
df <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE) 

#subset the df to required dates
df <- subset(df, as.Date(Date, "%d/%m/%Y") == "2007-02-01" | as.Date(Date, "%d/%m/%Y") == "2007-02-02")

#plot histogram
hist(as.numeric(df$Global_active_power), col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

#copy the screnn output to file
dev.copy(png, "plot1.png", width=480, height=480)

#close the device
dev.off()
