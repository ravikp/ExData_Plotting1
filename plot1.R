source("./ExtractSubset.R")

# This is where the output png files are generated.
if(!file.exists("./output"))
  dir.create("./output")

subsetfile <- "./subset.csv"

if(!file.exists(subsetfile))
  ExtractSubset()

dataset <- read.csv(subsetfile, header=TRUE)

png(filename="./output/plot1.png", width=480, height=480)

hist(dataset$Global_active_power, col="Red", 
     main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()
