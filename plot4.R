#download and unzip file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="household_power_consumption.zip", method="curl")
unzip ("household_power_consumption.zip", exdir = "./")

# Read data table from file
df = read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
dat <- df[df$Date == "1/2/2007" | df$Date == "2/2/2007",]
rm(df)

# convert the Date into POSIXct
dat$Date <- strptime(dat$Date, "%e/%m/%Y")
dateTime <- paste(dat$Date, dat$Time)
dat$DateTime <- as.POSIXct(dateTime)

# plot graphs 
par(mfrow = c(2,2))

# plot 1
plot(dat$Global_active_power ~ dat$DateTime, 
     type="l", 
     ylab="Global Active Power", 
     xlab="")

# plot 2
plot(dat$Voltage ~ dat$DateTime, 
     type="l", 
     ylab="Voltage", 
     xlab="datetime")

# plot 3
plot(dat$Sub_metering_1 ~ dat$DateTime, 
     type = "l",  
     col = "Black",
     ylab = "Energy sub metering",
     xlab = "")
lines(dat$Sub_metering_2 ~ dat$DateTime, col = "Red")
lines(dat$Sub_metering_3 ~ dat$DateTime, col = "Blue")
legend("topright", lty = 1, lwd = 1, box.lwd = 0,
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col = c("Black", "Red", "Blue"))

# plot4
plot(dat$Global_reactive_power ~ dat$DateTime, 
     type="l", 
     ylab="Global_reactive_power", 
     xlab="datetime")

# save the graph into PNG 480 x 480
dev.copy(png, file = "plot3.png", width=480, height=480)
dev.off()

