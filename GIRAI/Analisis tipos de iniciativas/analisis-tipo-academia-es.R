source("00-ingesta.R")


conteo <- table(datos$tipo_academia_es)

print(conteo)

barplot(
  conteo,
  las = 2,
  main = "Frecuencia de tipo_academia_es",
  ylab = "Cantidad",
  col = "lightblue"
)