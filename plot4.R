data1<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE)
subsetData1 <- data1[data1$Date %in% c("1/2/2007","2/2/2007") ,] 
subsetData1$Time <- strptime(paste(subsetData1$Date, subsetData1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
subsetData1$Sub_metering_1<-as.numeric(subsetData1$Sub_metering_1)
subsetData1$Sub_metering_2<-as.numeric(subsetData1$Sub_metering_2)
subsetData1$Sub_metering_3<-as.numeric(subsetData1$Sub_metering_3)
subsetData1$Global_active_power<-as.numeric(subsetData1$Global_active_power)
subsetData1$Voltage<-as.numeric(subsetData1$Voltage)
subsetData1$Global_reactive_power<-as.numeric(subsetData1$Global_reactive_power)

png("plot4.png",width=480,height = 480)
par(mfrow=c(2,2))

plot(subsetData1$Time, subsetData1$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

plot(subsetData1$Time, subsetData1$Voltage, type="l", xlab="", ylab="Voltage")

plot(subsetData1$Time, subsetData1$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(subsetData1$Time,subsetData1$Sub_metering_2,col="red")
lines(subsetData1$Time,subsetData1$Sub_metering_3,col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5,bty ="o" , col=c("black", "red", "blue"))

plot(subsetData1$Time, subsetData1$Global_reactive_power, type="l", xlab="", ylab="Global_Reactive_Power")

dev.off()