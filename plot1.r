

library(data.table)
library(tidyverse)
library(chron)

data <- fread("household_power_consumption.txt")
data <- as_tibble(data)

data$Date <- as.Date(data$Date, "%d/%m/%Y")

data2 <- filter(data, Date == "2007-02-01" | Date == "2007-02-02")

data2$Time <- chron(times = data2$Time)
data2$Global_active_power <- as.numeric(data2$Global_active_power)


png(file = "plot1.png")



hist(data2$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)",col = "red",border = "black")


dev.off()                     




