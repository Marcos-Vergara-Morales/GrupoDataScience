##Datos Peli

#Instalar paquetes

install.packages("tidyr")
install.packages("dplyr")
install.packages("readr")
install.packages("stringr")
install.packages("RcppArmadillo")


# Cargar paquetes 
library(readr)
library(tidyr)
library(dplyr)
library(stringr)
library(quanteda)
library(RcppArmadillo)
library(RcppParallel)


##1º paso.Importar Datos

reviews_filmaffinity <- read_csv("C:/Users/crist/Downloads/reviews_filmaffinity.csv", 
                                 col_types = cols(`film_name||gender||film_avg_rate||review_rate||review_title||review_text` = col_character()))

problems(reviews_filmaffinity)
View(reviews_filmaffinity)

#2º paso. Ver datos y limpiar datos

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



#3º paso. Visualizar datos y comparar

##PAQUETE VISUALIZACIÓN DE DATOS

install.packages("ggplot2")

library(ggplot2)

# A) GRÁFICOS DE BARRAS 

# Distribución de nota/calificacion de reseña
ggplot(Peliculas, aes(x = review_rate)) +
  geom_histogram(binwidth = 1, fill = "blue", color = "black") +
  labs(title = "Distribución de Puntuaciones de Reseñas",
       x = "Calificación de Reseña",
       y = "Frecuencia")

# Interpretacion de los datos del gráfico
# En este gráfico se aprecia claramente que la puntuacion de las reseñas se agrupa principalmente en los valores de 5 a 8, tambien observamos algunos picos en valores más bajos que representan las peores reseñas.

# Media de nota/calificacion por película
ggplot(medias_por_pelicula, aes(x = reorder(film_name, media_review_rate), y = media_review_rate)) +
  geom_bar(stat = "identity", fill = "blue", color = "black") +
  coord_flip() +
  labs(title = "Media de Puntuaciones por Película",
       x = "Nombre de Película",
       y = "Media de Calificación")

# Interpretacion del gráfico: 
# En el grafico podemos observar que las peliculas con mejor puntuacion ( mas de un 6), son generalmente del género dramático (Mientras dure la guerra, El laberinto del fauno), tambien son peliculas galardonadas por la critica y que tuvieron un exito fulminante en taquilla, lo cual va en la linea de una de nuestras hipotesis sobre las reseñas en peliculas taquilleras.

# Comparación de nota/calificacion por Género
ggplot(Peliculas, aes(x = gender, y = review_rate)) +
  geom_boxplot() +
  labs(title = "Comparación de Puntuaciones por Género",
       x = "Género",
       y = "Calificación de Reseña")
# Intrepretación del gráfico
# El género que mayores puntuacion recibe es el fantastico, seguido del Drama, el terror, el thriller, el cine negro y el de aventuras.
# Hay más valoraciones en el cine de Aventuras, la comedia, el musical y el romance, pero en estos dos ultimos su puntuacion es mucho más baja.
# Parece haber menos reseñas sobre animación y cine negro


# B) NUBES DE PALABRAS
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
library(ggplot2)

## Primero vamos a revisar si dentro de nuestra variable review_text hay opiniones vacíos

# Verificamos si hay textos vacíos o nulos en review_text

num_NA <- sum(is.na(Peliculas$review_text))  # Contar NA

num_EMPTY <- sum(Peliculas$review_text == "")  # Contar cadenas vacías

# Hacemos el recuento con la función cat()
cat("Número de opiniones nulas:", num_NA, "\n")
cat("Número de opiniones vacías:", num_EMPTY, "\n")

# Aunque no haya opiniones nulas ni vacías eliminamos filas con review_text vacío o nulo

Peliculas <- Peliculas[!(is.na(Peliculas$review_text) | Peliculas$review_text == ""), ]


#Construimos corpus a partir de la varible review_text(usamos paquete "quanteda" ya que sirve manejar grandes conjuntos de datos)

corpus_todas_pelis <- corpus(Peliculas, text_field = "review_text")

# Verificamos el contenido del corpus
summary(corpus_todas_pelis, 5)  # Resumen de los primeros 5 documentos del corpus

# Crear tokens y aplicar transformaciones

tokens_todas_pelis <- tokens(corpus_todas_pelis, 
                             remove_punct = TRUE,   # Eliminar puntuación
                             remove_numbers = TRUE) %>%  # Eliminar números
                    tokens_tolower() %>%  # Convertir a minúsculas
                tokens_remove(stopwords("spanish")) %>%  # Eliminar stopwords
             tokens_wordstem()  # reduce su palabra a raiz

# Verificar los tokens
print(tokens_todas_pelis[1:5])  # Mostrar los primeros 5 tokens

# Creamos un Document-Feature Matrix (dfm), de esta forma cuantificamos los textos palabras

dfm_todas_pelis <- dfm(tokens_todas_pelis)

# Sumamos las frecuencias de cada palabra directamente desde el dfm
words_todas_pelis <- topfeatures(dfm_todas_pelis, n = nfeat(dfm_todas_pelis)) #extraemos todas las palabras y se odenan descendente

