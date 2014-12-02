#Read data
data <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

#Convert Date and Time
data$Date<-as.Date(data$Date, format="%d/%m/%Y")
clean <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
datetime <- paste(as.Date(clean$Date), clean$Time)
clean$Datetime <- as.POSIXct(datetime)

#Plot the graph
plot(clean$Global_active_power~clean$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

#Save the file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()