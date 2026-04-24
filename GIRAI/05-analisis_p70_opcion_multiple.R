library(tidyverse)

# Análisis univariado de variable categórica de opción múltiple
# Pregunta p70: cada columna representa una opción posible y toma valores 0/1

columnas_p70 <- c(
  "p70_sesgo",
  "p70_infancia",
  "p70_divers",
  "p70_datpers",
  "p70_genero",
  "p70_suphum",
  "p70_laboral",
  "p70_segu",
  "p70_transp"
)

total_casos <- nrow(datos)

p70_resumen <- datos %>%
  select(all_of(columnas_p70)) %>%
  pivot_longer(
    cols = everything(),
    names_to = "opcion",
    values_to = "seleccionada"
  ) %>%
  filter(seleccionada == 1) %>%
  count(opcion, name = "cantidad") %>%
  mutate(
    opcion = recode(
      opcion,
      "p70_sesgo" = "Sesgo",
      "p70_infancia" = "Infancia",
      "p70_divers" = "Diversidad",
      "p70_datpers" = "Datos personales",
      "p70_genero" = "Género",
      "p70_suphum" = "Supervisión humana",
      "p70_laboral" = "Laboral",
      "p70_segu" = "Seguridad",
      "p70_transp" = "Transparencia"
    ),
    porcentaje_casos = round(cantidad / total_casos * 100, 2),
    porcentaje_respuestas = round(cantidad / sum(cantidad) * 100, 2)
  ) %>%
  arrange(desc(cantidad))

# Ver tabla resumen
p70_resumen

# Gráfico de porcentaje de casos
ggplot(p70_resumen, aes(x = reorder(opcion, porcentaje_casos), y = porcentaje_casos)) +
  geom_col() +
  coord_flip() +
  labs(
    title = "Porcentaje de casos que seleccionó cada tema",
    subtitle = "Pregunta de opción múltiple. Los porcentajes no suman 100% porque cada caso podía seleccionar más de una opción",
    x = "Tema seleccionado",
    y = "Porcentaje de casos"
  )

