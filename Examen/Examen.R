# Enilton Mauricio Avendaño Amaya
# 2022601
# 30/05/2024

# Datos

data(InsectSprays)
head(InsectSprays)

summary(InsectSprays)

boxplot(InsectSprays$count ~ InsectSprays$spray, 
        col="orange",ylab = "Nématodos encontrados",
        xlab = "Tipo de insecticida")

# Desviación estandar

tapply(InsectSprays$count, InsectSprays$spray, sd)
bartlett.test(InsectSprays$count, InsectSprays$spray)

#ANOVA

ins.aov <- aov(InsectSprays$count  ~ InsectSprays$spray)
summary(ins.aov)

TukeyHSD(ins.aov)
