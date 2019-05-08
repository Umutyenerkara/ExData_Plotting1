
  
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
  
  
  png(file = "plot3.png")
  
  
  plot(data2$datetime, data2$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
  lines(data2$datetime, data2$Sub_metering_2, col = "red")
  lines(data2$datetime, data2$Sub_metering_3, col= "blue")
  legend("topright", lty=1, col = c("black","red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
  
  dev.off()                     
 
 


