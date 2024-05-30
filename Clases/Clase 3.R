## Enilton Mauricio Avendaño Amaya
## 06 / 05 / 2024
## 1930302


# Importar datos  ---------------------------------------------------------

library(readr) 

file <- paste0 ("https://raw.githubusercontent.com/mgtagle/202_Analisis_Estadistico_2020/02680a60a88f56facda17fa38af265fb81f7f9f6/cuadro1.csv")

inventario <- read.csv(file)

head(inventario)


tail(inventario)

mean(inventario$Diametro)
mean(inventario$Altura)

boxplot(inventario$Diametro ~ inventario$Especie,
        ylab = "Diametro",
        xlab = "Especie",
        col = "skyblue")

boxplot(inventario$Altura ~ inventario$Especie,
        ylab = "Altura",
        xlab = "Especie",
        col = "lightgreen")

boxplot(inventario$Altura ~ inventario$Clase,
        ylab = "Altura",
        xlab = "Clase",
        col = "orange")

# Restricciones -----------------------------------------------------------

sub1 <- subset(inventario, Diametro >= 15)
sub2 <- subset(inventario, Diametro >= mean(Diametro))
sub3 <- subset(inventario, Clase != "D" )

boxplot(sub3$Diametro ~ sub3$Clase,
        ylab = "Diametro",
        xlab = "Clase",
        col = "yellow")               
