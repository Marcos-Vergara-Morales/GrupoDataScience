##Datos Peli

#Instalar paquetes

install.packages("tidyr")
install.packages("dplyr")
install.packages("readr")
install.packages("stringr")

# Cargar paquetes 
library(readr)
library(tidyr)
library(dplyr)
library(stringr)

##1r paso.Importar Datos

reviews_filmaffinity <- read_csv("~/Downloads/reviews_filmaffinity.csv", 
                                 col_types = cols(`film_name||gender||film_avg_rate||review_rate||review_title||review_text` = col_character()))

problems(reviews_filmaffinity)
View(reviews_filmaffinity)

#2ndo paso. Ver datos y limpiar datos

# Separar la columna en múltiples columnas, ya que al extraerlos estaban todos en la misma columna y daba problemas cuando se han extarido además

reviews_filmaffinity_separado <- reviews_filmaffinity %>%
  separate("film_name||gender||film_avg_rate||review_rate||review_title||review_text", 
           into = c("film_name", "gender", "film_avg_rate", "review_rate", "review_title", "review_text"), 
           sep = "\\|\\|", 
           remove = TRUE) 


# Transformación a variables numéricas

reviews_filmaffinity_separado <- reviews_filmaffinity_separado %>%
  mutate(film_avg_rate = as.numeric(film_avg_rate),
         review_rate = as.numeric(review_rate)) #Solo estas dos variables ya que tiene carater numerico 

# Al aplicar esta función, se nos indica que se han añadido valores NA

unique(reviews_filmaffinity_separado$film_avg_rate)
unique(reviews_filmaffinity_separado$review_rate) #se hace para ver valores únicos de ambas variables

#Eliminamos columna film_avg_rate ya que todos sus valores son NA

reviews_filmaffinity_separado <- reviews_filmaffinity_separado %>%
  select(-film_avg_rate)

# verificamos si hay NA en la columna review_rate

hay_NA <- any(is.na(reviews_filmaffinity_separado$review_rate))

hay_NA1 <- any(is.na(reviews_filmaffinity_separado$film_name))

hay_NA2 <- any(is.na(reviews_filmaffinity_separado$gender))

hay_NA3 <- any(is.na(reviews_filmaffinity_separado$review_text))

hay_NA4 <- any(is.na(reviews_filmaffinity_separado$review_title))

#También se ha revisado si hay NA en el resto de vairables

#Ahora eliminamos NA a de columna review_rate

reviews_filmaffinity_separado <- reviews_filmaffinity_separado[!is.na(reviews_filmaffinity_separado$review_rate), ]

#Por úlitmo vamos a calcular la media(review_rate) por nombre de pelicula, esto se hace ya que antes hemos perdido la variable media por pelicula(fil_avg_rate), al pasarlo a numérico todos los valores únicos encontraods de esta variable era NA

medias_por_pelicula <- reviews_filmaffinity_separado %>%
  group_by(film_name) %>%
  summarize(media_review_rate = mean(review_rate, na.rm = TRUE)) #la nueva varible contiene las media de las peliculas

# Vamos cambiar de nombre a la variable reviews_filmaffinity_separado

Peliculas <- reviews_filmaffinity_separado

#Vamos a ver si hay duplicados 

duplicados <- Peliculas[duplicated(Peliculas), ]
print(duplicados) #vemos que no hay, por lo tanot no hace falta eliminar nada

#Transformamos a variebles categóricas

Peliculas <- Peliculas %>%
  mutate(film_name = as.factor(film_name),
    gender = as.factor(gender),
    review_title = as.factor(review_title))

#Para finalizar limpiaremos el texto de la variable review_text

Peliculas <- Peliculas %>%
  mutate(review_text = str_to_lower(review_text),  #Mediante esta función se trata las minuscula y mayusucalas por igual
        review_text = str_replace_all(review_text, "[^[:alnum:][:space:]]", " "), # se remplaza todo los valores no alfanuméricos por espacio en blaco, de esta forma teliminamos caracteres especiales
        review_text = str_squish(review_text))  # Eliminar espacios extra



#Visualizar datos y comparar

##PAQUETE VISUALIZACIÓN DE DATOS

install.packages("ggplot2")

library(ggplot2)

# Distribución de nota/calificacion de reseña
ggplot(Peliculas, aes(x = review_rate)) +
  geom_histogram(binwidth = 1, fill = "blue", color = "black") +
  labs(title = "Distribución de Puntuaciones de Reseñas",
       x = "Calificación de Reseña",
       y = "Frecuencia")

# Media de nota/calificacion por película
ggplot(medias_por_pelicula, aes(x = reorder(film_name, media_review_rate), y = media_review_rate)) +
  geom_bar(stat = "identity", fill = "blue", color = "black") +
  coord_flip() +
  labs(title = "Media de Puntuaciones por Película",
       x = "Nombre de Película",
       y = "Media de Calificación")

# Comparación de nota/calificacion por Género
ggplot(Peliculas, aes(x = gender, y = review_rate)) +
  geom_boxplot() +
  labs(title = "Comparación de Puntuaciones por Género",
       x = "Género",
       y = "Calificación de Reseña")


##Creación de nube de palabras en los cometarios de peliculas(review text)

#Instalar y cargar paquetes que se necesitan
install.packages("tm")
install.packages("wordcloud")
install.packages("SnowballC")
install.packages("NLP")
install.packages("RColorBrewer")

library(tm)
library(wordcloud)
library(SnowballC)
library(NLP)
library(RColorBrewer)

#construimos corpus a partir de la varible review_text

corpus <- Corpus(VectorSource(Peliculas$review_text))

#ahora con el corpus vamos a "limpiar" todas las opniones

corpus <- tm_map(corpus, content_transformer(tolower)) #con esto todas las mayúsculas se transforman en minúsculas
corpus <- tm_map(corpus, removeNumbers) # eliminamos número de las opiniones
corpus <- tm_map(corpus, removePunctuation) # eliminacion signos de puntuación
corpus <- tm_map(corpus, removeWords, stopwords("spanish")) #eliminacion palbra comunes de la lengua castellana como conjunciones o preposiciones, son palabra generales y no aportarian "riqueza"/info a lo que buscamos

####el corpues no me sale:/







