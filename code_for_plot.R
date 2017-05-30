#Download and unzip the data
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="./data.zip")
unzip("./data.zip")
data<-"./household_power_consumption.txt"
data <- read.table(data, header=T, sep=";", na.strings="?")
# set time variable
plot_data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
time <-strptime(paste(plot_data$Date, plot_data$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
plot_data <- cbind(time, plot_data)

#
#Plot 1
png(filename = "plot1.png",width = 480, height = 480)
hist(plot_data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

#Plot 2
png(filename = "plot2.png",width = 480, height = 480)
plot(plot_data$time, plot_data$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
#Plot 3
png(filename = "plot3.png",width = 480, height = 480)
colours <- c("black", "red", "blue")
legend_labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(plot_data$time, plot_data$Sub_metering_1, type="l", col=colours[1], xlab="", ylab="Energy sub metering")
lines(plot_data$time, plot_data$Sub_metering_2, col=colours[2])
lines(plot_data$time, plot_data$Sub_metering_3, col=colours[3])
legend("topright", legend=legend_labels, col=colours, lty="solid")
dev.off()

#Plot 4
png(filename = "plot4.png",width = 480, height = 480)
legend_labels <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
colours <- c("black","red","blue")
par(mfrow=c(2,2))
plot(plot_data$time, plot_data$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power")
plot(plot_data$time, plot_data$Voltage, type="l", col="black", xlab="datetime", ylab="Voltage")
plot(plot_data$time, plot_data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(plot_data$time, plot_data$Sub_metering_2, type="l", col=colours[2])
lines(plot_data$time, plot_data$Sub_metering_3, type="l", col=colours[3])
legend("topright", bty="n", legend=legend_labels, lty=1, col=colours)
plot(plot_data$time, plot_data$Global_reactive_power, type="l", col="black", xlab="datetime", ylab="Global_reactive_power")
dev.off()