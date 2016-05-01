plot1<- function(){
  #Reading the data from de Working Directory
  dat<-read.table ("household_power_consumption.txt", header=TRUE, na.strings= "?", sep= ";")
  #Select the correct dates and drop unnecessary levels
  use<-subset(dat, dat$Date=="1/2/2007" | dat$Date== "2/2/2007")
  use$Date<- factor(use$Date)
  #Open the Graphic Devie
  png(file="plot1.png")
  #Build the graph
  hist(use$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
  #close the graphic device
  dev.off()
}
