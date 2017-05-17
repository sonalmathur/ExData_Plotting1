data1<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE)
data1$Global_active_power<-as.numeric(data1$Global_active_power)
subsetData1 <- data1[data1$Date %in% c("1/2/2007","2/2/2007") ,] 
png("plot1.png",width=480,height = 480)
hist(subsetData1$Global_active_power, 
     col="red",
     xlab="Global Active Power(kilowatts)", 
     main="Global Active Power")
dev.off()