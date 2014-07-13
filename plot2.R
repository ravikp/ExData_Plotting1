source("./ExtractSubset.R")

# This is where the output png files are generated.
if(!file.exists("./output"))
  dir.create("./output")

subsetfile <- "./subset.csv"

if(!file.exists(subsetfile))
  ExtractSubset()

dataset <- read.csv(subsetfile, header=TRUE)
png(filename="./output/plot2.png", width=480, height=480)
plot(as.POSIXlt(dataset$DateTime), dataset$Global_reactive_power, type="l", 
     xlab="",
     ylab="Global Active Power (kilowatts)")
dev.off()