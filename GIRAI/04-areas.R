
library(tidyverse)

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
                                                                 labels = etiquetas_areas
                                                                 right = FALSE)) 

datos_rango_areas_ane %>% count(rango_areas_ane) 

datos_rango_areas_ane %>% group_by(rango_areas_ane) %>% summarise(promedio_ane = mean(ane))
datos_rango_areas_ane %>% group_by(rango_areas_ane) %>% summarise(cantidad = n(),
                                                                  q1 = quantile(ane, probs = 0.25),
                                                                  q2 = quantile(ane, probs = 0.50),
                                                                  q3 = quantile(ane, probs = 0.75))



# Hacemos los gráficos
ggplot(datos_rango_areas_mng, aes(x = rango_areas_mng, y = mng)) +
  geom_boxplot() + stat_summary(fun = mean, geom = "point", shape= 18, size = 4, color = "red") + labs(
    title = "Puntaje en marcos normativos según cantidad de áreas",
    subtitle = "La caja muestra cuartiles y mediana; el rombo rojo muestra el promedio",
    x = "Áreas temáticas",
    y = "Puntaje mng"
  )

ggplot(datos_rango_areas_ag, aes(x = rango_areas_ag, y = ag)) +
  geom_boxplot() + stat_summary(fun = mean, geom = "point", shape= 18, size = 4, color = "red") + labs(
    title = "Puntaje en acciones gubernamentales según cantidad de áreas",
    subtitle = "La caja muestra cuartiles y mediana; el rombo rojo muestra el promedio",
    x = "Áreas temáticas",
    y = "Puntaje ag"
  )

ggplot(datos_rango_areas_ane, aes(x = rango_areas_ane, y = ane)) +
  geom_boxplot() + stat_summary(fun = mean, geom = "point", shape= 18, size = 4, color = "red") + labs(
    title = "Puntaje en acciones no estatales según cantidad de áreas",
    subtitle = "La caja muestra cuartiles y mediana; el rombo rojo muestra el promedio",
    x = "Áreas temáticas",
    y = "Puntaje ane"
  )

