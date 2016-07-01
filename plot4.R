plot4 = function()
    {
setwd("C:\\Users\\Stephen\\Dropbox\\Coursera\\Exploritory Data Analysis\\Week 1")
colNames = colnames(read.table("./household_power_consumption.txt", nrow = 1,
                               header = TRUE, sep = ";"))
hpc=read.table("./household_power_consumption.txt",
               skip = 66637, nrow = 2880,
               header = FALSE, sep = ";", na.strings = "?",
               col.names = colNames)
DateAndTime <- with(hpc, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))
temp = subset(hpc,select= -Time)
temp = subset(temp,select=-Date)
OrgHPC = cbind(DateAndTime,temp)
png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow=c(2,2))
plot(OrgHPC$DateAndTime,OrgHPC$Global_active_power, type = 'l', xlab = '',
     ylab = 'Global Active Power (killowatts)')
plot(OrgHPC$DateAndTime,OrgHPC$Voltage, type = 'l', xlab = 'datetime',
     ylab = 'Voltage')
plot(OrgHPC$DateAndTime,OrgHPC$Sub_metering_1, type = 'l', xlab = '',
     ylab = 'Energy sub metering')
lines(OrgHPC$DateAndTime,OrgHPC$Sub_metering_2, type = 'l', col = 'red')
lines(OrgHPC$DateAndTime,OrgHPC$Sub_metering_3, type = 'l', col = 'blue')
legend(x = "topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       bty = "n", lty=c(1,1),col=c("black","blue","red"))
plot(OrgHPC$DateAndTime,OrgHPC$Global_reactive_power, type = 'l', xlab = 'datetime',
     ylab = 'Global_reactive_power')
dev.off()
}