library(tidyverse)

# Relación entre marcos normativos gubernamentales y acciones gubernamentales
cor(mng, ag, use = "complete.obs")

ggplot(datos, aes(x = mng, y = ag)) +
  geom_point() +
  labs(
    title = "Relación entre el puntaje en marcos normativos y el puntaje en acciones gubernamentales",
    subtitle = "Países relevados por el índice GIRAI, 2024.",
    x = "Puntaje en marcos normativos gubernamentales (0 a 100)",
    y = "Puntaje en acciones gubernamentales (0 a 100)",
    caption = "Fuente: elaboración propia a partir de la base GIRAI."
  )
