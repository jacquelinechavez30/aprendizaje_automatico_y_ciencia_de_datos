#Prueba t para dos muestras suponiendo varianzas desiguales
X<- c(100, 102, 96, 106, 110, 110, 120, 112, 112, 90)
Y <- c(104, 88, 100, 98, 102, 92, 96, 100, 96, 96)
resultado <- t.test(X, Y, var.equal = FALSE, alternative = "greater")
valor_t <- as.numeric(resultado$statistic)
gl <- resultado$parameter
p_valor <- resultado$p.value
alpha <- 0.05
valor_critico <- qt(alpha, df = gl)
rechazo <- valor_t < valor_critico
mensaje <- if (rechazo) {
  "Se RECHAZA la hipótesis nula"
} else {
  "NO se rechaza la hipótesis nula"
}
  color_mensaje <- if (rechazo) "green" else "red"
  cat("Resultado:", mensaje, "\n")
  cat("Estadístico t =", round(valor_t, 3), "\n")
  cat("Valor crítico =", round(valor_critico, 3), "\n")
  cat("p-valor =", round(p_valor, 4), "\n")
  x_vals <- seq(-4, 4, length.out = 1000)
  y_vals <- dt(x_vals, df = gl)
  plot(x_vals, y_vals, type = "l", lwd = 2, col = "navy",
       main = "Distribución t (unilateral) con t observado y crítico",
       xlab = "Valor t", ylab = "Densidad")
  abline(v = valor_t, col = "red", lwd = 2, lty = 2)
  abline(v = valor_critico, col = "orange", lwd = 2, lty = 3)
  legend("topright", legend = c(
    paste("t observado:", round(valor_t, 3)),
    paste("t crítico:", round(valor_critico, 3)),
    paste("p-valor:", round(p_valor, 4)),
    mensaje
  ), text.col = c("black", "black", "black", color_mensaje), bty = "n")
  
  