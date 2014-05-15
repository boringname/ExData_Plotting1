x<-read.table("household_power_consumption.txt",header=TRUE, nrows=2000, sep=";")
classes<-sapply(x,class)
tabAll<-read.table("household_power_consumption.txt",header=TRUE, colClasses=classes,sep=";",na.strings="?")
x2<-subset(tabAll,tabAll[['Date']]=="1/2/2007" | tabAll[['Date']]=="2/2/2007")

x2<-within(x2,me<-paste(x2$Date,x2$Time,sep=" "))
x2<-within(x2,datetime<-as.POSIXlt(me,format="%d/%m/%Y %H:%M:%S"))

## Plot 3, same as Plot 2, but colored by factors of submetering var
with(x2,plot(x2$datetime, x2$Sub_metering_1, type = "n", ylab="Energy sub metering",xlab="", ylim = c(0,40)))
with(x2,lines(x2$datetime, x2$Sub_metering_1,col="black"))
with(x2,lines(x2$datetime, x2$Sub_metering_2,col="red"))
with(x2,lines(x2$datetime, x2$Sub_metering_3,col="blue"))
legend("topright", lty=c(1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
