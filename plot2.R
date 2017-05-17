data1<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE)
data1$Global_active_power<-as.numeric(data1$Global_active_power)
subsetData1 <- data1[data1$Date %in% c("1/2/2007","2/2/2007") ,] 
subsetData1$Time <- strptime(paste(subsetData1$Date, subsetData1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("plot2.png",width=480,height = 480)
plot(subsetData1$Time, subsetData1$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()