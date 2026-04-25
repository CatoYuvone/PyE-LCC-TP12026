#Instalar paquetes si no están
#install.packages("dplyr")
#install.packages("ggplot2")
library(dplyr) 
library(ggplot2)

# Calculamos la frecuencia y proporción de cada dimensión mejor puntuada
datos %>% 
  count(`Dimensión mejor puntuada`) %>% 
  mutate(
    proporcion = n / sum(n),
    porcentaje = round(proporcion * 100, 2)
  ) %>% 
  arrange(desc(n))

# Graficamos la distribución de la dimensión mejor puntuada
ggplot(datos, aes(x = `Dimensión mejor puntuada`)) +
  geom_bar() +
  labs(
    title = "Distribución de los países según la dimensión mejor puntuada",
    subtitle = "Países relevados por el índice GIRAI, 2024.",
    x = "Dimensión mejor puntuada",
    y = "Cantidad de países",
    caption = "Fuente: elaboración propia a partir de la base GIRAI."
  )

# Proporción de dimensiones mejor puntuadas
datos %>% count(`Dimensión mejor puntuada`) %>% mutate(proporcion = n/sum(n))

# Cantidad de subregiones por región
datos %>% group_by(NU_region) %>% count(UN_subregion)

# Proporción de dimensiones mejor puntuadas por subregión
proporcion_subregion <- datos %>% group_by(UN_subregion) %>% count(`Dimensión mejor puntuada`) %>% mutate(proporcion = n/sum(n))

# Mayor cantidad de dimensiones mejor puntuadas por subregión
dominante_subregion <- datos %>% group_by(UN_subregion) %>% count(`Dimensión mejor puntuada`) %>% slice_max(n, n = 1)


ggplot(
  proporcion_subregion,
  aes(
    x = UN_subregion,
    y = proporcion,
    fill = `Dimensión mejor puntuada`
  )
) +
  geom_col(position = "fill") +
  coord_flip() +
  labs(
    title = "Distribución de la dimensión mejor puntuada según subregión",
    subtitle = "Países relevados por el índice GIRAI, 2024. Cada barra representa la distribución porcentual dentro de una subregión.",
    x = "Subregión",
    y = "Proporción de países",
    fill = "Dimensión mejor puntuada",
    caption = "Fuente: elaboración propia a partir de la base GIRAI."
  )


ggplot(
  dominante_subregion, 
  aes(
    x = reorder(UN_subregion, n), 
    y = n, 
    fill = `Dimensión mejor puntuada`
  )
) +
  geom_col() +
  coord_flip() +
  labs(
    title = "Dimensión mejor puntuada predominante por subregión",
    subtitle = "Países relevados por el índice GIRAI, 2024. En caso de empate, se muestran ambas dimensiones.",
    x = "Subregión",
    y = "Cantidad de países",
    fill = "Dimensión mejor puntuada",
    caption = "Fuente: elaboración propia a partir de la base GIRAI."
  )
