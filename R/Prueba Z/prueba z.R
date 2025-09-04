# Comentario inicial: Este script realiza una Prueba Z para la media de las diferencias
# entre dos muestras pareadas (X e Y), asumiendo que la desviación estándar de la población
# de las diferencias es conocida (aunque aquí se estima a partir de la muestra).

# Verifica si el paquete 'BSDA' está instalado y, si no, lo instala.
# 'BSDA' es necesario porque contiene la función 'z.test'.
if (!require("BSDA")) install.packages("BSDA")
# Carga el paquete 'BSDA' en la sesión actual de R.
library(BSDA)

# Define el vector de datos para la Muestra X.
# Estos son los valores de la primera observación en cada par.
X<-
  c(9.32,8.57,16.74,14.67,12.16,11.92,10.37,14.87,11.09,9.75,13.69,10.65,12.39,6.06,13.51,9.31,
    17.03,13.92,13.92,12.66,6.80,7.34,12.62,16.84,16.20,7.20,16.22,8.25,12.84,11.75,8.94,13.37,
    14.01,11.43,16.13,12.97,8.43,7.53,4.23,18.31,10.37,17.13,9.38,17.00,2.67,10.81,14.71,15.05,
    17.99,9.81,15.85,11.81,16.73,15.87,12.69,10.04,18.85,13.65,7.13,15.68,9.98,17.89,10.87)
# Define el vector de datos para la Muestra Y.
# Estos son los valores de la segunda observación en cada par, correspondientes a los de X.
Y<-
  c(9.27,9.53,16.38,15.27,12.90,12.50,10.28,15.72,11.65,9.35,13.55,11.29,12.16,5.91,13.14,9.13,
    16.93,14.57,13.48,12.30,6.76,8.10,12.21,17.45,17.08,6.72,16.87,7.97,13.48,12.35,8.82,13.00,
    14.72,12.30,15.87,13.50,8.19,8.09,5.13,18.18,10.25,16.69,9.32,16.78,3.35,11.47,14.39,14.61,
    17.70,10.39,15.38,11.52,16.47,15.63,12.57,9.81,19.56,14.46,7.73,16.36,10.68,18.53,10.83)

# Calcula las diferencias entre los valores de X y Y para cada par de observaciones.
# Esta es la base para una prueba Z o t pareada.
dif <-X- Y
# Calcula la desviación estándar de las diferencias.
# NOTA: En una prueba Z, se asume que la desviación estándar de la POBLACIÓN es conocida (sigma).
# Aquí, se está utilizando la desviación estándar de la MUESTRA de las diferencias como sigma.x.
# Esto es una aproximación común cuando el tamaño de la muestra es grande.
sigma <- sd(dif)

# Realiza la prueba Z para una sola muestra (las diferencias).
# 'x = dif': Los datos a probar son las diferencias.
# 'mu = 0': La hipótesis nula (H0) es que la media de las diferencias es 0 (no hay diferencia).
# 'sigma.x = sigma': Se proporciona la desviación estándar para la prueba Z (la calculada de la muestra).
# 'alternative = "two.sided"': La hipótesis alternativa (H1) es que la media de las diferencias
#    es diferente de 0 (prueba de dos colas).
z_result <- z.test(x = dif, mu = 0, sigma.x = sigma, alternative = "two.sided")

# Imprime el objeto 'z_result' completo para ver todos los detalles de la prueba Z.
print(z_result)

# Extrae el estadístico Z calculado del resultado de la prueba.
# Este es el valor estandarizado de la media de las diferencias.
valor_z <- as.numeric(z_result$statistic)

# Extrae el valor p del resultado de la prueba Z.
# Se usa para comparar con 'alpha' y tomar una decisión.
p_valor <- z_result$p.value

# Define el nivel de significancia (alfa), que es el umbral para el rechazo de H0.
alpha <- 0.05

# Calcula el valor Z crítico para una prueba de dos colas.
# 'qnorm(1 - alpha/2)' obtiene el valor Z que deja (alpha/2)% en la cola superior derecha.
# Para una prueba de dos colas, se necesita tanto el valor positivo como el negativo.
z_critico <- qnorm(1 - alpha/2)

