data1<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE)
subsetData1 <- data1[data1$Date %in% c("1/2/2007","2/2/2007") ,] 
subsetData1$Time <- strptime(paste(subsetData1$Date, subsetData1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
subsetData1$Sub_metering_1<-as.numeric(subsetData1$Sub_metering_1)
subsetData1$Sub_metering_2<-as.numeric(subsetData1$Sub_metering_2)
subsetData1$Sub_metering_3<-as.numeric(subsetData1$Sub_metering_3)

png("plot3.png",width=480,height = 480)
plot(subsetData1$Time, subsetData1$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(subsetData1$Time,subsetData1$Sub_metering_2,col="red")
lines(subsetData1$Time,subsetData1$Sub_metering_3,col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()