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
    title = "Distribución de los países según el nivel de desarrollo secundario en marcos normativos. Países relevados por el índice GIRAI, 2024.",
    subtitle = "Nivel de desarrollo construido a partir de fuentes secundarias.",
    x = "Nivel de desarrollo secundario en marcos normativos",
    y = "Cantidad de países",
    caption = "Fuente: elaboración propia a partir de la base GIRAI."
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
    title = "Distribución de los países según el nivel de desarrollo secundario en acciones gubernamentales. Países relevados por el índice GIRAI, 2024.",
    subtitle = "Nivel de desarrollo construido a partir de fuentes secundarias.",
    x = "Nivel de desarrollo secundario en acciones gubernamentales",
    y = "Cantidad de países",
    caption = "Fuente: elaboración propia a partir de la base GIRAI."
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
    title = "Distribución de los países según el nivel de desarrollo secundario en acciones no estatales. Países relevados por el índice GIRAI, 2024.",
    subtitle = "Nivel de desarrollo construido a partir de fuentes secundarias.",
    x = "Nivel de desarrollo secundario en acciones no estatales",
    y = "Cantidad de países",
    caption = "Fuente: elaboración propia a partir de la base GIRAI."
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
  geom_boxplot() +
  stat_summary(fun = mean, geom = "point", shape = 18, size = 4, color = "red") +
  labs(
    title = "Distribución del puntaje en marcos normativos según el nivel de desarrollo secundario. Países relevados por el índice GIRAI, 2024.",
    subtitle = "La caja representa cuartiles y mediana; el rombo rojo indica el promedio.",
    x = "Nivel de desarrollo secundario en marcos normativos",
    y = "Puntaje en marcos normativos (0 a 100)",
    caption = "Fuente: elaboración propia a partir de la base GIRAI."
  )

ggplot(datos, aes(x = sec_ag, y = ag)) +
  geom_boxplot() +
  stat_summary(fun = mean, geom = "point", shape = 18, size = 4, color = "red") +
  labs(
    title = "Distribución del puntaje en acciones gubernamentales según el nivel de desarrollo secundario. Países relevados por el índice GIRAI, 2024.",
    subtitle = "La caja representa cuartiles y mediana; el rombo rojo indica el promedio.",
    x = "Nivel de desarrollo secundario en acciones gubernamentales",
    y = "Puntaje en acciones gubernamentales (0 a 100)",
    caption = "Fuente: elaboración propia a partir de la base GIRAI."
  )

ggplot(datos, aes(x = sec_ane, y = ane)) +
  geom_boxplot() +
  stat_summary(fun = mean, geom = "point", shape = 18, size = 4, color = "red") +
  labs(
    title = "Distribución del puntaje en acciones no estatales según el nivel de desarrollo secundario. Países relevados por el índice GIRAI, 2024.",
    subtitle = "La caja representa cuartiles y mediana; el rombo rojo indica el promedio.",
    x = "Nivel de desarrollo secundario en acciones no estatales",
    y = "Puntaje en acciones no estatales (0 a 100)",
    caption = "Fuente: elaboración propia a partir de la base GIRAI."
  )
