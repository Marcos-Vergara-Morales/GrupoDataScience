# **Análisis de Sentimientos en Valoraciones de Películas Españolas: Patrones y Tendencias en la Evaluación de los Usuarios**

## Grupo : Cristina, Marcos, Romane

En los últimos años, la minería de datos y el análisis de sentimiento han cobrado importancia debido a la gran cantidad de comentarios que se escriben en Internet a diario por parte de millones de usuarios de todo el mundo a través de blogs, redes sociales o foros. Este fenómeno ha cambiado en cierta manera la forma de consumir, donde ahora los individuos, antes de gastar su dinero, leen los comentarios u opiniones de lo que quieren consumir, comprar, alquilar, etc.

A razón de esto, el presente estudio trata de analizar de forma exhaustiva las valoraciones de películas españolas, con el objetivo de analizar patrones significativos y tendencias subyacentes en las opiniones de los usuarios. Nuestra investigación abordará diversas variables, tales como el nombre de la película, el género de esta, la media de valoración, la puntuación de la reseña, el título de la reseña y el texto de la reseña, proporcionando una comprensión profunda del comportamiento de los usuarios al evaluar películas.

Datos: Los datos utilizados en este estudio se han extraído de la plataforma Kaggle, una fuente de base de datos para proyectos de Data Science. Nuestro conjunto de datos escogido incluye información detallada sobre las valoraciones de películas españolas, nombre de la película, género, etc. Permitiendo de esta forma un análisis robusto e íntegro.

## Hipótesis

Nuestra hipotesis general es que la opinion de los usuarios influye en el consumo de determinadas peliculas, es decir, según el tipo y la cantidad de valoraciones que tenga una pelicula se puede extrapolar el nivel de exito de la misma.

Por otro lado, también consideramos que hay determinados géneros que son mejor valorados que otros por su temática, en otras palabras, hay mayor aceptación hacia ciertos géneros por parte del público y esto se ve reflejado en sus opiniones.

Además tambien esperamos encontrar mayor información en la reseña escrita que en la puntuación general, ya que consideramos que esta será más especifica y detallada puesto que el ratio se pondera respecto al total.

## Objetivos

La idea de llevar a cabo este proyecto surge ante la inquietud que nos generaba determinar si los datos reflejan como el publico basa su consumo cinematografico en las reseñas y valoraciones de otros usuarios en internet, o por el contrario, no se aprecia influencia de la opinión general.

En cuanto a los objetivos especificos de nuestro estudio estos tratarán de:

1\. Identificar las distribuciones de las valoraciones.

2\. Comparar valoraciones por género, longitud de la reseña y puntuación de película.

3\. Explorar la relación entre la media de la película y la valoración individual.

4\. Analizar los sentimientos expresados en las reseñas de los usuarios con el fin de comprobar si existe alguna tendencia en la opinion en funcion de la categoria de la pelicula.

## Métodos y Técnicas de Análisis

Las técnicas y métodos de datos para la extracción de nuestro datos son:

En primer lugar se hará un Análisis Exploratorio de Datos (EDA), donde se realizarán:

-   Histogramas de Valoraciones y gráficos de cajas: Se crearán histogramas para visualizar la distribución de las valoraciones (review_rate), lo que permitirá identificar la frecuencia de diferentes calificaciones y detectar posibles sesgos en las valoraciones. Este análisis inicial ayudará a comprender cómo se distribuyen las opiniones de los usuarios y a identificar tendencias generales en las calificaciones.

-   Boxplots de Valoraciones por Género: Se utilizarán boxplots para comparar las valoraciones (review_rate) entre diferentes géneros cinematográficos (gender_film), proporcionando información sobre las preferencias de los espectadores según el género de la película. Esta técnica permitirá identificar qué géneros tienden a recibir calificaciones más altas o más bajas, y si existen diferencias significativas en las valoraciones según el tipo de película.

-   Scatter Plots para Analizar la Relación entre Media de la Película y Valoración Individual: Se crearán scatter plots para investigar la relación entre la media de la película (film_average_rate) y la valoración individual (review_rate). Este análisis ayudará a determinar si existe una correlación entre la calidad percibida de una película y la satisfacción del espectador expresada en la valoración. La visualización de esta relación permitirá identificar si las películas con mejores calificaciones promedio tienden a recibir valoraciones más altas de manera consistente.

