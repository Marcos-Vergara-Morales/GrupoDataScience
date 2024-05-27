##Datos Peli

#Instalar tidyr

install.packages("tidyr")

# Cargar paquetes 
library(readr)
library(tidyr)

##1r paso.Importar Datos

reviews_filmaffinity <- read_csv("~/Downloads/reviews_filmaffinity.csv", 
                                 col_types = cols(`film_name||gender||film_avg_rate||review_rate||review_title||review_text` = col_character()))
View(reviews_filmaffinity)


#2ndo paso. Ver datos

# Separar la columna en múltiples columnas, ya que al extraerlos estaban todos en la misma columna

reviews_filmaffinity <- reviews_filmaffinity %>%
  separate(`film_name||gender||film_avg_rate||review_rate||review_title||review_text`, 
           into = c("film_name", "gender", "film_avg_rate", "review_rate", "review_title", "review_text"), 
           sep = "\\|\\|", 
           remove = TRUE) 

# Ver las primeras filas del nuevo dataframe
head(reviews_filmaffinity)

#Por último cambiamos el nombre a los datos

Peliculas <- reviews_filmaffinity

print(Peliculas)

summary(Peliculas)

colnames(x = Peliculas)

summary(Peliculas$review_rate)

media_peli <- mean(Peliculas$film_avg_rate)


