## Data file downloaded from the course website
data <- read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE)

## Reformate date and subset
data$Date=strptime(data$Date, format="%d/%m/%Y")
data=subset(data,data$Date>as.POSIXlt("2007-01-31") & data$Date<as.POSIXlt("2007-02-03"))

## Reformat other columns
data$Global_active_power=as.numeric(data$Global_active_power)
data$Global_intensity=as.numeric(data$Global_intensity)
data$Global_reactive_power=as.numeric(data$Global_reactive_power)
data$Sub_metering_1=as.numeric(data$Sub_metering_1)
data$Sub_metering_2=as.numeric(data$Sub_metering_2)
data$Sub_metering_3=as.numeric(data$Sub_metering_3)
data$Voltage=as.numeric(data$Voltage)

## Plot graph
png(file="plot1.png",width=480,height=480)
hist(data$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

## Close connection
dev.off()

