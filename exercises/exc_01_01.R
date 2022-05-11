experts <- read.table("data/SensoQDA_cocktail.csv", header = TRUE, sep = ";", dec=".", quote = "\"")
experts$Seance <- as.factor(experts$Seance)
experts$Rang <- as.factor(experts$Rang)
experts$Produit <- as.factor(experts$Produit)