-   Correlacion de Pearson y Prueba ANOVA: ambas se utilizaran para comparar y analizar variables, como review rate y review_text_length con el fin de establecer si existe correlacion entre ambas, y la prueba ANOVA para examinar esas dos variables pero introduciendo la variable genero de las peliculas para comprobar si en funcion del genero varian las reseñas y la puntuacion, para ello crearemos una variable numerica (review_text_length) que nos permita llevar a cabo estas pruebas y realizaremos representaciones graficas con la funcion ggplot2, para que se aprecie mejor visualmente.

Análisis de Sentimientos:

-   Utilizando técnicas de procesamiento de lenguaje natural (NLP), se analizarán los textos de las reseñas (review_text) para extraer los sentimientos expresados en ellas. Este análisis permitirá comprender mejor las emociones y opiniones de los usuarios respecto a las películas y cómo estas influencian sus valoraciones.

Finalmente tras utilizar los metodos de comparación y contrastacion de datos comprobaremos la veracidad de las hipótesis y realizaremos un análisis sociológico de los resultados para poder establecer alguna conclusión.

## Resultados Esperados y Relevancia:

A través de las técnicas de visualización y análisis de datos se espera obtener una comprensión más profunda de cómo las características que estudiaremos de las películas influyen en las valoraciones de los usuarios. Mediante los histogramas trataremos de proporiconar una visión clara de la distribución de las calificaciones, revelando de esta forma si existen picos en determinadas puntuaciones o si las valoraciones tienden a concentrarse en un rango concreto.

Los boxplots permitirán observar la variabilidad en las calificaciones dentro de cada género y compararlas entre sí. Esto proporcionará información enriquecedora sobre las expectativas y percepciones de los espectadores en relación a distintos tipos de películas. Además, ayudará a identificar los géneros que reciben valoraciones altas o bajas, ofreciendo así una perspectiva sobre las tendencias de preferencia de los usuarios.

Los scatter plots permitirán explorar la relación entre la media de la película y las valoraciones individuales, proporcionando información sobre si las calificaciones promedio pueden predecir las valoraciones de los usuarios. Mediante este análisis se buscará de identificar patrones y correlaciones, ofreciendo una base para desarrollar modelos predictivos que puedan anticipar la satisfacción de los espectadores en función de las características de las películas.

Este análisis exploratorio proporcionará información valiosa para comprender e identificar las tendencias y patrones en las valoraciones de las películas españolas realizadas por los usuarios. Al analizar cómo diferentes características de las películas influyen en las valoraciones de los espectadores, podemos obtener insights sobre sus preferencias y percepciones.

En resumen, este estudio no solo contribuirá al conocimiento existente sobre valoraciones de películas, sino que también podrá ofrecer información práctica para cineastas, productores y distribuidores. Con estos hallazgos, podrán tomar decisiones informadas para mejorar la recepción y el éxito de sus películas en el mercado. La combinación de análisis de datos y técnicas de visualización permitirá una comprensión más clara del comportamiento de los usuarios, proporcionando una base sólida para futuras investigaciones y mejoras en la industria cinematográfica española.

## Análisis de los resultados

Nuestro analisis se centrara en la varibles que corresponden a la puntuación de las peliculas, el genero y la longitud de las reseñas, pues queremos comprobar si están relacionadas e indican uan tendencia en el consumo cinematografico del público.

Hemos utilizado diferentes representaciones gráficas, como histiogramas, gráficos de cajas, de violín y nubes de palabras, para comprobar la relación de la variables. Además hemos utilizado la prueba de correlación de Pearson y ANOVA para determinar la existencia de asociación en la variables y si cambian unas en función de las otras.

En cuanto a las representaciones visuales, a continuación analizaremos los diferentes gráficos que hemos obtenido y la información que se ha extraido de ellos:

1- Gráfico de barras.

Distribución de Puntuacions de Reseñas En este gráfico se aprecia claramente que la puntuacion de las reseñas se agrupa principalmente en los valores de 5 a 8, tambien observamos algunos picos en valores más bajos que representan las peores reseñas. Pero en terminos generales hay más reseñas positivas que negativas.

