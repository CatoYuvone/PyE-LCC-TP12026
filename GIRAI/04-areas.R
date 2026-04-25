
library(tidyverse)

# Contamos cuántos casos hay para cada cantidad de áreas
datos %>% 
  count(areas_mng) %>% 
  arrange(areas_mng)

# Graficamos la distribución de la cantidad de áreas
ggplot(datos, aes(x = areas_mng)) +
  geom_bar() +
  labs(
    title = "Distribución de los países según la cantidad de áreas temáticas en marcos normativos",
    subtitle = "Países relevados por el índice GIRAI, 2024.",
    x = "Cantidad de áreas temáticas en marcos normativos",
    y = "Cantidad de países",
    caption = "Fuente: elaboración propia a partir de la base GIRAI."
  )

# Divimos la cantidad de areas de mng en rangos

# Definimos los cortes y etiquetas para los rangos
cortes_areas <- c(0, 5, 10, 15, 20)
etiquetas_areas <- c("0 a 4", "5 a 9", "10 a 14", "15 a 19")

datos_rango_areas_mng <- datos %>% mutate(rango_areas_mng = cut ( areas_mng, 
                        breaks = cortes_areas,
                        labels = etiquetas_areas,
                        right = FALSE)) 

# Contamos cuántos casos hay en cada rango
datos_rango_areas_mng %>% count(rango_areas_mng) 

# Calculamos el promedio de mng por rango
datos_rango_areas_mng %>% group_by(rango_areas_mng) %>% summarise(promedio_mng = mean(mng))

# Calculamos cantidad y cuartiles de mng por rango
datos_rango_areas_mng %>% group_by(rango_areas_mng) %>% summarise(cantidad = n(),
                                                                  q1 = quantile(mng, probs = 0.25),
                                                                  q2 = quantile(mng, probs = 0.50),
                                                                  q3 = quantile(mng, probs = 0.75))




# Ahora hacemos lo mismo con el ag

datos_rango_areas_ag<- datos %>% mutate(rango_areas_ag = cut ( areas_ag, 
                                                                  breaks = cortes_areas,
                                                                  labels = etiquetas_areas,
                                                                  right = FALSE)) 

datos_rango_areas_ag %>% count(rango_areas_ag) 

datos_rango_areas_ag %>% group_by(rango_areas_ag) %>% summarise(promedio_ag = mean(ag))

datos_rango_areas_ag %>% group_by(rango_areas_ag) %>% summarise(cantidad = n(),
                                                                q1 = quantile(ag, probs = 0.25),
                                                                q2 = quantile(ag, probs = 0.50),
                                                                q3 = quantile(ag, probs = 0.75))


# Y con el ane

datos_rango_areas_ane<- datos %>% mutate(rango_areas_ane = cut ( areas_ane, 
                                                                 breaks = cortes_areas,
                                                                 labels = etiquetas_areas,
                                                                 right = FALSE)) 

datos_rango_areas_ane %>% count(rango_areas_ane) 

datos_rango_areas_ane %>% group_by(rango_areas_ane) %>% summarise(promedio_ane = mean(ane))
datos_rango_areas_ane %>% group_by(rango_areas_ane) %>% summarise(cantidad = n(),
                                                                  q1 = quantile(ane, probs = 0.25),
                                                                  q2 = quantile(ane, probs = 0.50),
                                                                  q3 = quantile(ane, probs = 0.75))



# Hacemos los gráficos
ggplot(datos_rango_areas_mng, aes(x = rango_areas_mng, y = mng)) +
  geom_boxplot() +
  stat_summary(fun = mean, geom = "point", shape = 18, size = 4, color = "red") +
  labs(
    title = "Distribución del puntaje en marcos normativos según cantidad de áreas temáticas",
    subtitle = "Países relevados por el índice GIRAI, 2024. La caja representa cuartiles y mediana; el rombo rojo indica el promedio.",
    x = "Cantidad de áreas temáticas en marcos normativos",
    y = "Puntaje en marcos normativos (0 a 100)",
    caption = "Fuente: elaboración propia a partir de la base GIRAI."
  )

ggplot(datos_rango_areas_ag, aes(x = rango_areas_ag, y = ag)) +
  geom_boxplot() +
  stat_summary(fun = mean, geom = "point", shape = 18, size = 4, color = "red") +
  labs(
    title = "Distribución del puntaje en acciones gubernamentales según cantidad de áreas temáticas",
    subtitle = "Países relevados por el índice GIRAI, 2024. La caja representa cuartiles y mediana; el rombo rojo indica el promedio.",
    x = "Cantidad de áreas temáticas en acciones gubernamentales",
    y = "Puntaje en acciones gubernamentales (0 a 100)",
    caption = "Fuente: elaboración propia a partir de la base GIRAI."
  )

ggplot(datos_rango_areas_ane, aes(x = rango_areas_ane, y = ane)) +
  geom_boxplot() +
  stat_summary(fun = mean, geom = "point", shape = 18, size = 4, color = "red") +
  labs(
    title = "Distribución del puntaje en acciones no estatales según cantidad de áreas temáticas",
    subtitle = "Países relevados por el índice GIRAI, 2024. La caja representa cuartiles y mediana; el rombo rojo indica el promedio.",
    x = "Cantidad de áreas temáticas con actores no estatales trabajando",
    y = "Puntaje en acciones no estatales (0 a 100)",
    caption = "Fuente: elaboración propia a partir de la base GIRAI."
  )