# Convertimos a un dataframe, para facilitar manipulación
df_todas_pelis <- data.frame(word = names(words_todas_pelis), freq = words_todas_pelis)

# Verificamos el dataframe
head(df_todas_pelis)  # Mostrar las primeras filas del dataframe

# Generar la nube de palabras
set.seed(1234)
wordcloud(words = df_todas_pelis$word, freq = df_todas_pelis$freq, min.freq = 2, 
          max.words = 200, random.order = FALSE, rot.per = 0.35,
          colors = brewer.pal(8, "Dark2"))

# Interpretacion de la nube de palabras:
# Las palabras más repetidas en los comentarios sobre peliculas son en primer lugar la palabra película, lo cual tiene sentido.
# Por otro lado, destacan palabras como cine, personaje, bien. También aunque en menor medida aparecen lso terminos: buena, español, actor,  guión, aunque, mejor, menos.
# A simple vista, no aparece ningun termino fuera del contexto de la valoración de peliculas



## Ahora haremos una nube de palabra de la pelicula mejor valorada y de la peor valorada.

# Primero Ordenamos el dataframe por la media de valoración de forma descendente descendente

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

# Creamos el corpus a partir de review_text
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

# Creamos un Document-Feature Matrix (dfm) 
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

# Interpretación nube de palabra de la pelicula mejor valorada y de la peor valorada
# En primer lugar, observamos que nuevamente la palabras más utilizada es pelicula, seguida de bola, ballesta y padre. Lo cual aparentemente no tien sentido sino lo comparamos con el argumento de las peliculas analizadas.
# En segundo lugar, aparecen terminos como: juan, mejor, cine, historia y jose. Estos estan relacionados nuevamente con la tematica y el argumento de ambas peliculas
# En terminos generales, no se aprecia ninguna palabras especialmente relevante en esta nube.



# Peor película valorada: Torrente(3,52)

#Vamos a realizar nube de datos sobre la peor pelicula

#Seleccionamos pelicula

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
# 
#Interpretación nube de palabras de la peor pelicula: 
# En este caso, las palabras más utilizadas son pelicula y torrente, lo cual tiene sentido si observamos la pelicula que se esta analizando
# También se utiliza mucho la palabras segura, tercera parte, santiago, personaje y cine
# Nuevamente no se encuentran palabras destacables en el conjunto. 


# C) CORRELACION Y PRUEBAS PARAMETRICAS. ANOVA
# Finalmente vamos a establecer uan comparacion entre la variable review rate y la longitud de las reseñas, con el fin de observar si existe relacion entre la nota otorgada a la pelicula y la longitud de la reseña
# Calcular la longitud del texto de la reseña:

# 1.Añadir una columna que mida la longitud de review_text.
# Separar la columna en múltiples columnas
reviews_filmaffinity_separado <- reviews_filmaffinity %>%
  separate("film_name||gender||film_avg_rate||review_rate||review_title||review_text", 
           into = c("film_name", "gender", "film_avg_rate", "review_rate", "review_title", "review_text"), 
           sep = "\\|\\|", 
           remove = TRUE)

# Transformación a variables numéricas
reviews_filmaffinity_separado <- reviews_filmaffinity_separado %>%
  mutate(film_avg_rate = as.numeric(film_avg_rate),
         review_rate = as.numeric(review_rate)) 

# Eliminar la columna film_avg_rate (todos valores NA)
reviews_filmaffinity_separado <- reviews_filmaffinity_separado %>%
  select(-film_avg_rate)

# Eliminar NA en la columna review_rate
reviews_filmaffinity_separado <- reviews_filmaffinity_separado[!is.na(reviews_filmaffinity_separado$review_rate), ]

# Añadir una columna para la longitud del texto de la reseña
reviews_filmaffinity_separado <- reviews_filmaffinity_separado %>%
  mutate(review_text_length = nchar(review_text))

# 2.Calcular la correlación entre review_rate y review_text_length:
# Calcular la correlación de Pearson entre review_rate y review_text_length
correlacion <- cor(reviews_filmaffinity_separado$review_rate, reviews_filmaffinity_separado$review_text_length, method = "pearson")
p_value <- cor.test(reviews_filmaffinity_separado$review_rate, reviews_filmaffinity_separado$review_text_length)$p.value

# 3.Usar la correlación de Pearson para evaluar la relación.
# Mostrar resultados
cat("Correlación de Pearson entre review_rate y review_text_length:", correlacion, "\n")
cat("Valor p:", p_value, "\n")


# REsultados de la prueba de Pearson
# Los resultados, Correlación de Pearson: 0.045519
# Este valor es muy cercano a 0, lo que indica una relación muy débil entre la longitud de la reseña (review_text_length) y la calificación de la reseña (review_rate). En otras palabras, no parece haber una relación lineal fuerte entre estas dos variables
# Por otro lado, con un valor de p=2,40987e-05 que es extremadamente bajo, mucho menor que el umbral comúnmente utilizado de 0.05. Esto sugiere que, a pesar de la baja correlación, la relación observada entre la longitud de la reseña y la calificación es estadísticamente significativa.
# En definitiva, Aunque la correlación es muy débil (0.045519), la relación es estadísticamente significativa (valor p ≈ 0.0000241). Esto indica que existe una relación entre la longitud del texto de la reseña y la calificación, pero esta relación es muy tenue y probablemente no tenga un gran impacto práctico.
# en otras palabras, todo parece indicar que las personas cuando opinan y valoran un pelicula en funcion de la nota que le den, sobre todo en el caso de las notas altas y bajas tengan una longitud de reseña diferente, aunque esta tendencia es debil y no podemos asegurar que no se deba a otro factores.