2- Gráfico de barras. Media de Puntuaciones por Pelicula

```{r}
ggplot(medias_por_pelicula, aes(x = reorder(film_name, media_review_rate), y = media_review_rate)) +
  geom_bar(stat = "identity", fill = "blue", color = "black") +
  coord_flip() +
  labs(title = "Media de Puntuaciones por Película",
       x = "Nombre de Película",
       y = "Media de Calificación")
```

En el grafico podemos observar que las peliculas con mejor puntuacion ( mas de un 6), son generalmente del género dramático (Mientras dure la guerra, El laberinto del fauno), tambien son peliculas galardonadas por la critica y que tuvieron un exito fulminante en taquilla, lo cual va en la linea de una de nuestras hipotesis principales, sobre las reseñas en peliculas taquilleras. Sin embargo, debemos comprobar si esto es cierto por lo que vamos a realizar más pruebas de contraste.

Las peliculas peor valoradas son las de los generos de comedia y románticas.

3- Gráfico de cajas.

```{r}
ggplot(Peliculas, aes(x = gender, y = review_rate)) +
  geom_boxplot() +
  labs(title = "Comparación de Puntuaciones por Género",
       x = "Género",
       y = "Calificación de Reseña")
```

El género que mayores puntuacion recibe es el fantastico, seguido del Drama, el terror, el thriller, el cine negro y el de aventuras. Hay más valoraciones en el cine de Aventuras, la comedia, el musical y el romance, pero en estos dos ultimos su puntuacion es mucho más baja. Parece haber menos reseñas sobre animación y cine negro.

4- Nubes de palabras
   a) Nube de palabras de los comentarios de las peliculas
   Las palabras más repetidas en los comentarios sobre peliculas son en primer lugar la palabra película, lo cual tiene sentido.
   Por otro lado, destacan palabras como cine, personaje, bien. También aunque en menor medida aparecen lso terminos: buena, español, actor,  guión, aunque, mejor, menos.
  A simple vista, no aparece ningun termino fuera del contexto de la valoración de peliculas.
  
  
  b) Nube de palabras pelicula mejor valorada y peor valorada
  En primer lugar, observamos que nuevamente la palabras más utilizada es pelicula, seguida de bola, ballesta y padre. Lo cual aparentemente no tien sentido sino lo comparamos con el argumento de las peliculas analizadas.
En segundo lugar, aparecen terminos como: juan, mejor, cine, historia y jose. Estos estan relacionados nuevamente con la tematica y el argumento de ambas peliculas
En terminos generales, no se aprecia ninguna palabras especialmente relevante en esta nube.

 c) Nube de palabras pelicula peor valorada
 En este caso, las palabras más utilizadas son pelicula y torrente, lo cual tiene sentido si observamos la pelicula que se esta analizando
También se utiliza mucho la palabras segura, tercera parte, santiago, personaje y cine
Nuevamente no se encuentran palabras destacables en el conjunto.

Como debemos precisar y trabajar con pruebas que demuestren estadisticamente relacion, ya que no se puede establecer relaciones solo mediante los gráficos, vamos a realizar dos pruebas parametricas y una de correlacion de las tres variables a estudiar.

CORRELACION Y PRUEBAS PARAMETRICAS. ANOVA
En primer lugar, aplicamos la Correlación de Pearson en las variables puntuacion y longitud de las reseñas. Los resultados son, una Correlación de Pearson: 0.045519
Este valor es muy cercano a 0, lo que indica una relación muy débil entre la longitud de la reseña (review_text_length) y la calificación de la reseña (review_rate). En otras palabras, no parece haber una relación lineal fuerte entre estas dos variables

Por otro lado, con un valor de p=2,40987e-05 que es extremadamente bajo, mucho menor que el umbral comúnmente utilizado de 0.05. Esto sugiere que, a pesar de la baja correlación, la relación observada entre la longitud de la reseña y la calificación es estadísticamente significativa.

En definitiva, Aunque la correlación es muy débil (0.045519), la relación es estadísticamente significativa (valor p ≈ 0.0000241). Esto indica que existe una relación entre la longitud del texto de la reseña y la calificación, pero esta relación es muy tenue y probablemente no tenga un gran impacto práctico.

