plot2 = function()
{
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
png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(OrgHPC$DateAndTime,OrgHPC$Global_active_power, type = 'l', xlab = '',
     ylab = 'Global Active Power (killowatts)')
dev.off()
}