x<-read.table("household_power_consumption.txt",header=TRUE, nrows=2000, sep=";")
classes<-sapply(x,class)
tabAll<-read.table("household_power_consumption.txt",header=TRUE, colClasses=classes,sep=";",na.strings="?")
x2<-subset(tabAll,tabAll[['Date']]=="1/2/2007" | tabAll[['Date']]=="2/2/2007")

x2<-within(x2,me<-paste(x2$Date,x2$Time,sep=" "))
x2<-within(x2,datetime<-as.POSIXlt(me,format="%d/%m/%Y %H:%M:%S"))


## Plot 1
par(mfrow=c(1,1))
mygap <- (x2["Global_active_power"])
with(mygap, hist(Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)"))
