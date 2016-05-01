plot3<- function () {
  #Set system in english so the labels are in english
  Sys.setlocale("LC_TIME", "English")
  #Read table
  table<- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings= "?")
  #Choose only the appropiate dates
  use<- subset(table, table$Date=="1/2/2007" | table$Date== "2/2/2007")
  # paste and convert the Dates and times
  use$Date<-factor(use$Date)
  x<- paste(use$Date, use$Time)
  D_T<-strptime(x,"%d/%m/%Y %H:%M:%S")
  #create the table
  use<- cbind(use, D_T)
  #create the graphic
  png(file="plot3.png")
  plot(use[,10], use[,7],type="l", xlab="", ylab="Energy sub metering")
  lines(use[,10], use[,8], col="red")
  lines(use[,10], use[,9], col="blue")
  legend("topright", legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lwd=NULL)
  #close device
  dev.off()
}