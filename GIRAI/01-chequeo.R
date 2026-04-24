# Instalo los paquetes necesarios (si aún no los tengo instalados)
# install.packages("tidyverse")

# Cargo los paquetes que voy a usar
library(tidyverse)

# Fijo el dataset
attach(datos)

# Chequeo la integridad de los datos


# Chequear cuántos datos vacíos tiene cada columna
faltante_por_columna = colSums(is.na(datos))
faltante_por_columna[faltante_por_columna != 0]

# Chequear puntajes 0-100
columnas_puntaje <- c("GIRAI", "mng", "ag", "ane", "ddhh", "gob", "cap")

for (col in columnas_puntaje) {
  cat("\nColumna:", col, "\n")
  cat("Mínimo:", min(datos[[col]]), "\n")
  cat("Máximo:", max(datos[[col]]), "\n")
}

# Chequear variables categóricas ordinales
columnas_sec <- c("sec_mng", "sec_ag", "sec_ane")

for (col in columnas_sec) {
  cat("\nColumna:", col, "\n")
  print(unique(datos[[col]]))
}

# Chequear variables 0/1
columnas_p70 <- c(
  "p70_sesgo", "p70_infancia", "p70_divers",
  "p70_datpers", "p70_genero", "p70_suphum",
  "p70_laboral", "p70_segu", "p70_transp"
)

for (col in columnas_p70) {
  cat("\nColumna:", col, "\n")
  print(unique(datos[[col]]))
}

# Chequear areas 0-19
columnas_areas <- c(
  "areas_mng", "areas_ag", "areas_parlam",
  "areas_concient", "areas_ane"
)

for (col in columnas_areas) {
  cat("\nColumna:", col, "\n")
  cat("Mínimo:", min(datos[[col]], na.rm = TRUE), "\n")
  cat("Máximo:", max(datos[[col]], na.rm = TRUE), "\n")
}
