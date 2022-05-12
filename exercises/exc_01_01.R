experts <- read.table("data/perfumes_qda_experts.csv", header = TRUE, sep = ";", dec=".", quote = "\"")
experts$Seance <- as.factor(experts$Seance)
experts$Rang <- as.factor(experts$Rang)
experts$Produit <- as.factor(experts$Produit)
