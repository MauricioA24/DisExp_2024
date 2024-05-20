### Esteban Motel Guzmán
### 1930302

# Laboratorio 1

## Gastos Mensuales 


300 + 240 + 1527 + 400 + 1500 + 1833

celular <- 300
transporte <- 240
comestibles <- 1527
alquiler <- 1500
otros <- 1833
gimnasio <- 400
gastos <- c(celular, transporte, comestibles, gimnasio, alquiler, otros)

gastos_ordenados <- sort(gastos, decreasing = TRUE)

barplot(gastos_ordenados)



