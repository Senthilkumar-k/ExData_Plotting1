#Read data
data <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

#Convert Date and Time
data$Date<-as.Date(data$Date, format="%d/%m/%Y")
clean <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
datetime <- paste(as.Date(clean$Date), clean$Time)
clean$Datetime <- as.POSIXct(datetime)

#Plot the Histogram
hist(clean$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

#Save the file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()