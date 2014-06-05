#Read sample set to determine class for each column stringsAsFactors = F sets date as character
sampledata <- read.table("household_power_consumption.txt", sep=";",nrows=10,header=TRUE,stringsAsFactors=FALSE)
classes <- sapply(sampledata,class)

#Read the full data with colCalsses option
fulldata <- read.table("household_power_consumption.txt", sep=";", header=TRUE, colClasses=classes, na.strings="?")

#convert date from character to date class
fulldata$Date <- as.Date(fulldata$Date, format="%d/%m/%Y")

#Subset data with dates = Feb 01 - 02, 2007
febdata <- subset(fulldata, (fulldata$Date == "2007-02-01" | fulldata$Date == "2007-02-02"))

#Plot 
png("plot1.png")
hist(febdata$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