# Como queda esa incognita en el aire, decidimo hacer una comparacion mas, queremos analizar analizar si el género de la película influye en la longitud de la reseña y en la calificación de la reseña
# Hacemos prueba de comparacion de medias y ANOVA
# primero limpiamos los datos de nuevo para garantizar que salga bien la prueba
# Verificar y limpiar valores NA
reviews_filmaffinity_separado <- reviews_filmaffinity_separado %>%
  filter(!is.na(gender), !is.na(review_text_length), !is.na(review_rate))

# 1. Realizar la prueba de ANOVA con las variables
# ANOVA para la longitud de la reseña por género
anova_length <- aov(review_text_length ~ gender, data = reviews_filmaffinity_separado)
summary(anova_length)

# ANOVA para la calificación de la reseña por género
anova_rate <- aov(review_rate ~ gender, data = reviews_filmaffinity_separado)
summary(anova_rate)

# Reiniciar el dispositivo gráfico
while (!is.null(dev.list())) dev.off()


# Hacemos representaciones graficas para que se aprecie mejor la relacion entre las variables

# Gráfico de barras para la longitud de la reseña por género
ggplot(reviews_filmaffinity_separado, aes(x = gender, y = review_text_length)) +
  stat_summary(fun = mean, geom = "bar", fill = "blue", color = "black") +
  labs(title = "Longitud Promedio de la Reseña por Género de Película",
       x = "Género",
       y = "Longitud Promedio de la Reseña")
# Interpretación del gráfico:
# Se observa que las reseñas con mayor longitud son las de las peliculas de los géneros de Animación, Aventuras y cine negro.
# Seguidas de las de Drama y Thriller, el género con la mayor longitud de reseña es el cine negro, si comparamos esto con los rsultados de las gráficas anteriores, todo apunta a que los géneros con reseñas más largas son aquellos que tienen las peores o mejores puntuaciones, como sugiere una de nuestras hipótesis 
# Los musicales son los que tienen menor longitud en sus reseñas

# Gráfico de barras para la calificación de la reseña por género
ggplot(reviews_filmaffinity_separado, aes(x = gender, y = review_rate)) +
  stat_summary(fun = mean, geom = "bar", fill = "blue", color = "black") +
  labs(title = "Calificación Promedio de la Reseña por Género de Película",
       x = "Género",
       y = "Calificación Promedio de la Reseña")
# Interpretación del gráfico:
# El cine negro, el cine Fantastico, el Drama, el terror y el thrille son lso géneros con las mayores puntuaciones promedio en las reseñas
# el cine Fantastico es el que tiene la mejor puntuacion 

## Ejemplos gráficos de Violin (mejora de al visualización)
# Gráfico de violín para la longitud de la reseña por género
ggplot(reviews_filmaffinity_separado, aes(x = gender, y = review_text_length)) +
  geom_violin(fill = "blue") +
  labs(title = "Distribución de la Longitud de la Reseña por Género de Película",
       x = "Género",
       y = "Longitud de la Reseña")

# Gráfico de violín para la calificación de la reseña por género
ggplot(reviews_filmaffinity_separado, aes(x = gender, y = review_rate)) +
  geom_violin(fill = "blue") +
  labs(title = "Distribución de la Calificación de la Reseña por Género de Película",
       x = "Género",
       y = "Calificación de la Reseña")

# Interpretacion de los resultados: 

# 1.Resultados prueba ANOVA longitud de reseña por género
# Observamos primero lso resultados de la prueba ANOVA para la longitud de la reseña por género
# Podemos apreciar, los grados de libertad, los residuos, y el p valor, el cual es <2e-16, que es extremadamente pequeño. Este valor indica la probabilidad de que las diferencias al azar y al ser menos al 0,05, el resultado es estadisticamente significativo
# Dicho valor de p sugiere que hay una diferencia significativa entre los géneros en términos de la longitud de la reseña.


# 2. Resultados prueba ANOVA
# Observamos los grados de libertad, los residuos, el valor F(determinar la diferencia entre medias) y el P valor
# El F valor es de 82.74, el P valor es <2e-16, que es extremadamente pequeño, lo cual indica que es significativo estaditicamente al ser menor al 0,05.
# En definitiva, el P valor indica que hay una diferencia significativa entre los géneros en términos de la calificación de la reseña.

# CONCLUSIONES GENERALES DE LAS PRUEBAS:
# El valor F alto y el valor p extremadamente bajo indican que la longitud de las reseñas varía significativamente entre los diferentes géneros de películas
# Por otro lado, dichos valores  indican que las calificaciones de las reseñas también varían significativamente entre los diferentes géneros de películas.
