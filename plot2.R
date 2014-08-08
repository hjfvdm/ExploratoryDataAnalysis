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
png(file="plot2.png",width=480,height=480)
plot(data$Date_Time,data$Global_active_power, type="l", xlab="",ylab="Global Active Power (kilowatts)")

## Close connection
dev.off()