En otras palabras, todo parece indicar que las personas cuando opinan y valoran un pelicula en funcion de la nota que le den, sobre todo en el caso de las notas altas y bajas tengan una longitud de reseña diferente, aunque esta tendencia es debil y no podemos asegurar que no se deba a otro factores.

Como hay cuestiones que siguen quedando en el aire y queremos concretar y definir mejor esa relación, vamos a añadir una variables más, el género de las peliculas. Dicha variable es categorica por lo que no podemos aplicar la correlación así que utilizamos ANOVA.

Aplicaremos la prueba ANOVA, primero comparando el género con la longitud de las reseñas y despues con la puntuacion. Los resultados de la primera prueba son:
- Observamos primero lso resultados de la prueba ANOVA para la longitud de la reseña por género.
Podemos apreciar, los grados de libertad, los residuos, y el p valor, el cual es <2e-16, que es extremadamente pequeño. Este valor indica la probabilidad de que las diferencias al azar y al ser menos al 0,05, el resultado es estadisticamente significativo
Dicho valor de p sugiere que hay una diferencia significativa entre los géneros en términos de la longitud de la reseña.

En cuanto a los resultados de la segunda prueba (género x puntuación):
- Observamos los grados de libertad, los residuos, el valor F(determinar la diferencia entre medias) y el P valor
El F valor es de 82.74, el P valor es <2e-16, que es extremadamente pequeño, lo cual indica que es significativo estaditicamente al ser menor al 0,05.
En definitiva, el P valor indica que hay una diferencia significativa entre los géneros en términos de la calificación de la reseña.

Las conclusiones generales a las que llegamos con las pruebas son, por un lado que El valor F alto y el valor p extremadamente bajo indican que la longitud de las reseñas varía significativamente entre los diferentes géneros de películas. Por otro lado, dichos valores  indican que las calificaciones de las reseñas también varían significativamente entre los diferentes géneros de películas.




## Conclusión
Nuestro proyecto aborda de manera integral cómo las valoraciones y opiniones de los usuarios en línea influyen en el éxito y la percepción de las películas españolas. A continuación, presentanmos las conclusiones principales del análisis a las que hemos llegado.

En primer lugar, en lo referente a la distribucion de las valoraciones, la mayoría de las valoraciones de las películas se concentra en puntuaciones de 5 a 8, indicando una tendencia general hacia opiniones positivas. No obstante, también se observan picos en las valoraciones más bajas, lo que sugiere una polarización en las opiniones.

Por otro lado, en estas valoraciones resalta la cuestión del género de las peliculas. Los géneros de drama y fantasía son los que reciben las valoraciones más altas, mientras que las películas de comedia y romance tienden a obtener puntuaciones más bajas. Esto sugiere una preferencia del público por géneros que a menudo son considerados más serios o artísticamente valiosos. La cantidad y longitud de las reseñas también varían significativamente según el género, con géneros como la animación y el cine negro recibiendo menos reseñas.

Ademas, tras las pruebas realizadas hemos encontrado que, existe una correlación entre la media de calificación de una película y las valoraciones individuales, aunque esta relación es débil. Sin embargo, las películas con mejores calificaciones promedio tienden a recibir valoraciones altas de manera consistente. . La correlación de Pearson revela una relación débil pero significativa entre la longitud de las reseñas y las calificaciones otorgadas, sugiriendo que las reseñas más largas pueden estar ligeramente asociadas con calificaciones más extremas.
Las pruebas ANOVA muestran que tanto la longitud de las reseñas como las calificaciones varían significativamente entre diferentes géneros. Esto refuerza la idea de que las expectativas y percepciones del público están fuertemente influenciadas por el género de la película.

Respecto a la cuestion del análisis de sentimientos, a través del análisis de los textos de las reseñas, se ha identificado que las opiniones detalladas proporcionan una visión más rica y específica sobre la percepción del público. Palabras como "película", "cine", "personaje" y "bien" son recurrentes, reflejando aspectos críticos de las evaluaciones.

En definitiva, estos hallazgos pueden ser de gran utilidad para cineastas, productores y distribuidores. Comprender las tendencias en las valoraciones y los géneros preferidos permite tomar decisiones informadas para mejorar la recepción y el éxito de las películas en el mercado.

