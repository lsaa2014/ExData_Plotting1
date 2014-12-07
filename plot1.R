h <- read.table("household_power_consumption.txt", header=T, sep=";")
str(h)
h$Date <- as.Date(h$Date, format="%d/%m/%Y")
dh <- h[(h$Date == "2007-02-01") | (h$Date == "2007-02-02"),]
dh$Global_active_power <- as.numeric(as.character(dh$Global_active_power))
dh$Global_reactive_power <- as.numeric(as.character(dh$Global_reactive_power))
dh$Voltage <- as.numeric(as.character(dh$Voltage))
dh$Sub_metering_1 <- as.numeric(as.character(dh$Sub_metering_1))
dh$Sub_metering_2 <- as.numeric(as.character(dh$Sub_metering_2))
dh <- transform(dh, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y 
%H:%M:%S")
dev.copy(png,file="plot1.png", width=480, height=480)
hist(dh$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()