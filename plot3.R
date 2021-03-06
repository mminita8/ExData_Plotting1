consumption<-read.table("household_power_consumption.txt", sep=";", header = T)
feb2_consumption<-subset(consumption, as.Date(Date, format="%d/%m/%Y")>=as.Date("01/02/2007", format="%d/%m/%Y") & as.Date(Date, format="%d/%m/%Y")<=as.Date("02/02/2007", format="%d/%m/%Y"))
feb2_consumption$TotalDate<-paste(feb2_consumption$Date, feb2_consumption$Time, sep=" ")
feb2_consumption$TotalDate <- dmy_hms(as.character(feb2_consumption$TotalDate))
png(filename = "plot3.png")
plot(feb2_consumption$TotalDate, feb2_consumption$Sub_metering_1, type = "l", pch = 19, xlab=" ", ylab = "Energy sub metering")
lines(feb2_consumption$TotalDate, feb2_consumption$Sub_metering_2, pch = 18, col = "red")
lines(feb2_consumption$TotalDate, feb2_consumption$Sub_metering_3, pch = 18, col = "blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1:1, cex=0.6)
dev.off()
