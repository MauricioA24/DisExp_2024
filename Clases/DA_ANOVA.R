# Enilton Mauricio Avendaño Amaya
# 2022601
# 08/05/2024


# Ingresar datos --------------------------------------------------------


# Ingresar datos del diseño aleatorio
# 5 tratamientos germinativos
# 4 repeticiones por tratamiento


germ <- c(3,3, 4, 2, 7, 8, 7, 6, 8, 9, 8, 7, 6, 7, 7, 6, 3, 2, 1, 3)

trat <- gl(5, 4, 20, labels = c("Ctrl", "EM", "Ra4h", "AG", "AC"))

Exper <- data.frame(trat, germ)

boxplot(Exper$germ ~ Exper$trat, col = "skyblue",
        xlab = "Tratamientos", ylab = "Germinación (&)")

#Revisión de datos
shapiro.test(Exper$germ)

#Revisa la igaludad de varianzas
bartlett.test(Exper$germ, Exper$trat)

med.trat <- tapply(Exper$germ, Exper$trat, mean)
med.trat

# Media general
MG <- mean(Exper$germ)

var.trat <- tapply(Exper$germ, Exper$trat, var)
var.trat

Exper$SC <- (Exper$germ - MG)^2

# Suma de cuadrados del tratamiento SCTol
SCTol <- sum(Exper$SC)

# Suma de cuadrados del tratamiento SCTrat

SCTrat <- sum((med.trat-MG)^2 * 4)
SCTrat

# Suma cuadrado del error
SCTol - SCTrat

SCTrat/4
9.7/15

26.2/0.64

# ANOVA usando función aov 

Exp.aov <- aov(Exper$germ ~ Exper$trat)
summary(Exp.aov)

# Existen diferencias entre los tart de germ
# Por lo tanto, aplicaremos una prueba de Tukey

TukeyHSD(Exp.aov)
plot(TukeyHSD(Exp.aov))
