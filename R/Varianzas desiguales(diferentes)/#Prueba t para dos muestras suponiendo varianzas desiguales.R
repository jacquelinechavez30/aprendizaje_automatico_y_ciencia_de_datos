# Comentario inicial: Esta sección de código realiza una Prueba t para dos muestras independientes,
# asumiendo varianzas DESIGUALES (prueba de Welch) y con una hipótesis alternativa unilateral "mayor que".

# Define el vector de datos para la Variable X (Primera muestra).
X <- c(100, 102, 96, 106, 110, 110, 120, 112, 112, 90)

# Define el vector de datos para la Variable Y (Segunda muestra).
Y <- c(104, 88, 100, 98, 102, 92, 96, 100, 96, 96)

# Realiza una prueba t de dos muestras INDEPENDIENTES.
# 'var.equal = FALSE': Indica que NO se asume que las varianzas poblacionales de X e Y son iguales (prueba de Welch).
# 'alternative = "greater"': Establece la hipótesis alternativa como unilateral,
#    específicamente, H1: la media de X es MAYOR que la media de Y.
resultado <- t.test(X, Y, var.equal = FALSE, alternative = "greater")

# Extrae el estadístico t calculado del objeto 'resultado'.
# Este es el valor de prueba que se compara con el valor crítico.
valor_t <- as.numeric(resultado$statistic)

# Extrae los grados de libertad (df) del resultado de la prueba.
# Los grados de libertad en la prueba de Welch se calculan de forma más compleja y suelen ser no enteros.
gl <- resultado$parameter

# Extrae el valor p del resultado de la prueba.
# Este valor indica la probabilidad de observar un estadístico t tan extremo o más extremo
# si la hipótesis nula fuera verdadera.
p_valor <- resultado$p.value

# Define el nivel de significancia (alfa), un umbral común de 0.05.
# Se usa para comparar con el valor p o para definir la región crítica.
alpha <- 0.05

# Calcula el valor t crítico para una prueba unilateral.
# NOTA IMPORTANTE: Para una prueba 'alternative = "greater"' (cola superior),
# el valor crítico debe ser 'qt(1 - alpha, df = gl)' para obtener el valor positivo
# en la cola derecha. El uso de 'qt(alpha, df = gl)' aquí obtendrá un valor negativo
# (correspondiente a la cola inferior), lo cual es inconsistente con 'alternative = "greater"'
# en la lógica de rechazo posterior.
valor_critico <- qt(alpha, df = gl)

# Determina si se rechaza la hipótesis nula.
# NOTA IMPORTANTE: Si la prueba es 'alternative = "greater"', la hipótesis nula se rechaza
# si 'valor_t > valor_critico'. Aquí se está usando 'valor_t < valor_critico',
# lo cual es la condición de rechazo para una prueba 'alternative = "less"' (cola inferior).
# Esto significa que la lógica de decisión en esta línea es opuesta a la hipótesis alternativa definida.
rechazo <- valor_t < valor_critico

# Asigna un mensaje descriptivo basado en la decisión de rechazo.
mensaje <- if (rechazo) {
  "Se RECHAZA la hipótesis nula" # Mensaje si la condición 'rechazo' es verdadera.
} else {
  "NO se rechaza la hipótesis nula" # Mensaje si la condición 'rechazo' es falsa.
}

# Asigna un color al mensaje para su visualización en la leyenda.
# Verde si se rechaza, rojo si no se rechaza.
color_mensaje <- if (rechazo) "green" else "red" # Se asume 'red' para "brick" por estándar.

# Imprime el resultado final del contraste de hipótesis en la consola.
cat("Resultado:", mensaje, "\n")
# Imprime el estadístico t observado, redondeado a 3 decimales para legibilidad.
cat("Estadístico t =", round(valor_t, 3), "\n")
# Imprime el valor t crítico, redondeado a 3 decimales.
# Se mostrará el valor crítico calculado (que es negativo si alpha < 0.5)
cat("Valor crítico =", round(valor_critico, 3), "\n")
# Imprime el valor p, redondeado a 4 decimales.
cat("p-valor =", round(p_valor, 4), "\n")

# Genera una secuencia de valores para el eje x del gráfico de la distribución t.
# Esto crea los puntos para dibujar la curva de densidad.
x_vals <- seq(-4, 4, length.out = 1000)

# Calcula los valores de densidad de probabilidad (la altura de la campana)
# para cada valor en 'x_vals' usando la distribución t con los grados de libertad obtenidos.
y_vals <- dt(x_vals, df = gl)

# Crea el gráfico de la distribución t.
# 'type = "l"': Dibuja una línea para formar la curva de la campana.
# 'lwd = 2': Establece el ancho de la línea.
# 'col = "navy"': Establece el color de la línea de la curva.
# 'main': Título principal del gráfico.
# 'xlab', 'ylab': Etiquetas de los ejes X e Y.
plot(x_vals, y_vals, type = "l", lwd = 2, col = "navy",
     main = "Distribución t (unilateral) con t observado y crítico",
     xlab = "Valor t", ylab = "Densidad")

# Añade una línea vertical al gráfico para representar el estadístico t observado.
# 'v = valor_t': Posición de la línea en el eje horizontal.
# 'col = "red"': Color de la línea.
# 'lwd = 2': Ancho de la línea.
# 'lty = 2': Tipo de línea (discontinua).
abline(v = valor_t, col = "red", lwd = 2, lty = 2)

# Añade una línea vertical al gráfico para representar el valor t crítico.
# 'v = valor_critico': Posición de la línea en el eje horizontal (será un valor negativo aquí).
# 'col = "orange"': Color de la línea.
# 'lwd = 2': Ancho de la línea.
# 'lty = 3': Tipo de línea (punteada).
abline(v = valor_critico, col = "orange", lwd = 2, lty = 3)

# Añade una leyenda al gráfico en la esquina superior derecha.
# Contiene el valor t observado, el valor t crítico, el valor p y el mensaje de decisión.
# Los colores del texto de la leyenda se ajustan, siendo el último el 'color_mensaje' dinámico.
# 'bty = "n"' elimina el borde alrededor de la leyenda.
legend("topright", legend = c(
  paste("t observado:", round(valor_t, 3)),
  paste("t crítico:", round(valor_critico, 3)),
  paste("p-valor:", round(p_valor, 4)),
  mensaje
), text.col = c("black", "black", "black", color_mensaje), bty = "n")

