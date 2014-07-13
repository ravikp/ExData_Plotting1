ExtractSubset <- function(dates = c("1/2/2007", "2/2/2007")){
  data_file <- "./household_power_consumption.txt"
  fields = c("character", "character", rep("numeric", 7))
  ds <- read.csv2(data_file, sep=";", header=TRUE, na.strings = c("?"))
  sample_ds <- ds[ds$Date %in% dates,]
  write.csv(sample_ds, "./subset.csv", row.names = FALSE)  
}

