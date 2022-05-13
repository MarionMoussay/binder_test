experts <- read.table("data/perfumes_qda_experts.csv", header = TRUE, sep = ",", dec=".", quote = "\"")
experts$Session <- as.factor(experts$Session)
experts$Rank <- as.factor(experts$Rank)
experts$Product <- as.factor(experts$Product)
