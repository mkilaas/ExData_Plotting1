#load datasets
hpc <- read.table(file = "household_power_consumption.txt",sep=";",skip=66637,nrows=2880) 
df<-read.table(file = "household_power_consumption.txt",sep=";",nrows=10,header=TRUE)

#change column headers
names(hpc)<-names(df)
str(hpc)

#convert to dates
y<-paste(hpc$Date,hpc$Time)
y<-strptime(y,"%d/%m/%Y %H:%M:%S")

#adjust margins
par(mar=c(4,4,2,2))

#plot graph
plot(y,hpc$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(y,hpc$Sub_metering_2,type="l",col="red")
lines(y,hpc$Sub_metering_3,type="l",col="blue")

#add legend
legend("topright",col=c("black","red","blue"),legend=(names(hpc[,7:9])),lty=1,cex=0.4)

#save
dev.copy(png,filename="plot3.png")
dev.off ()