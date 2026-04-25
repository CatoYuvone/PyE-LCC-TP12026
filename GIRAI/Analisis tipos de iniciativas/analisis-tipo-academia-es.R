source("00-ingesta.R")


conteo <- table(datos$tipo_academia_es)

print(conteo)

barplot(
  conteo,
  las = 2,
  main = "Distribución de los países según el tipo de iniciativa académica más frecuente. Índice GIRAI, 2024.",
  xlab = "Tipo de iniciativa académica más frecuente",
  ylab = "Cantidad de países",
  col = "lightblue"
)
