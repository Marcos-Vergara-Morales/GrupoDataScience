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

reviews_filmaffinity <- read_csv("C:/Users/crist/Downloads/reviews_filmaffinity.csv", 
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
install.packages("quanteda")
install.packages("RcppParallel")


library(tm)
library(wordcloud)
library(SnowballC)
library(NLP)
library(RColorBrewer)
library(quanteda)
library(RcppParallel)

## Primero vamos a revisar si dentro de nuestra variable review_text hay opiniones vacíos

# Verificamos si hay textos vacíos o nulos en review_text

num_NA <- sum(is.na(Peliculas$review_text))  # Contar NA

num_EMPTY <- sum(Peliculas$review_text == "")  # Contar cadenas vacías

# Hacemos el recuento con la función cat()
cat("Número de opiniones nulas:", num_NA, "\n")
cat("Número de opiniones vacías:", num_EMPTY, "\n")

# Aunque no haya opiniones nulas ni vacías eliminamos filas con review_text vacío o nulo

Peliculas <- Peliculas[!(is.na(Peliculas$review_text) | Peliculas$review_text == ""), ]


#construimos corpus a partir de la varible review_text(usamos paquete "quanteda" ya que sirve manejar grandes conjuntos de datos)

corpus_todas_pelis <- corpus(Peliculas, text_field = "review_text")

# verificamos el contenido del corpus
summary(corpus_todas_pelis, 5)  # Resumen de los primeros 5 documentos del corpus

# Crear tokens y aplicar transformaciones
tokens_todas_pelis <- tokens(corpus_todas_pelis, 
                             remove_punct = TRUE,   # Eliminar puntuación
                             remove_numbers = TRUE) %>%  # Eliminar números
                    tokens_tolower() %>%  # Convertir a minúsculas
                tokens_remove(stopwords("spanish")) %>%  # Eliminar stopwords
             tokens_wordstem()  # Aplicar stemming

# Verificar los tokens
print(tokens_todas_pelis[1:5])  # Mostrar los primeros 5 tokens

# Crear un Document-Feature Matrix (dfm)
dfm_todas_pelis <- dfm(tokens_todas_pelis)

# Sumar las frecuencias de cada palabra directamente desde el dfm
words_todas_pelis <- topfeatures(dfm_todas_pelis, n = nfeat(dfm_todas_pelis))

# Convertir a un dataframe
df_todas_pelis <- data.frame(word = names(words_todas_pelis), freq = words_todas_pelis)

# Verificar el dataframe
head(df_todas_pelis)  # Mostrar las primeras filas del dataframe

# Generar la nube de palabras
set.seed(1234)
wordcloud(words = df_todas_pelis$word, freq = df_todas_pelis$freq, min.freq = 2,
          max.words = 200, random.order = FALSE, rot.per = 0.35,
          colors = brewer.pal(8, "Dark2"))




# Convertir el dfm a una matriz
matrix_todas_pelis <- as.matrix(dfm_todas_pelis)

# Sumar las frecuencias de cada palabra
words <- sort(colSums(matrix), decreasing = TRUE)
df <- data.frame(word = names(words), freq = words)

# Verificar el dataframe
head(df)  # Mostrar las primeras filas del dataframe

# Generar la nube de palabras
set.seed(1234)
wordcloud(words = df$word, freq = df$freq, min.freq = 2,
          max.words = 200, random.order = FALSE, rot.per = 0.35,
          colors = brewer.pal(8, "Dark2"))


## Ahora haremos una nube de palabra de las 3 mejores peliculas valoradas y de las 3 peores valoradas.

# primero ordenamos el dataframe por la media de valoración de forma descendente descendente

medias_por_pelicula_ordenado <- medias_por_pelicula %>%
  arrange(desc(media_review_rate))

# la pelicula mejor valorada
head(medias_por_pelicula_ordenado, n=1)

# la pelicula peor valorada
tail(medias_por_pelicula_ordenado, n=1)

# Mejor pelicula valorada: El Bola(7,52)

#Vamos a realizar nube de datos

# seleccionamos pelicula

nombre_pelicula1 <- "El bola"

# filtramos el data frame solo para obtener las filas de "El bola"

pelicula_elbola <- Peliculas[Peliculas$film_name == nombre_pelicula1, ]

# Verificar el resultado

head(pelicula_elbola)

# creamos el corpus a partir de review_text
# Crear el corpus usando quanteda

corpus_elbola <- corpus(pelicula_elbola$review_text)

# Verificar el contenido del corpus
summary(corpus_elbola, 5)  # Resumen de los primeros 5 documentos del corpus


# Crear tokens y aplicar transformaciones
tokens_elbola <- tokens(corpus_elbola, 
                 remove_punct = TRUE,   # eliminamos signos de puntuación
                 remove_numbers = TRUE) %>%  # eliminamos números
  tokens_tolower() %>%  # transformas todo a letras minúsculas
  tokens_remove(stopwords("spanish")) %>%  # eliminamos las palbras que no aportan valor, aquí ponemos por ejmeplo las conjunciones o preposiciones del español como y, en,etc.. ya que en si no aportan nada de valor a lo que se busca
  tokens_wordstem()  # reduce la palabra a su propia raiz

# Verificar los tokens
print(tokens_elbola[1:5])  # mostramos los 5 primeros tokens

# creamos un Document-Feature Matrix (dfm) 
dfm_elbola <- dfm(tokens_elbola)

# Verificar el dfm
print(dfm_elbola)

# Sumar las frecuencias de cada palabra

words_elbola <- topfeatures(dfm_elbola, n = nfeat(dfm_elbola))

# Convertir a un dataframe

df_elbola <- data.frame(word = names(words_elbola), freq = words_elbola)

# Verificar el dataframe
head(df_elbola)  # Mostrar las primeras filas del dataframe

# Generar la nube de palabras
set.seed(1234)  # Para reproducibilidad
wordcloud(words = df_elbola$word, freq = df_elbola$freq, min.freq = 2,
          max.words = 200, random.order = FALSE, rot.per = 0.35,
          colors = brewer.pal(8, "Dark2"))


# Peor película valorada: Torrente(3,52)

#Vamos a realizar nube de datos

# seleccionamos pelicula

nombre_pelicula2 <- "Torrente 3"

# filtramos el data frame solo para obtener las filas de "El bola"

pelicula_torrente <- Peliculas[Peliculas$film_name == nombre_pelicula2, ]

# Verificar el resultado

head(pelicula_torrente)

# creamos el corpus a partir de review_text
# Crear el corpus usando quanteda

corpus_torrente <- corpus(pelicula_torrente$review_text)

# Verificar el contenido del corpus
summary(corpus_torrente, 5)  # Resumen de los primeros 5 documentos del corpus


# Crear tokens y aplicar transformaciones
tokens_torrente <- tokens(corpus_torrente, 
                        remove_punct = TRUE,   # Eliminar puntuación
                        remove_numbers = TRUE) %>%  # Eliminar números
  tokens_tolower() %>%  # Convertir a minúsculas
  tokens_remove(stopwords("spanish")) %>%  # Eliminar stopwords
  tokens_wordstem()  # Aplicar stemming

# Verificar los tokens
print(tokens_torrente[1:5])  # Mostrar los primeros 5 tokens

# Crear un Document-Feature Matrix (dfm)

dfm_torrente <- dfm(tokens_torrente)

# Verificar el dfm
print(dfm_torrente)

# Sumar las frecuencias de cada palabra

words_torrente <- topfeatures(dfm_torrente, n = nfeat(dfm_torrente))

# Convertir a un dataframe

df_torrente <- data.frame(word = names(words_torrente), freq = words_torrente)

# Verificar el dataframe
head(df_torrente)  # Mostrar las primeras filas del dataframe

# Generar la nube de palabras
set.seed(1234)  # Para reproducibilidad
wordcloud(words = df_torrente$word, freq = df_torrente$freq, min.freq = 2,
          max.words = 200, random.order = FALSE, rot.per = 0.35,
          colors = brewer.pal(8, "Dark2"))



