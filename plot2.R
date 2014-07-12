# Assumes that file has been downloaded to working directory first and reads in the file
proj1 <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
# Create combined date/time column to be used later
proj1$DT <- paste(proj1$Date,proj1$Time)
proj1$DT <- strptime(proj1$DT,"%d/%m/%Y %H:%M:%S")
# Convert Date field from factor to date
proj1$Date <- as.Date(proj1$Date, format="%d/%m/%Y")
# Subset the file for only the two dates in question
proj1tmp <- subset(proj1, proj1$Date >= "2007-02-01" & proj1$Date <= "2007-02-02")
# Convert factor variables to numeric
proj1tmp$Global_active_power <- as.numeric(as.character(proj1tmp$Global_active_power))
proj1tmp$Sub_metering_1 <- as.numeric(as.character(proj1tmp$Sub_metering_1))
proj1tmp$Sub_metering_2 <- as.numeric(as.character(proj1tmp$Sub_metering_2))
proj1tmp$Sub_metering_3 <- as.numeric(as.character(proj1tmp$Sub_metering_3))
proj1tmp$Global_intensity <- as.numeric(as.character(proj1tmp$Global_intensity))
proj1tmp$Global_active_power <- as.numeric(as.character(proj1tmp$Global_active_power))
proj1tmp$Global_reactive_power <- as.numeric(as.character(proj1tmp$Global_reactive_power))
proj1tmp$Voltage <- as.numeric(as.character(proj1tmp$Voltage))
# Open png device, create required chart, close device
png("plot2.png",width=480,height=480)
plot(x=proj1tmp$DT,y=proj1tmp$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()