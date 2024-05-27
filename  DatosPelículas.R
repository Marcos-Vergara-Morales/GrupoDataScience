##Datos Peli

##1r paso.Importar Datos

library(readr)
reviews_filmaffinity <- read_csv("~/Downloads/reviews_filmaffinity.csv", 
                                 col_types = cols(`film_name||gender||film_avg_rate||review_rate||review_title||review_text` = col_character()))
View(reviews_filmaffinity)


#2ndo paso. Limpiar datos

#Instalar tidyr

install.packages("tidyr")

# Cargar paquetes 
library(readr)
library(tidyr)

# Leemos el archivo CSV y vemos que limpiar
reviews_filmaffinity <- read_csv("~/Downloads/reviews_filmaffinity.csv", 
                                 col_types = cols(`film_name||gender||film_avg_rate||review_rate||review_title||review_text` = col_character()))

# Separar la columna en múltiples columnas
reviews_filmaffinity <- reviews_filmaffinity %>%
  separate(`film_name||gender||film_avg_rate||review_rate||review_title||review_text`, 
           into = c("film_name", "gender", "film_avg_rate", "review_rate", "review_title", "review_text"), 
           sep = "\\|\\|", 
           remove = TRUE)

# Ver las primeras filas del nuevo dataframe
head(reviews_filmaffinity)

# Ahora veremos NA

na_datos <- reviews_filmaffinity %>%
  filter(is.na(film_name) | is.na(gender) | is.na(film_avg_rate) | is.na(review_rate) | is.na(review_title) | is.na(review_text))

print(na_datos) ##vemos que no hay datos que contenga valores NA en la base de datos

#Por último cambiamos el nombre a los datos

Peliculas <- reviews_filmaffinity

print(Peliculas)




