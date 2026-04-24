source("00-ingesta.R")


conteo <- table(datos$tipo_privado_en)

print(conteo)

barplot(
  conteo,
  las = 2,
  main = "Frecuencia de tipo_privado_en",
  ylab = "Cantidad",
  col = "lightblue"
)