## First, Import the household_power_cosumption.txt file                                                ## Saved it in the master folder
###then,

data <- read.table(df, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")                           ## Data
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]                                           ## Data between the two days
globalActivePower <- as.numeric(subSetData$Global_active_power)                                         ## Data that you're going to use for the histogram
subMetering1 <- as.numeric(subSetData$Sub_metering_1)                                                   ## SubMetering1
subMetering2 <- as.numeric(subSetData$Sub_metering_2)                                                   ## SubMetering2
subMetering3 <- as.numeric(subSetData$Sub_metering_3)                                                   ## SubMetering3

png("plot3.png", width=480, height=480)                                                                 ## PNG Image 480 pixels x 480 pixels
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")                              ## Plot + Line 1
lines(datetime, subMetering2, type="l", col="red")                                                      ## Line 2
lines(datetime, subMetering3, type="l", col="blue")                                                     ## Line 3
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))    ## Legend
dev.off()                                                                                               ## End
