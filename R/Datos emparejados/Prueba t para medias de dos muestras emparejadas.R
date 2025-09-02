#Prueba t para medias de dos muestras emparejadas
#relacionadas

# Define el vector de datos para la Variable 1 (X)
X <- c(100, 102, 96, 106, 110, 110, 120, 112, 112, 90)

# Define el vector de datos para la Variable 2 (Y)
Y <- c(104, 88, 100, 98, 102, 92, 96, 100, 96, 96)

# Realiza una prueba t pareada entre X e Y.
# 'paired = TRUE' indica que las muestras están relacionadas.
resultado <- t.test(X, Y, paired = TRUE)

# Extrae el estadístico t del resultado de la prueba y lo convierte a numérico.
valor_t <- as.numeric(resultado$statistic)

# Extrae los grados de libertad (df) del resultado de la prueba.
gl <- resultado$parameter

# Extrae el valor p del resultado de la prueba.
p_valor <- resultado$p.value

# Define el nivel de significancia (alfa) para la prueba.
alpha <- 0.05

# Calcula el valor t crítico para una prueba de dos colas.
# 'qt()' es la función cuantil para la distribución t.
# (1 - alpha / 2) da el cuantil para el extremo superior (por ejemplo, 0.975 para alpha=0.05).
valor_critico <- qt(1 - alpha / 2, df = gl)

# Compara el valor absoluto del estadístico t observado con el valor t crítico.
# Si el valor t observado es mayor que el crítico, se rechaza la hipótesis nula.
if (abs(valor_t) > valor_critico) {
  # Mensaje si se rechaza la hipótesis nula
  mensaje <- "Se RECHAZA la hipótesis nula"
  # Color del mensaje para indicar rechazo
  color_mensaje <- "green"
} else {
  # Mensaje si no se rechaza la hipótesis nula
  mensaje <- "No se rechaza la hipótesis nula"
  # Color del mensaje para indicar no rechazo
  color_mensaje <- "red"
}

# Imprime el resultado de la prueba de hipótesis.
cat("Resultado:", mensaje, "\n")
# Imprime el estadístico t observado redondeado a 3 decimales.
cat("Estadístico t =", round(valor_t, 3), "\n")
# Imprime el valor t crítico redondeado a 3 decimales.
cat("Valor crítico =", round(valor_critico, 3), "\n")
# Imprime el valor p redondeado a 4 decimales.
cat("p-valor =", round(p_valor, 4), "\n")

# Genera una secuencia de valores para el eje x del gráfico (rango de -4 a 4 con 1000 puntos).
x_vals <- seq(-4, 4, length.out = 1000)

# Calcula las densidades de probabilidad para cada valor en x_vals usando la distribución t.
y_vals <- dt(x_vals, df = gl)

# Crea un gráfico de la distribución t.
# 'type = "l"' para una línea, 'lwd' para el ancho de línea, 'col' para el color.
# 'main' es el título principal, 'xlab' y 'ylab' son las etiquetas de los ejes.
plot(x_vals, y_vals, type = "l", lwd = 2, col = "navy",
     main = "Distribución t con valor observado y crítico",
     xlab = "Valor t", ylab = "Densidad")

# Añade una línea vertical al gráfico para el estadístico t observado (en rojo, línea discontinua).
abline(v = valor_t, col = "red", lty = 2)

# Añade una línea vertical para el valor t crítico positivo (en naranja, línea punteada).
abline(v = valor_critico, col = "orange", lty = 3)

# Añade una línea vertical para el valor t crítico negativo (en naranja, línea punteada).
abline(v = -valor_critico, col = "orange", lty = 3)

# Añade una leyenda al gráfico.
# 'topright' posiciona la leyenda.
# 'legend' contiene los textos a mostrar.
# 'text.col' define los colores del texto de la leyenda (el último color cambia según el resultado).
# 'bty = "n"' elimina el borde de la leyenda.
legend("topright", legend = c(
  paste("t observado =", round(valor_t, 3)),
  paste("t crítico =", round(valor_critico, 3)),
  paste("p-valor =", round(p_valor, 4)),
  mensaje
), text.col = c("black", "black", "black", color_mensaje), bty = "n")

