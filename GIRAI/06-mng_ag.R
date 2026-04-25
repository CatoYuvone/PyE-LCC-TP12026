library(tidyverse)

# Relación entre marcos normativos gubernamentales y acciones gubernamentales
cor(mng, ag, use = "complete.obs")

ggplot(datos, aes(x = mng, y = ag)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(
    title = "Relación entre marcos normativos y acciones gubernamentales",
    subtitle = "Relación entre dos variables cuantitativas",
    x = "Puntaje en marcos normativos gubernamentales",
    y = "Puntaje en acciones gubernamentales"
  )
