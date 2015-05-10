# This assignment uses data from the UC Irvine Machine Learning Repository, 
# a popular repository for machine learning datasets. 
# In particular, we will be using the ???Individual household electric power consumption Data Set??? 

library(sqldf)

# Subset the data by date for easier read
statement = 'SELECT * from file where Date = "1/2/2007" or Date = "2/2/2007"'
DATA <- read.csv.sql("../household_power_consumption.txt", sql = statement, header = TRUE, sep = ";")

# Split date and time
DATA <- within(DATA, Date <- as.Date(Date,"%d/%m/%Y"))
DATA <- within(DATA, DateTime <- paste(Date,Time, sep = " "))

#Change formats to for easier usage
DATA <- within(DATA, Global_active_power <- as.numeric(Global_active_power))
DATA <- within(DATA, Global_reactive_power <- as.numeric(Global_reactive_power))
DATA <- within(DATA, Global_intensity <- as.numeric(Global_intensity))
DATA <- within(DATA, Sub_metering_1 <- as.numeric(Sub_metering_1))
DATA <- within(DATA, Sub_metering_2 <- as.numeric(Sub_metering_2))
DATA <- within(DATA, Sub_metering_3 <- as.numeric(Sub_metering_3))
DATA <- within(DATA, Voltage <- as.numeric(Voltage))

#Plots
hist(DATA$Global_active_power, 
     xlab= "Global Active Power (kilowats)", 
     main = "Global Active Power",
     col = "red")

#Save Plot File
dev.copy(png,'plot1.png')
dev.off()