# Determina si se rechaza la hipótesis nula.
# Para una prueba de dos colas, se rechaza H0 si el valor absoluto del estadístico Z observado
# es mayor que el valor Z crítico positivo.
rechazo <- abs(valor_z) > z_critico

# Asigna un mensaje basado en la decisión de rechazo.
mensaje <- if (rechazo) "Se RECHAZA la hipótesis nula" else "NO se rechaza la hipótesis nula"

# Asigna un color para el mensaje en la leyenda del gráfico.
# Verde si se rechaza H0, y "brick" (un tono de rojo) si no se rechaza H0.
color_mensaje <- if (rechazo) "green" else "brick"

# Imprime el resultado final del contraste de hipótesis en la consola.
cat("Resultado:", mensaje, "\n")
# Imprime el estadístico Z observado, redondeado a 3 decimales.
cat("Estadístico Z:", round(valor_z, 3), "\n")
# Imprime el valor Z crítico positivo, redondeado a 3 decimales.
cat("Valor crítico:", round(z_critico, 3), "\n")
# Imprime el valor p, redondeado a 4 decimales.
cat("p-valor:", round(p_valor, 4), "\n")

# Genera una secuencia de valores para el eje x del gráfico de la distribución normal estándar (Z).
# Estos valores se usarán para dibujar la curva de la campana.
x_vals <- seq(-4, 4, length.out = 1000)

# Calcula los valores de densidad de probabilidad para cada 'x_vals' usando la distribución normal estándar.
# 'dnorm(x_vals)' calcula la altura de la curva de la campana en cada punto x.
y_vals <- dnorm(x_vals)

# Crea el gráfico de la distribución normal estándar (Z).
# 'type = "l"': Dibuja una línea para formar la campana.
# 'lwd = 2': Establece el ancho de la línea de la curva.
# 'col = "navy"': Establece el color de la curva.
# 'main': Título principal del gráfico.
# 'xlab', 'ylab': Etiquetas para los ejes X e Y.
plot(x_vals, y_vals, type = "l", lwd = 2, col = "navy",
     main = "Distribución Z estadistico y crítico",
     xlab = "Valor Z", ylab = "Densidad")

# Añade una línea vertical al gráfico para representar el estadístico Z observado.
# 'v = valor_z': Posición en el eje X.
# 'col = "red"': Color de la línea.
# 'lwd = 2': Ancho de la línea.
# 'lty = 2': Tipo de línea (discontinua).
abline(v = valor_z, col = "red", lwd = 2, lty = 2)

# Añade una línea vertical al gráfico para representar el valor Z crítico positivo.
# 'v = z_critico': Posición en el eje X.
# 'col = "orange"': Color de la línea.
# 'lwd = 2': Ancho de la línea.
# 'lty = 3': Tipo de línea (punteada).
abline(v = z_critico, col = "orange", lwd = 2, lty = 3)

# Añade una línea vertical al gráfico para representar el valor Z crítico negativo.
# 'v = -z_critico': Posición en el eje X (simétrico al positivo).
# 'col = "orange"': Color de la línea.
# 'lwd = 2': Ancho de la línea.
# 'lty = 3': Tipo de línea (punteada).
abline(v = -z_critico, col = "orange", lwd = 2, lty = 3)

# Añade una leyenda al gráfico en la esquina superior derecha.
# 'legend': Contiene las cadenas de texto a mostrar.
# 'paste()': Combina texto con los valores calculados redondeados.
# 'text.col': Colores para cada elemento de la leyenda (el color del mensaje final es dinámico).
# 'bty = "n"': Elimina el borde de la leyenda.
legend("topright", legend = c(
  paste("Z estadistico:", round(valor_z, 3)),
  paste("±Z crítico:", round(z_critico, 3)), # Muestra el valor crítico con el signo ±
  paste("p-valor:", round(p_valor, 4)),
  mensaje
), text.col = c("black", "black", "black", color_mensaje), bty = "n")
