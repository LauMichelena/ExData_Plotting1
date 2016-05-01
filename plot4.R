plot4<- function () {
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
  png(file="plot4.png")
  #Modify global parameters
  par(mfrow=c(2,2))
  #Graph1
  plot(use[,10], use[,3], type="l", xlab="", ylab="Global Active Power")
  #Graph2
  plot(use[,10], use[,5], type="l", xlab="datetime", ylab="Voltage")
  #Graph3
  plot(use[,10], use[,7],type="l", xlab="", ylab="Energy sub metering")
  lines(use[,10], use[,8], col="red")
  lines(use[,10], use[,9], col="blue")
  legend("topright", legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lwd=NULL, bty="n")
  #Graph4
  plot(use[,10], use[,4], type="l", xlab="datetime", ylab="Global_reactive_power")
  #close device
  dev.off()
}