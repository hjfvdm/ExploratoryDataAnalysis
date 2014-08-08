## Data file downloaded from the course website
data=read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE)

## Reformate date 
dateFn=function(x,y) {paste(x,y,sep=" ")}
data$Date_Time1=mapply(dateFn,data$Date,data$Time)
data$Date_Time=strptime(data$Date_Time1,format="%d/%m/%Y %H:%M:%S")
data$Date=strptime(data$Date, format="%d/%m/%Y")

## Reformat other columns
data$Global_active_power=as.numeric(data$Global_active_power)
data$Global_intensity=as.numeric(data$Global_intensity)
data$Global_reactive_power=as.numeric(data$Global_reactive_power)
data$Sub_metering_1=as.numeric(data$Sub_metering_1)
data$Sub_metering_2=as.numeric(data$Sub_metering_2)
data$Sub_metering_3=as.numeric(data$Sub_metering_3)
data$Voltage=as.numeric(data$Voltage)

## Subset data
data=subset(data,data$Date>as.POSIXlt("2007-01-31") & data$Date<as.POSIXlt("2007-02-03"))

## Plot
png(file="plot4.png",width=480,height=480)
par(mfrow=c(2,2))
plot(data$Date_Time,data$Global_active_power, type="l", xlab="",ylab="Global Active Power")
plot(data$Date_Time,data$Voltage, type="l", xlab="datetime",ylab="Voltage")
plot(data$Date_Time,data$Sub_metering_1, type="l", xlab="",ylab="Energy sub metering")
plot(data$Date_Time,data$Global_reactive_power, type="l", xlab="datetime",ylab="Global_reactive_power")

legend("topright",lty=1,col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
lines(data$Date_Time,data$Sub_metering_3,col="blue")
lines(data$Date_Time,data$Sub_metering_2,col="red")

## Close connection
dev.off()