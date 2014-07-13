source("./ExtractSubset.R")

# This is where the output png files are generated.
if(!file.exists("./output"))
  dir.create("./output")

subsetfile <- "./subset.csv"

if(!file.exists(subsetfile))
  ExtractSubset()

dataset <- read.csv(subsetfile, header=TRUE)
dataset[,10] = as.POSIXct(dataset[, 10])
png(filename="./output/plot4.png", width=480, height=480)

par(mfrow=c(2,2))
plot(dataset$DateTime, dataset$Global_active_power, type="l", 
     xlab="",
     ylab="Global Active Power (kilowatts)")

plot(dataset$DateTime, dataset$Voltage, type="l", 
     xlab="datetime",
     ylab="Voltage")

plot(dataset$DateTime, dataset$Sub_metering_1, type="n", xlab = "", ylab = "Engery sub metering")
lines(dataset$DateTime, dataset$Sub_metering_1, type="l", col="black")
lines(dataset$DateTime, dataset$Sub_metering_2, type="l", col="red")
lines(dataset$DateTime, dataset$Sub_metering_3, type="l", col="blue")
legend(x="topright", 
       legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=c(1), lwd=2)

plot(dataset$DateTime, dataset$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
