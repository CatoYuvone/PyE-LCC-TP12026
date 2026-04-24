source("00-ingesta.R")

breaks <- seq(0, 100, by = 10)

datos$rango_girai <- cut(
  datos$GIRAI,
  breaks = breaks,
  include.lowest = TRUE,
  right = FALSE
)

moda <- function(x) {
  x <- na.omit(x)
  if (length(x) == 0) return(NA)
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}

resultado <- aggregate(
  tipo_privado_es ~ rango_girai,
  data = datos,
  FUN = moda
)

print(resultado)