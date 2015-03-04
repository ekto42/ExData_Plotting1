#get data as characters
data <- read.csv2("household_power_consumption.txt",dec=".",colClasses=rep("character",9))

#keep only the dates we are interested in to reduce the size of data
data_r <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

#change column type to numeric and POSIXlt
for (i in 3:9){
        data_r[,i] <- as.numeric(data_r[,i])
}
data_r$DateTime <- as.POSIXct(paste(data_r$Date, data_r$Time), format="%d/%m/%Y %H:%M:%S")

#get rid of now useless columns
data_r <- data_r[,c(10,3,4,5,6,7,8,9)]

#create the plot and store it in a png file
png(filename = "plot1.png",width = 480, height = 480)
hist(Global_active_power,col="red",xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power")
dev.off()
