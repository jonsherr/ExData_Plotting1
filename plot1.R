## Read data into R using data.table package

df <- fread("household_power_consumption.txt",na.strings = "?")

## Subset data for two dates "2007-02-01" and "2007-02-02"

sub <- subset(df, df$Date == "1/2/2007" | df$Date == "2/2/2007")

##Launch PNG graphics device

png(filename = "plot1.png", width = 480, height = 480)

##Construct Plot 1

hist(sub$Global_active_power,
     col = "red1", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",
     ylim = c(0,1200))

##Switch off png graphics device
dev.off()