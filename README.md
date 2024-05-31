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

1 

>>>>>>> Stashed changes


git status

# **Análisis Exploratorio de Valoraciones de Películas Españolas: Perspectivas de los Usuarios y Tendencias de Sentimientos**

## Grupo : Cristina, Marcos, Romane

En los últimos años, la minería de datos y el análisis de sentimiento han cobrado importancia debido a la gran cantidad de comentarios que se escriben en Internet a diario por parte de millones de usuarios de todo el mundo a través de blogs, redes sociales o foros. Este fenómeno ha cambiado en cierta manera la forma de consumir, donde ahora los individuos, antes de gastar su dinero, leen los comentarios u opiniones de lo que quieren consumir, comprar, alquilar, etc.
A razón de esto, el presente estudio trata de analizar de forma exhaustiva las valoraciones de películas españolas, con el objetivo de analizar patrones significativos y tendencias subyacentes en las opiniones de los usuarios. Nuestra investigación abordará diversas variables, tales como el nombre de la película, el género de esta, la media de valoración, la puntuación de la reseña, el título de la reseña y el texto de la reseña, proporcionando una comprensión profunda del comportamiento de los usuarios al evaluar películas.
Datos:
Los datos utilizados en este estudio se han extraído de la plataforma Kaggle, una fuente de base de datos para proyectos de Data Science. Nuestro conjunto de datos escogido incluye información detallada sobre las valoraciones de películas españolas, nombre de la película, género, etc. Permitiendo de esta forma un análisis robusto e íntegro.

## Objetivos 

En cuanto a los objetivos de nuestro estudio estos tratarán de:
1. Identificar las distribuciones de las valoraciones.
2. Comparar valoraciones por género de película.
3. Explorar la relación entre la media de la película y la valoración individual.
4. Analizar los sentimientos expresados en las reseñas de los usuarios.

## Métodos y Técnicas de Análisis

Las técnicas y métodos de datos para la extracción de nuestro datos son:

En primer lugar se hará un Análisis Exploratorio de Datos (EDA), donde se realizarán:

  - Histogramas de Valoraciones: Se crearán histogramas para visualizar la distribución de las valoraciones (review_rate), lo que permitirá identificar la frecuencia de diferentes calificaciones y detectar posibles sesgos en las valoraciones. Este análisis inicial ayudará a comprender cómo se distribuyen las opiniones de los usuarios y a identificar tendencias generales en las calificaciones.
  
  - Boxplots de Valoraciones por Género: Se utilizarán boxplots para comparar las valoraciones (review_rate) entre diferentes géneros cinematográficos (gender_film), proporcionando información sobre las preferencias de los espectadores según el género de la película. Esta técnica permitirá identificar qué géneros tienden a recibir calificaciones más altas o más bajas, y si existen diferencias significativas en las valoraciones según el tipo de película.
  
  - Scatter Plots para Analizar la Relación entre Media de la Película y Valoración Individual: Se crearán scatter plots para investigar la relación entre la media de la película (film_average_rate) y la valoración individual (review_rate). Este análisis ayudará a determinar si existe una correlación entre la calidad percibida de una película y la satisfacción del espectador expresada en la valoración. La visualización de esta relación permitirá identificar si las películas con mejores calificaciones promedio tienden a recibir valoraciones más altas de manera consistente.

Análisis de Sentimientos:

  - Utilizando técnicas de procesamiento de lenguaje natural (NLP), se analizarán los textos de las reseñas (review_text) para extraer los sentimientos expresados en ellas. Este análisis permitirá comprender mejor las emociones y opiniones de los usuarios respecto a las películas y cómo estas influencian sus valoraciones.


## Resultados Esperados y Relevancia:

A través de las técnicas de visualización y análisis de datos se espera obtener una comprensión más profunda de cómo las características que estudiaremos de las películas influyen en las valoraciones de los usuarios. Mediante los histogramas trataremos de proporiconar una visión clara de la distribución de las calificaciones, revelando de esta forma si existen picos en determinadas puntuaciones o si las valoraciones tienden a concentrarse en un rango concreto.

Los boxplots permitirán observar la variabilidad en las calificaciones dentro de cada género y compararlas entre sí. Esto proporcionará información enriquecedora sobre las expectativas y percepciones de los espectadores en relación a distintos tipos de películas. Además, ayudará a identificar los géneros que reciben valoraciones altas o bajas, ofreciendo así una perspectiva sobre las tendencias de preferencia de los usuarios.

Los scatter plots permitirán explorar la relación entre la media de la película y las valoraciones individuales, proporcionando información sobre si las calificaciones promedio pueden predecir las valoraciones de los usuarios. Mediante este análisis se buscará de identificar patrones y correlaciones, ofreciendo una base para desarrollar modelos predictivos que puedan anticipar la satisfacción de los espectadores en función de las características de las películas.

## Conclusión

Este análisis exploratorio proporcionará información valiosa para comprender e identificar las tendencias y patrones en las valoraciones de las películas españolas realizadas por los usuarios. Al analizar cómo diferentes características de las películas influyen en las valoraciones de los espectadores, podemos obtener insights sobre sus preferencias y percepciones.
En resumen, este estudio no solo contribuirá al conocimiento existente sobre valoraciones de películas, sino que también podrá ofrecer información práctica para cineastas, productores y distribuidores. Con estos hallazgos, podrán tomar decisiones informadas para mejorar la recepción y el éxito de sus películas en el mercado. La combinación de análisis de datos y técnicas de visualización permitirá una comprensión más clara del comportamiento de los usuarios, proporcionando una base sólida para futuras investigaciones y mejoras en la industria cinematográfica española.


