#Instalar paquetes si no están
#install.packages("dplyr")
#install.packages("ggplot2")
library(dplyr) 
library(ggplot2)

# Transformar los datos de sec, para que tengan un orden
niveles_sec <- c("Muy bajo", "Bajo", "Medio", "Alto", "Muy alto")
datos <- datos %>%
  mutate(
    across( 
      c(sec_mng, sec_ag, sec_ane),
      ~ factor(.x, levels = niveles_sec, ordered = TRUE)
    )
  )


# Contamos cuántos países hay en cada nivel ordinal de sec_mng
datos %>% 
  count(sec_mng) %>% 
  mutate(
    proporcion = n / sum(n),
    porcentaje = round(proporcion * 100, 2)
  ) %>% 
  arrange(sec_mng)

# Graficamos la distribución ordinal de sec_mng
ggplot(datos, aes(x = sec_mng)) +
  geom_bar() +
  labs(
    title = "Distribución del nivel de desarrollo secundario en marcos normativos",
    subtitle = "Variable categórica ordinal",
    x = "Nivel de desarrollo según fuentes secundarias",
    y = "Cantidad de países"
  )


# Contamos cuántos países hay en cada nivel ordinal de sec_ag
datos %>% 
  count(sec_ag) %>% 
  mutate(
    proporcion = n / sum(n),
    porcentaje = round(proporcion * 100, 2)
  ) %>% 
  arrange(sec_ag)

# Graficamos la distribución ordinal de sec_ag
ggplot(datos, aes(x = sec_ag)) +
  geom_bar() +
  labs(
    title = "Distribución del nivel de desarrollo secundario en acciones gubernamentales",
    subtitle = "Variable categórica ordinal",
    x = "Nivel de desarrollo según fuentes secundarias",
    y = "Cantidad de países"
  )


# Contamos cuántos países hay en cada nivel ordinal de sec_ane
datos %>% 
  count(sec_ane) %>% 
  mutate(
    proporcion = n / sum(n),
    porcentaje = round(proporcion * 100, 2)
  ) %>% 
  arrange(sec_ane)

# Graficamos la distribución ordinal de sec_ane
ggplot(datos, aes(x = sec_ane)) +
  geom_bar() +
  labs(
    title = "Distribución del nivel de desarrollo secundario en actores no estatales",
    subtitle = "Variable categórica ordinal",
    x = "Nivel de desarrollo según fuentes secundarias",
    y = "Cantidad de países"
  )

# Ver el promedio por grupo de sec
datos %>% group_by(sec_mng) %>% 
  summarise (prom =mean(mng)) %>% 
  arrange(sec_mng)

datos %>% group_by(sec_ag) %>% 
  summarise (prom = mean(ag)) %>%
  arrange(sec_ag)

datos %>% group_by(sec_ane) %>% 
  summarise (prom= mean(ane)) %>% 
  arrange(sec_ane)

# Ver los cuartiles
datos %>% group_by(sec_mng) %>% 
  summarise (cantidad = n(),
             q1 = quantile(mng, probs = 0.25),
             q2 = quantile(mng, probs = 0.50),
             q3 = quantile(mng, probs = 0.75))  %>% arrange(sec_mng)

datos %>% group_by(sec_ag) %>% 
  summarise (cantidad = n(),
             q1 = quantile(ag, probs = 0.25),
             q2 = quantile(ag, probs = 0.50),
             q3 = quantile(ag, probs = 0.75))  %>% arrange(sec_ag)

datos %>% group_by(sec_ane) %>% 
  summarise (cantidad = n(),
             q1 = quantile(ane, probs = 0.25),
             q2 = quantile(ane, probs = 0.50),
             q3 = quantile(ane, probs = 0.75))  %>% arrange(sec_ane)

# Gráficos
ggplot(datos, aes(x = sec_mng, y = mng)) +
  geom_boxplot() + stat_summary(fun = mean, geom = "point", shape= 18, size = 4, color = "red") + labs(
    title = "Puntaje en marcos normativos según nivel de desarrollo secundario",
    subtitle = "La caja muestra cuartiles y mediana; el rombo rojo muestra el promedio",
    x = "Nivel de desarrollo según fuentes secundarias",
    y = "Puntaje mng"
  )

ggplot(datos, aes(x = sec_ag, y = ag)) +
  geom_boxplot() + stat_summary(fun = mean, geom = "point", shape = 18, size = 4, color = "red") + labs(
    title = "Puntaje en acciones gubernamentales según nivel de desarrollo secundario",
    subtitle = "La caja muestra cuartiles y mediana; el rombo rojo muestra el promedio",
    x = "Nivel de desarrollo según fuentes secundarias",
    y = "Puntaje ag"
  )
ggplot(datos, aes(x = sec_ane, y = ane)) +
  geom_boxplot() + stat_summary(fun = mean, geom = "point", size = 3, color = "red")+  labs(
    title = "Puntaje en acciones no estatales según nivel de desarrollo secundario",
    subtitle = "La caja muestra cuartiles y mediana; el rombo rojo muestra el promedio",
    x = "Nivel de desarrollo según fuentes secundarias",
    y = "Puntaje ane"
  )
