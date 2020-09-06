## First, Import the household_power_cosumption.txt file                                                ## Saved it in the master folder
###then,

data <- read.table(df, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")                           ## Data
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]                                           ## Data between the two days

globalActivePower <- as.numeric(subSetData$Global_active_power)                                         ## Data that you're going to use for the plot
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
voltage <- as.numeric(subSetData$Voltage)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

png("plot4.png", width=480, height=480)                                                                 ## PNG Image 480 pixels x 480 pixels
par(mfrow = c(2, 2)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)               ## Plot
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")                              ## SubMetering1
lines(datetime, subMetering2, type="l", col="red")                                                      ## SubMetering2
lines(datetime, subMetering3, type="l", col="blue")                                                     ## SubMetering3
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")    ## Legend
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()                                                                                               ## End
