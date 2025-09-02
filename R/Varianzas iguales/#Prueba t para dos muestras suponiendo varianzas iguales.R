#Prueba t para dos muestras suponiendo varianzas iguales
# Define el vector de datos para la Variable X.
X <- c(100, 102, 96, 106, 110, 110, 120, 112, 112, 90)

# Define el vector de datos para la Variable Y.
Y <- c(104, 88, 100, 98, 102, 92, 96, 100, 96, 96)

# Realiza una prueba t de dos muestras independientes.
# 'var.equal = TRUE' asume que las varianzas poblacionales de X e Y son iguales.
# 'alternative = "greater"' indica que es una prueba unilateral (de una cola)
# para ver si la media de X es significativamente MAYOR que la media de Y.
resultado <- t.test(X, Y, var.equal = TRUE, alternative = "greater")

# Extrae el estadístico t calculado del objeto 'resultado'.
# 'as.numeric()' se usa para asegurar que el valor se trate como un número.
valor_t <- as.numeric(resultado$statistic)

# Extrae los grados de libertad (df) del resultado de la prueba.
# Los grados de libertad son necesarios para calcular el valor crítico y trazar la distribución t.
gl <- resultado$parameter

# Extrae el valor p del resultado de la prueba.
# El valor p se usa para determinar la significancia estadística.
p_valor <- resultado$p.value

# Define el nivel de significancia (alfa), comúnmente establecido en 0.05.
# Este es el umbral para decidir si se rechaza la hipótesis nula.
alpha <- 0.05

# Calcula el valor t crítico para una prueba unilateral (cola superior).
# 'qt(1 - alpha, df = gl)' obtiene el cuantil de la distribución t
# que deja 'alpha' de probabilidad en la cola superior.
# Para alternative="greater", buscamos el valor crítico positivo.
valor_critico <- qt(1 - alpha, df = gl)

# Determina si se rechaza la hipótesis nula.
# Para una prueba "greater", se rechaza si el valor t observado es MAYOR que el valor t crítico.
rechazo <- valor_t > valor_critico

# Asigna un mensaje de resultado basado en si se rechazó la hipótesis nula.
# (Corrección de sintaxis: el 'else' debe contener su valor dentro de sus llaves).
mensaje <- if (rechazo) {
  "Se RECHAZA la hipótesis nula" # Mensaje cuando la hipótesis nula es rechazada.
} else {
  "No se rechaza la hipótesis nula" # Mensaje cuando la hipótesis nula no es rechazada.
}

# Asigna un color al mensaje para resaltarlo visualmente en la leyenda.
# Verde si se rechaza, rojo si no se rechaza. ("brick" se cambió a "red" por ser un color estándar).
color_mensaje <- if (rechazo) "green" else "red"

# Imprime el resultado de la prueba de hipótesis en la consola.
cat("Resultado:", mensaje, "\n")
# Imprime el estadístico t observado, redondeado a 3 decimales para mejor legibilidad.
cat("Estadístico t =", round(valor_t, 3), "\n")
# Imprime el valor t crítico, redondeado a 3 decimales.
cat("Valor crítico =", round(valor_critico, 3), "\n")
# Imprime el valor p, redondeado a 4 decimales.
cat("p-valor =", round(p_valor, 4), "\n")

# Genera una secuencia de valores para el eje x del gráfico de la distribución t.
# Va de -4 a 4 y tiene 1000 puntos, lo que asegura una curva suave.
x_vals <- seq(-4, 4, length.out = 1000)

# Calcula los valores de densidad de probabilidad (altura de la campana) para cada x_vals
# utilizando la función de densidad de la distribución t ('dt()') con los grados de libertad.
y_vals <- dt(x_vals, df = gl)

# Crea el gráfico de la distribución t.
# 'type = "l"' dibuja una línea para formar la campana. (Corrección de 'type = ""').
# 'lwd = 2' establece el ancho de la línea.
# 'col = "navy"' establece el color de la línea de la campana.
# 'main' es el título principal del gráfico.
# 'xlab' y 'ylab' son las etiquetas de los ejes X e Y respectivamente.
plot(x_vals, y_vals, type = "l", lwd = 2, col = "navy",
     main = "Distribución t (unilateral) con t observado y crítico",
     xlab = "Valor t", ylab = "Densidad")

# Añade una línea vertical al gráfico para el estadístico t observado.
# 'v = valor_t' es la posición de la línea en el eje X.
# 'col = "red"' establece el color a rojo.
# 'lwd = 2' establece el ancho de la línea.
# 'lty = 2' establece el tipo de línea (discontinua). (Corrección de 'Ity').
abline(v = valor_t, col = "red", lwd = 2, lty = 2)

# Añade una línea vertical al gráfico para el valor t crítico.
# 'v = valor_critico' es la posición de la línea en el eje X.
# 'col = "orange"' establece el color a naranja.
# 'lwd = 2' establece el ancho de la línea.
# 'lty = 3' establece el tipo de línea (punteada). (Corrección de 'Ity').
abline(v = valor_critico, col = "orange", lwd = 2, lty = 3)

# Añade una leyenda al gráfico en la esquina superior derecha.
# 'legend' es un vector de cadenas de texto que se mostrarán en la leyenda.
# 'paste()' se usa para concatenar texto y valores numéricos redondeados.
# 'text.col' es un vector de colores para cada elemento de la leyenda; el último color es dinámico.
# 'bty = "n"' elimina el borde alrededor de la leyenda para una apariencia más limpia.
legend("topright", legend = c(
  paste("t observado:", round(valor_t, 3)),
  paste("t crítico:", round(valor_critico, 3)),
  paste("p-valor:", round(p_valor, 8)),
  mensaje
), text.col = c("black", "black", "black", color_mensaje), bty = "n")

