# **Análisis de Sentimientos en Redes Sociales para la mejora de la experiencia en Palma de Mallorca: Caso del Ocio Nocturno**


install.packages("usethis") library("usethis")

usethis:: create_github_token()

gitcreds:: gitcreds_set()

<<<<<<< Updated upstream
usethis:: use_git()

1 

>>>>>>> Stashed changes


git status

# **Análisis de Sentimientos en Valoraciones de Películas Españolas: Patrones y Tendencias en la Evaluación de los Usuarios**

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
4. Analizar los sentimientos expresados en las reseñas de los usuarios con el fin de comprobar si existe alguna tendencia en la opinion en funcion de la categoria de la pelicula.

## Métodos y Técnicas de Análisis

Las técnicas y métodos de datos para la extracción de nuestro datos son:

En primer lugar se hará un Análisis Exploratorio de Datos (EDA), donde se realizarán:

  - Histogramas de Valoraciones: Se crearán histogramas para visualizar la distribución de las valoraciones (review_rate), lo que permitirá identificar la frecuencia de diferentes calificaciones y detectar posibles sesgos en las valoraciones. Este análisis inicial ayudará a comprender cómo se distribuyen las opiniones de los usuarios y a identificar tendencias generales en las calificaciones.
  
  - Boxplots de Valoraciones por Género: Se utilizarán boxplots para comparar las valoraciones (review_rate) entre diferentes géneros cinematográficos (gender_film), proporcionando información sobre las preferencias de los espectadores según el género de la película. Esta técnica permitirá identificar qué géneros tienden a recibir calificaciones más altas o más bajas, y si existen diferencias significativas en las valoraciones según el tipo de película.
  
  - Scatter Plots para Analizar la Relación entre Media de la Película y Valoración Individual: Se crearán scatter plots para investigar la relación entre la media de la película (film_average_rate) y la valoración individual (review_rate). Este análisis ayudará a determinar si existe una correlación entre la calidad percibida de una película y la satisfacción del espectador expresada en la valoración. La visualización de esta relación permitirá identificar si las películas con mejores calificaciones promedio tienden a recibir valoraciones más altas de manera consistente.

Análisis de Sentimientos:

  - Utilizando técnicas de procesamiento de lenguaje natural (NLP), se analizarán los textos de las reseñas (review_text) para extraer los sentimientos expresados en ellas. Este análisis permitirá comprender mejor las emociones y opiniones de los usuarios respecto a las películas y cómo estas influencian sus valoraciones.

Finalmente tras utilizar los metodos de comparación y contrastacion de datos comprobaremos la veracidad de las hipótesis y realizaremos un análisis sociológico de los resultados para poder establecer alguna conclusión.

## Resultados Esperados y Relevancia:

A través de las técnicas de visualización y análisis de datos se espera obtener una comprensión más profunda de cómo las características que estudiaremos de las películas influyen en las valoraciones de los usuarios. Mediante los histogramas trataremos de proporiconar una visión clara de la distribución de las calificaciones, revelando de esta forma si existen picos en determinadas puntuaciones o si las valoraciones tienden a concentrarse en un rango concreto.

Los boxplots permitirán observar la variabilidad en las calificaciones dentro de cada género y compararlas entre sí. Esto proporcionará información enriquecedora sobre las expectativas y percepciones de los espectadores en relación a distintos tipos de películas. Además, ayudará a identificar los géneros que reciben valoraciones altas o bajas, ofreciendo así una perspectiva sobre las tendencias de preferencia de los usuarios.

Los scatter plots permitirán explorar la relación entre la media de la película y las valoraciones individuales, proporcionando información sobre si las calificaciones promedio pueden predecir las valoraciones de los usuarios. Mediante este análisis se buscará de identificar patrones y correlaciones, ofreciendo una base para desarrollar modelos predictivos que puedan anticipar la satisfacción de los espectadores en función de las características de las películas.

## Conclusión

Este análisis exploratorio proporcionará información valiosa para comprender e identificar las tendencias y patrones en las valoraciones de las películas españolas realizadas por los usuarios. Al analizar cómo diferentes características de las películas influyen en las valoraciones de los espectadores, podemos obtener insights sobre sus preferencias y percepciones.

En resumen, este estudio no solo contribuirá al conocimiento existente sobre valoraciones de películas, sino que también podrá ofrecer información práctica para cineastas, productores y distribuidores. Con estos hallazgos, podrán tomar decisiones informadas para mejorar la recepción y el éxito de sus películas en el mercado. La combinación de análisis de datos y técnicas de visualización permitirá una comprensión más clara del comportamiento de los usuarios, proporcionando una base sólida para futuras investigaciones y mejoras en la industria cinematográfica española.


