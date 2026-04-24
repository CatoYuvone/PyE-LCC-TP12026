source("00-ingesta.R")

promedios <- aggregate(GIRAI ~ UN_subregion, data = datos, FUN = mean, na.rm = TRUE)

# Ordeno de mayor a menor
promedios <- promedios[order(-promedios$GIRAI), ]

print(promedios)