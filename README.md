# **Análisis de Sentimientos en Redes Sociales para la mejora de la experiencia en Palma de Mallorca: Caso del Ocio Nocturno**

## Grupo : Cristina, Marcos, Romane

Hoy en día las redes sociales juegan un papel fundamental en la industria del turismo, ya que mediante estas los turistas comparten sus experiencias, opiniones y recomendaciones en plataformas como Twitter, Instagram, TripAdvisor o blogs personales. Nuestra propuesta tiene como objetivo utilizar técnicas de análisis de sentimientos en redes sociales para comprender mejor la experiencia turística y mejorar los servicios ofrecidos en el sector del ocio nuctorno (bares, clubs, discotecas). Ya que consideramos que sera una fuente mas prolifera de opiniones de los usuarios, ya que es uan de las bases de la economia de la zona.

*Ademas, es uno de los servicios mas ofertados y con mayor demanda en los viajes turisticos, de hecho, es un factor de interés para las personas que viajan a esa zona en concreto, por lo que podria ser un indicador muy fiable de la opinión de los usuarios.*

#### Con el fin de no perdernos en un mar de datos y expresiones múltiples de sentimientos por
parte de los turistas, hemos decidido trabajar sobre una plataforma en particular, Google Review, la cual nos parece la más adecuada para nuestro proyecto. En efecto, nos permite recoger datos más simplemente para analizarlos, y es una de las plataformas más usadas para dar opiniones sobre actividades y lugares turísticos. 


## OBJETIVOS
El objetivo principal es analizar el sentimiento de los usuarios que deciden dejar reseñas en la
plataforma de Google Reviews respecto a su percepción de Mallorca, para identificar áreas de
mejora en la experiencia del turista en el ámbito del sector servicios.
Por otro lado como objetivos secundarios trataremos de:
- Evaluar la satisfacción del cliente con los servicios ofrecidos por la región,
mediante los costes y las actividades que ofrece la región.
- Identificar tendencias emergentes en el turismo, analizando la experiencia de las
actividades realizadas por el turista podremos observar qué actividades están en auge
y cuáles son vigentes.
- Predecir la demanda turística futura, es decir, a través de los datos podremos ver
cómo está variando la demanda turística en las diferentes zonas de ocio de Mallorca.


## OBTENCION Y ANÁLISIS DE LOS DATOS

Para la recopilación de los datos utilizaremos APIs públicas y herramientas de web scraping.
Estos datos constarán de publicaciones, comentarios Y estrellas que den en las reseñas de los lugares de ocio nocturno de la zona del paseo maritimo de MAllorca.

A la hora de analizar los datos se aplicarán técnicas de procesamiento de lenguaje natural
(NLP) para analizar el sentimiento de las publicaciones, comentarios y reseñas. También se
utilizarán algoritmos de aprendizaje automático para clasificar las publicaciones en categorías
como positivas, negativas o neutrales. Y, por último, los resultados se presentarán mediante
Rmarkdown o Tableau para reflejar las tendencias y patrones encontrados en los datos.

### RESULTADOS
Los resultados que esperamos obtener nos ayudarán a entender la percepción de los usuarios
sobre su experiencia turística en Mallorca, y que factores consideran deberían mejorarse así
como aquellos que están mejor valorados.
Todo ello permitirá a las empresas y destinos turísticos tomar decisiones informadas para
mejorar la experiencia del usuario. Además, se espera identificar tendencias emergentes y
áreas de mejora que puedan aprovecharse para atraer a más turistas y aumentar la satisfacción
del cliente.

install.packages("usethis") library("usethis")

usethis:: create_github_token()

gitcreds:: gitcreds_set()

<<<<<<< Updated upstream
usethis:: use_git()
=======
1 

>>>>>>> Stashed changes
