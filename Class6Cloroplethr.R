install.packages("choroplethr")
library(choroplethr)

library('acs')

api.key.install('b0269f0605e47be68c0606feb84916d0f2fa8cad')
ACS <- get_acs_data("B08101", "county",column_idx = 41)
Transportation <- as.data.frame(ACS)
Transportation1 <- Transportation[c(1,2)]
mean_bike = mean(Transportation1$df.region)
print(mean_bike) #30390.41

names(Transportation1)[1] = "id"
names(Transportation1)[2] = "rate"

write.table(Transportation1, file='Bike_Use.tsv', quote=FALSE, sep='\t', row.names = FALSE)

