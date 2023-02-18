
x <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(x) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
y <- subset(x,x$Date=="1/2/2007" | x$Date =="2/2/2007")


y$Date <- as.Date(y$Date, format="%d/%m/%Y")
y$Time <- strptime(y$Time, format="%H:%M:%S")
y[1:1440,"Time"] <- format(y[1:1440,"Time"],"2007-02-01 %H:%M:%S")
y[1441:2880,"Time"] <- format(y[1441:2880,"Time"],"2007-02-02 %H:%M:%S")



par(mfrow=c(2,2))

# calling the basic plot function that calls different plot functions to build the 4 plots that form the graph
with(y,{
  plot(y$Time,as.numeric(as.character(y$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
  plot(y$Time,as.numeric(as.character(y$Voltage)), type="l",xlab="datetime",ylab="Voltage")
  plot(y$Time,y$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  with(y,lines(Time,as.numeric(as.character(Sub_metering_1))))
  with(y,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
  with(y,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
  legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
  plot(y$Time,as.numeric(as.character(y$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})