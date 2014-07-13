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

#create histogram of global active power and save as plot1.png
hist(df2$Global_active_power, 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", 
     col = "red")
dev.copy(png, file = "./CourseProject1/plot1.png")
dev.off()

