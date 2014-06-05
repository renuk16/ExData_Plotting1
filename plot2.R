#Read sample set to determine class for each column stringsAsFactors = F sets date as character
sampledata <- read.table("household_power_consumption.txt", sep=";",nrows=10,header=TRUE,stringsAsFactors=FALSE)
classes <- sapply(sampledata,class)

#Read the full data with colCalsses option
fulldata <- read.table("household_power_consumption.txt", sep=";", header=TRUE, colClasses=classes, na.strings="?")

#convert date from character to date class
fulldata$Date <- as.Date(fulldata$Date, format="%d/%m/%Y")

#Subset data with dates = Feb 01 - 02, 2007, and convert time
febdata <- subset(fulldata, (fulldata$Date == "2007-02-01" | fulldata$Date == "2007-02-02"))
febdata$Time <- strptime(paste(febdata$Date, febdata$Time), format="%Y-%m-%d %H:%M:%S")

#Plot 
png("plot2.png")
plot(febdata$Time, febdata$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()