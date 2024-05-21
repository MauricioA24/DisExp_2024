## Esteban Motel Guzmán 
## 29 / 04 / 2024
## 1930302


# Importar datos ----------------------------------------------------------

### Utilizar función read.csv sirve para importar datos

cr <- read.csv("Cedro.csv", header = TRUE)


# Revisión datos ----------------------------------------------------------

mean(cr$diametro); mean(cr$altura)
median(cr$diametro); median(cr$altura)
sd(cr$diametro); sd(cr$altura)
range(cr$diametro); range(cr$altura)
fivenum(cr$diametro); fivenum(cr$altura)



# Representación grafica --------------------------------------------------

boxplot(cr$diametro, main = "Cedro Rojo", 
        col = "darkred",
        ylab = "Diametro (cm)",
        ylim = c(10,20))

boxplot(cr$altura, main = "Cedro Rojo", 
        col = "yellow",
        ylab = "Altura (cm)",
        ylim = c(10,30))

hist(cr$altura, xlab = "Altura (cm)",
     main = "Cedro rojo",
     ylab = "Frecuencia",
     col = "blue")


stem(cr$altura)