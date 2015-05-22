#install necessary packages
install.packages("choroplethr")
library(choroplethr)
library('acs')

#input key for data
api.key.install('b0269f0605e47be68c0606feb84916d0f2fa8cad')

#get data
ACS <- get_acs_data("B08101", "county",column_idx = 41)

#create data frame of data and only keep necessary columns
Transportation <- as.data.frame(ACS)
Transportation1 <- Transportation[c(1,2)]

#find mean of bike use value
mean_bike = mean(Transportation1$df.value)
print(mean_bike) #782.055

#put into correct format
names(Transportation1)[1] = "id"
names(Transportation1)[2] = "rate"

#output data frame
write.table(Transportation1, file='Bike_Use.tsv', quote=FALSE, sep='\t', row.names = FALSE)

