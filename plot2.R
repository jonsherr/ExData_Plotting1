## Read data into R using data.table package

df <- fread("household_power_consumption.txt",na.strings = "?")

## Subset data for two dates "2007-02-01" and "2007-02-02"

sub <- subset(df, df$Date == "1/2/2007" | df$Date == "2/2/2007")

## Combine Date/Time into $Date column, then convert to POSIXct

sub$Date <- as.POSIXct(paste0(sub$Date," ",sub$Time),format="%d/%m/%Y %H:%M:%S")

##Launch PNG graphics device

png(filename = "plot2.png", width = 480, height = 480)

##Construct Plot 2

with(sub,plot(sub$Date,sub$Global_active_power,
              type="l",
              xlab="",
              ylab="Global Active Power (kilowatts)"))

##Turn off PNG graphics device

dev.off()