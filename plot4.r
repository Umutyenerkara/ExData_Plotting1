 
  library(data.table)
  library(tidyverse)
  library(chron)
  
  data <- fread("household_power_consumption.txt")
  data <- as_tibble(data)
  
  data$Date <- as.Date(data$Date, "%d/%m/%Y")
  
  data2 <- filter(data, Date == "2007-02-01" | Date == "2007-02-02")
  
  data2$Time <- chron(times = data2$Time)
  data2[3:9] <- sapply(data2[3:9], as.numeric)
  
  data2 <- mutate(data2, datetime = as.POSIXct(paste(data2$Date, data2$Time), format="%Y-%m-%d %H:%M:%S"))
  
  
  png(file = "plot4.png")
  
  par(mfrow = c(2,2))
  
  plot(data2$datetime, data2$Global_active_power, xlab = "", ylab = "Global Active Power", type = "l")
  
  plot(data2$datetime, data2$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")
  
  plot(data2$datetime, data2$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
  lines(data2$datetime, data2$Sub_metering_2, col = "red")
  lines(data2$datetime, data2$Sub_metering_3, col= "blue")
  legend("topright", lty=1, col = c("black","red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
         bty = "n", cex = 0.80)
  
  plot(data2$datetime, data2$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")
    
  dev.off()                     
 
 


