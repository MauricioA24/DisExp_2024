# Enilton Mauricio Avendaño Amaya
# 20/05/2024
# 2022601

# Experimento ganancia en peso 

# Niveles de factor: 4 (die1, die2, die3, die4)

die1 <- c(2.4, 2.2, 3.4, 1.6)
die2 <- c(2.2, 1.9, 1.7, 2.1)
die3 <- c(3.3, 1.3, 2.8, 2.1)
die4 <- c(1.6, 2.5, 1.4, 2.4)

# Sumatoria de las dietas independientes de grupo/bloque
sum(die1); sum(die2); sum(die3); sum(die4)

# Para peso bajo sumar las ganancias de peso
sum(die1[1]+die2[1]+die3[1]+die4[1])
sum(die1[2]+die2[2]+die3[2]+die4[2])
sum(die1[3]+die2[3]+die3[3]+die4[3])
sum(die1[4]+die2[4]+die3[4]+die4[4])

GP <- c(die1, die2, die3, die4)

Trat <- gl(4, 4, 16, labels = c("die1", "die2", "die3", "die4"))
Bloq <- gl(4, 4, 16, labels = c("Bajo", "Normal", "SP", "OB"))

Dietas <- data.frame(Trat, Bloq, GP)
head(Dietas)

boxplot(Dietas$GP ~ Dietas$Trat,
        col = "Skyblue", 
        xlab = "Dietas",
        ylab = "Ganancia en peso (Kg)")

tapply(Dietas$GP, Dietas$Trat, var)

fligner.test(Dietas$GP, Dietas$Trat)
bartlett.test(Dietas$GP, Dietas$Trat)

diet.aov <- aov(Dietas$GP ~ Dietas$Trat)
summary(diet.aov)


Di2.aov <- aov(Dietas$GP ~ Dietas$Trat + Dietas$Bloq)
summary(Di2.aov)
