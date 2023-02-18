
x <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(x) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
y <- subset(x,x$Date=="1/2/2007" | x$Date =="2/2/2007")


y$Date <- as.Date(y$Date, format="%d/%m/%Y")
y$Time <- strptime(y$Time, format="%H:%M:%S")
y[1:1440,"Time"] <- format(y[1:1440,"Time"],"2007-02-01 %H:%M:%S")
y[1441:2880,"Time"] <- format(y[1441:2880,"Time"],"2007-02-02 %H:%M:%S")



plot(y$Time,y$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(y,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(y,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(y,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

title(main="Energy sub-metering")