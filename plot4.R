#load datasets
hpc <- read.table(file = "household_power_consumption.txt",sep=";",skip=66637,nrows=2880) 
df<-read.table(file = "household_power_consumption.txt",sep=";",nrows=10,header=TRUE)

#change column headers
names(hpc)<-names(df)
str(hpc)

#convert to dates
y<-paste(hpc$Date,hpc$Time)
y<-strptime(y,"%d/%m/%Y %H:%M:%S")

#change plotting layout
par(mfrow=c(2,2))
par(mar=c(4,4,2,2))
#plot graphs on one page

plot(y,hpc$Global_active_power,type="l",,ylab="Global Active Power",xlab="")

plot(y,hpc$Voltage,type="l",ylab="Voltage",xlab="datetime")


plot(y,hpc$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(y,hpc$Sub_metering_2,type="l",col="red")
lines(y,hpc$Sub_metering_3,type="l",col="blue")
legend("topright",col=c("black","red","blue"),legend=(names(hpc[,7:9])),lty=1,cex=0.4)

plot(y,hpc$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")

#save
dev.copy(png,filename="plot4.png")
dev.off ()