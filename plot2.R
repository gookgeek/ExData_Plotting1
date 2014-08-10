  # read in first 69517 rows of data, which includes two days of interest
  data <- read.table("household_power_consumption.txt",
                     sep=";",
                     header=TRUE,
                     nrow=69517)

  # subset data for two days of interest
  data <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]

  # change date and time format
  data$Time <- strptime(paste(data$Date, data$Time),
                        format="%d/%m/%Y %H:%M:%S")

  # coerce data to correct class
  data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
  data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))
  data$Voltage <- as.numeric(as.character(data$Voltage))
  data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
  data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
  data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))

  # PLOT #2
  png(file="plot2.png")
  
  par(mfrow=c(1,1))
  plot(data$Time, data$Global_active_power,
       type="l",
       xlab="Date/Time",
       ylab="Global Active Power (in kW)",
       main="Global Active Power (for February 1 and 2, 2007)")
  
  dev.off()