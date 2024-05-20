## Esteban Motel Guzmán 
## 08 / 05 / 2024
## 1930302


# Ingresar datos ----------------------------------------------------------

## Ingresar datos del Diseño Aleatorio (DA)
#    5 tratamientos germinativos 
#    4 repecticiones cada tratamiento

ger <- c(3,3,4,2,7,8,7,6,8,9,8,7,6,7,7,6,3,2,1,3)

#CL: Control
#EM: Escarificacion mecanica
#A4: Agua T. ambiente (4hrs)
#A1: Agua caliente (1 min)
#AC: Acido clorhidrico (10 s)

tra <- gl(5, 4, 20, labels= c("CL","EM", "A4", "A1", "AC"))

Exp <- data.frame(tra, ger)

boxplot(Exp$ger~Exp$tra,
        col = "orange",
        xlab = "Tratamientos",
        ylab = "Germinación")

# Revisa la normalidad
shapiro.test(Exp$ger)

# Revisa la igualdad de varianzas
bartlett.test(Exp$ger,Exp$tra)

med.tra <- tapply(Exp$ger, Exp$tra, mean)
var.tra <- tapply(Exp$ger,Exp$tra, var)

# Media general
MG <- mean(Exp$ger)

# Suma de cuadrados
SC <- (Exp$ger - MG)^2

# Suma de cuadrados del experimento (SCTotal)
SCTotal <- sum(SC)

# Suma de cuadrados del tramiento (SCTra)
SCTra <- sum((med.tra - MG)^2 * 4)

# Suma de cuadrados del error (SCError)
SCError <- SCTotal - SCTra

# ANOVA usando function aov
ANExp <- aov(Exp$ger ~ Exp$tra)
summary(ANExp)

# Debido a las diferencias entre los tratamientos se aplicara la prueba de Tukey
TukeyHSD(ANExp)

plot(TukeyHSD(ANExp))
