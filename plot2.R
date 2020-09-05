## First, Import the household_power_cosumption.txt file                                                ## Saved it in the master folder
###then,

data <- read.table(df, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")                           ## Data
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]                                           ## Data between the two days

datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")                                        
globalActivePower <- as.numeric(subSetData$Global_active_power)                                         ## Data that you're going to use for the plot                        
png("plot2.png", width=480, height=480)                                                                 ## PNG Image 480 pixels x 480 pixels
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")            ## plot
dev.off()                                                                                               ## End
