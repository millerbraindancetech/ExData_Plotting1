#Downloading and unzipping the data into CourseProject1 directory
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,"./CourseProject1/hpc.zip")
unzip("./CourseProject1/hpc.zip", exdir = "./CourseProject1")

#Read Data in hpc_gile for 1/2/2007 and 2/2/2007 by looking at raw text file
#and skipping lines with earlier dates and only reading rows that contain correct
#date
#note: data.table package required to execute
hpc_file <- "./COurseProject1/household_power_consumption.txt"
df2 <- fread(hpc_file, skip = "1/2/2007", header = F, nrows = 2880)
setnames(df2, names(df2), names(fread(hpc_file, header = T, nrows = 1)))

#Convert Date (character) attributes to Date using as.Date
df2$Date <- as.Date(df2$Date, "%d/%m/%Y")

#concatenate Date and Time Attributes into POSIX called DateTime using
#strptime()
DateTime <- strptime(paste(df2$Date, df2$Time), format = "%Y-%m-%d %H:%M:%S")

#create line graph of Sub metering 1-3 variables for Thursday and Friday
#and save as plot3.png
plot(DateTime, df2$Sub_metering_1, type = "l", ylab = "Energy sub metering", 
     xlab="")
points(DateTime, df2$Sub_metering_3, type = "l", col = "blue")
points(DateTime, df2$Sub_metering_2, type = "l", col = "red")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = "solid", 
       col = c("black", "red", "blue"),
       cex = 0.75)
dev.copy(png, file = "./CourseProject1/plot3.png")
dev.off()

