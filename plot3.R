Sys.setlocale("LC_TIME", "English")
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
dev.copy(png,file="plot3.png", width=480, height=480)
plot(dh$timestamp,dh$Sub_metering_1, type="l", xlab="", ylab="Energy 
sub metering")
lines(dh$timestamp,dh$Sub_metering_2,col="red")
lines(dh$timestamp,dh$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),lty=c(1,1), lwd=c(1,1))
dev.off()