
  
  library(data.table)
  library(tidyverse)
  library(chron)
  
  data <- fread("household_power_consumption.txt")
  data <- as_tibble(data)
  
  data$Date <- as.Date(data$Date, "%d/%m/%Y")
  
  data2 <- filter(data, Date == "2007-02-01" | Date == "2007-02-02")
  
  data2$Time <- chron(times = data2$Time)
  data2$Global_active_power <- as.numeric(data2$Global_active_power)
  data2 <- mutate(data2, datetime = as.POSIXct(paste(data2$Date, data2$Time), format="%Y-%m-%d %H:%M:%S"))
  
  png(file = "plot2.png")
  
  
  plot(data2$datetime, data2$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
  
  
  dev.off()                     
 
    

