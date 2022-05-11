citrus.lm <- lm(Citrus~Product+Panelist+Session+Product:Panelist+Product:Session+Panelist:Session,data=experts)
anova(citrus.lm)