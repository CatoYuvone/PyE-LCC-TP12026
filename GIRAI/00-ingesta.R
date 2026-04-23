# Instalo los paquetes necesarios (si aún no los tengo instalados)
install.packages("readxl")
library(readxl)



# Link al archivo
url="https://docs.google.com/spreadsheets/d/1Kwl4KByOv8q2kXMsgaO3d5QI3vUQ40RCZJgJHhg5bmE/edit?gid=580479207#gid=580479207"

datos <- read_excel("/GIRAI/data.xlsx", skip = 1)

# Leo el archivo y almaceno los datos en un data frame

# Veo la estructura del dataset
str(datos)
