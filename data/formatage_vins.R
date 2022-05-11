data <- read.table("data/vins.txt", header = TRUE, row.names = 1)
data <- data[1:6,]
write.csv(data, "data/5vins.csv")
data_cent <- as.data.frame(scale(data))
write.csv(data, "data/5vins_scale.csv")

