spicy.lm <- lm(Spicy~Product+Panelist+Session+Product:Panelist+Product:Session+Panelist:Session,data=experts)
anova(spicy.lm)