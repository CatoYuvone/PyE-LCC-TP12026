source("00-ingesta.R")

promedios <- aggregate(GIRAI ~ UN_subregion, data = datos, FUN = mean, na.rm = TRUE)

promedios <- promedios[order(-promedios$GIRAI), ]

print(promedios)


# ============================================================
# Descripción gráfica de una variable cuantitativa continua
# Variable elegida: GIRAI
# ============================================================


ggplot(datos, aes(x = GIRAI)) +
  geom_histogram(bins = 10) +
  labs(
    title = "Distribución del índice GIRAI",
    subtitle = "Variable cuantitativa continua",
    x = "GIRAI",
    y = "Cantidad de países"
  )
