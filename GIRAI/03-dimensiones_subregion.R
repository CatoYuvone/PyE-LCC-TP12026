#Instalar paquetes si no están
#install.packages("dplyr")
#install.packages("ggplot2")
library(dplyr) 
library(ggplot2)


# Proporción de dimensiones mejor puntuadas
datos %>% count(`Dimensión mejor puntuada`) %>% mutate(proporcion = n/sum(n))

# Cantidad de subregiones por región
datos %>% group_by(NU_region) %>% count(UN_subregion)

# Proporción de dimensiones mejor puntuadas por subregión
proporcion_subregion <- datos %>% group_by(UN_subregion) %>% count(`Dimensión mejor puntuada`) %>% mutate(proporcion = n/sum(n))

# Mayor cantidad de dimensiones mejor puntuadas por subregión
dominante_subregion <- datos %>% group_by(UN_subregion) %>% count(`Dimensión mejor puntuada`) %>% slice_max(n, n = 1)


ggplot(proporcion_subregion,
       aes(x = UN_subregion,
           y = proporcion,
           fill = `Dimensión mejor puntuada`)) +
  geom_col(position = "fill") +
  coord_flip() +
  labs(
    title = "Distribución de dimensiones mejor puntuadas por subregión",
    x = "Subregión",
    y = "Proporción",
    fill = "Dimensión"
  )


ggplot(dominante_subregion, 
       aes(x = reorder(UN_subregion, n), 
           y = n, 
           fill = `Dimensión mejor puntuada`)) +
  geom_col() +
  coord_flip() +
  labs(
    title = "Dimensión mejor puntuada predominante por subregión",
    subtitle = "En caso de empate, se muestran ambas dimensiones",
    x = "Subregión",
    y = "Cantidad de países",
    fill = "Dimensión"
  )
