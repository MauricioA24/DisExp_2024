## Enilton Mauricio Avendaño Amaya
## 2022601
## 20/05/2024

# Experimento ganancia en peso (GP) basado en diferentes
# Niveles de factor: 4 dietas (D1, D1, D3, D4)

D1 <- c(2.4, 2.2, 3.4, 1.6)
D2 <- c(2.2, 1.9, 1.7, 2.1)
D3 <- c(3.3, 1.3, 2.8, 2.1)
D4 <- c(1.6, 2.5, 1.4, 2.4)

D1[1]
D2[2]

## Para peso bajo sumar la ganancia en peso
sum(D1[1]+D2[1]+D3[1]+D4[1])
sum(D1[2]+D2[2]+D3[2]+D4[2])
sum(D1[3]+D2[3]+D3[3]+D4[3])
sum(D1[4]+D2[4]+D3[4]+D4[4])

## Suamtoria de las dietas independientes de grupo
sum(D1); sum(D2); sum(D3); sum(D4)

# Ganancia en peso, Tratamientos y Bloques
GP <- c(D1,D2,D3,D4)
Trat <- gl(4,4,16, labels = c("D1","D2","D3","D4"))
Bloq <- gl(4,4,16, labels = c("Bajo","Normal","SP", "OB"))

Dietas <- data.frame(Trat,Bloq,GP)
head(Dietas)

boxplot(Dietas$GP~Dietas$Trat, col = "skyblue", xlab = "Dietas",
        ylab = "Ganancia en peso (Kg)")

tapply(Dietas$GP, Dietas$Trat, var)

fligner.test(Dietas$GP, Dietas$Trat)
bartlett.test(Dietas$GP, Dietas$Trat)

diet.aov <- aov(Dietas$GP~Dietas$Trat)
summary(diet.aov)

Di2.aov <- aov(Dietas$GP ~ Dietas$Trat + Dietas$Bloq)
summary(Di2.aov)


