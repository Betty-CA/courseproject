# Initial data
#initial <- read.table("household_power_consumption.txt",nrows=10,sep=";",header=TRUE)
#classes <- sapply(initial, class)

#read all table
#tabAll <- read.table("household_power_consumption.txt",sep=";",header=TRUE,colClasses = classes)

# subset table as Date between 2007-2-1 to 2007-2-2
#tabSection <- subset(tabAll, as.Date(Date,"%d/%m/%Y") == as.Date('01/02/2007',"%d/%m/%Y") | as.Date(Date,"%d/%m/%Y") == as.Date('02/02/2007',"%d/%m/%Y") )

# save subsetting to a file
#write.table(tabSection,"household_power_consumption-20070201-02.txt",row.name = FALSE)

# read data from subsetting file
newtab<-read.table("household_power_consumption-20070201-02.txt",header=TRUE)

# Transfer column Date and Time to Date/Time class
transtab <-transform(newtab, Date = as.Date(Date,"%d/%m/%Y"), Time = strptime( paste(Date,Time), "%d/%m/%Y %H:%M:%S"))

# plot2
png(filename="plot2.png")
plot(transtab$Time,transtab$Global_active_power,type="l",xlab="", ylab="Global Active Power (kilowatts) ")
dev.off()
