#download and unzip file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="household_power_consumption.zip", method="curl")
unzip ("household_power_consumption.zip", exdir = "./")

# Read data table from file
df = read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
dat <- df[df$Date == "1/2/2007" | df$Date == "2/2/2007",]
rm(df)

# plot graph
hist(dat$Global_active_power, 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     col = "red")

# save the graph into PNG 480 x 480
dev.copy(png, file = "plot1.png")
dev.off()
