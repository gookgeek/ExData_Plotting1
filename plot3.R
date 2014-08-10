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
  
  # PLOT #3
  png(file="plot3.png")
  
  par(mfrow=c(1,1))
  plot(data$Time, data$Sub_metering_1,
       type="l",
       col="green",
       xlab="Date/Time",
       ylab="Energy Sub Metering",
       main="Energy Sub Metering over Two-Day Period")
  lines(data$Time, data$Sub_metering_2, col="blue")
  lines(data$Time, data$Sub_metering_3, col="red")
  legend("topright",
         lty=c("solid", "solid", "solid"),
         col=c("green", "blue", "red"), 
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  dev.off()