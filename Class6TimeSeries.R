bike_theft = read.csv("BikeTheftLog.csv")

bike_theft$LOCATION <- as.character(bike_theft$LOCATION)

for (n in 1:210){
  if(grepl("Swig", bike_theft$LOCATION[n])){
    bike_theft$LOCATION[n] <- "Swig"
  }else if(grepl("Dunne", bike_theft$LOCATION[n])){
    bike_theft$LOCATION[n] <- "Dunne"
  }else if(grepl("Graham", bike_theft$LOCATION[n])){
    bike_theft$LOCATION[n] <- "Graham"
  }else if(grepl("Campisi", bike_theft$LOCATION[n])){
    bike_theft$LOCATION[n] <- "Campisi"
  }else if(grepl("Casa", bike_theft$LOCATION[n])){
    bike_theft$LOCATION[n] <- "Casa"
  }else if(grepl("Walsh", bike_theft$LOCATION[n])){
    bike_theft$LOCATION[n] <- "Walsh"
  }else if(grepl("McLaughlin", bike_theft$LOCATION[n])){
    bike_theft$LOCATION[n] <- "McLaughlin"
  }else if(grepl("Nobili", bike_theft$LOCATION[n])){
    bike_theft$LOCATION[n] <- "Nobili"
  }else if(grepl("Sanfilippo", bike_theft$LOCATION[n])){
    bike_theft$LOCATION[n] <- "Sanfilippo"
  }else if(grepl("Sobrato", bike_theft$LOCATION[n])){
    bike_theft$LOCATION[n] <- "Sobrato"
  }else if(grepl("Villas", bike_theft$LOCATION[n])){
    bike_theft$LOCATION[n] <- "Villas"
  }else{
    bike_theft$LOCATION[n] <- "Other"
  }
}


library(lubridate)

Date <- format(mdy(bike_theft$DATE), format="%Y-%m")

Location <- bike_theft$LOCATION
Bike_Theft <- data.frame(Date, Location)
Bike_Theft <- na.omit(Dates)


table(Bike_Theft)

Bike_Theft$Count = 1
Bike_Freq = aggregate(Bike_Theft$Count, by = list(Bike_Theft$Location, Bike_Theft$Date), sum)

install.packages("reshape2")
library(reshape2)
Bike_Theft2 <- dcast(data = Bike_Freq, Group.1~Group.2, margins = TRUE)
Bike_Theft3 <- Bike_Theft2[(1:12), (1:52)]

names(Bike_Theft3)[1] = "name"

write.table(Bike_Theft3, file='Bike_Theft.tsv', quote=FALSE, sep='\t', row.names = FALSE)

