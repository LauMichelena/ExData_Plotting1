plot2<- function () {
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
  png(file="plot2.png")
  plot(use[,10], use[,3], type="l", xlab="", ylab="Global Active Power (kilowatts)")
  #close device
  dev.off()
}