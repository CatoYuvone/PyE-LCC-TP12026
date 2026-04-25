source("00-ingesta.R")
library(dplyr)
library(ggplot2)

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

# ============================================================
# Medidas de posición y dispersión para GIRAI
# ============================================================

datos %>%
  summarise(
    promedio = mean(GIRAI, na.rm = TRUE),
    mediana = median(GIRAI, na.rm = TRUE),
    q1 = quantile(GIRAI, 0.25, na.rm = TRUE),
    q3 = quantile(GIRAI, 0.75, na.rm = TRUE),
    iqr = IQR(GIRAI, na.rm = TRUE),
    desvio_estandar = sd(GIRAI, na.rm = TRUE)
  )
