## Read data into R using data.table package

df <- fread("household_power_consumption.txt",na.strings = "?")

## Subset data for two dates "2007-02-01" and "2007-02-02"

sub <- subset(df, df$Date == "1/2/2007" | df$Date == "2/2/2007")

## Combine Date/Time into $Date column, then convert to POSIXct

sub$Date <- as.POSIXct(paste0(sub$Date," ",sub$Time),format="%d/%m/%Y %H:%M:%S")

##Launch PNG graphics device

png(filename = "plot4.png", width = 480, height = 480)

##Construct Plot 4

##Change global paramters to populate 2 X 2 plot matrix
par(mfrow = c(2,2))

##Create plot 1 of 4 (plot2)

with(sub,plot(sub$Date,sub$Global_active_power,
              type="l",
              xlab="",
              ylab="Global Active Power (kilowatts)"))

##Create plot 2 of 4

with(sub,plot(sub$Date,sub$Voltage,
              type="l",
              xlab="datetime",
              ylab="Voltage"))

##Create plot 3 of 4 (plot 3 - note that box around legend removed here)

with(sub,plot(sub$Date,sub$Sub_metering_1,
              type="n",
              xlab="",
              ylab="Energy sub metering"))

points(sub$Date,sub$Sub_metering_1,type="l",col="black")
points(sub$Date,sub$Sub_metering_2,type="l",col="red")
points(sub$Date,sub$Sub_metering_3,type="l",col="blue")

legend("topright",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1),
       col=c("black","red","blue"),
       bty="n")

##Create plot 4 of 4

with(sub,plot(sub$Date,sub$Global_reactive_power,
              type="l",
              xlab="datetime"))

##Turn off PNG graphics device

dev.off()