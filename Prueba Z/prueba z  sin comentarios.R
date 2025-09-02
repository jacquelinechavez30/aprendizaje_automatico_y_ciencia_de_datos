#Prueba Z
if (!require("BSDA")) install.packages("BSDA")
library(BSDA)
X<-
  c(9.32,8.57,16.74,14.67,12.16,11.92,10.37,14.87,11.09,9.75,13.69,10.65,12.39,6.06,13.51,9.31,
    17.03,13.92,13.92,12.66,6.80,7.34,12.62,16.84,16.20,7.20,16.22,8.25,12.84,11.75,8.94,13.37,
    14.01,11.43,16.13,12.97,8.43,7.53,4.23,18.31,10.37,17.13,9.38,17.00,2.67,10.81,14.71,15.05,
    17.99,9.81,15.85,11.81,16.73,15.87,12.69,10.04,18.85,13.65,7.13,15.68,9.98,17.89,10.87)
Y<-
  c(9.27,9.53,16.38,15.27,12.90,12.50,10.28,15.72,11.65,9.35,13.55,11.29,12.16,5.91,13.14,9.13,
    16.93,14.57,13.48,12.30,6.76,8.10,12.21,17.45,17.08,6.72,16.87,7.97,13.48,12.35,8.82,13.00,
    14.72,12.30,15.87,13.50,8.19,8.09,5.13,18.18,10.25,16.69,9.32,16.78,3.35,11.47,14.39,14.61,
    17.70,10.39,15.38,11.52,16.47,15.63,12.57,9.81,19.56,14.46,7.73,16.36,10.68,18.53,10.83)
dif <-X- Y
sigma <- sd(dif)
z_result <- z.test(x = dif, mu = 0, sigma.x = sigma, alternative = "two.sided")
print(z_result)
valor_z <- as.numeric(z_result$statistic)
p_valor <- z_result$p.value
alpha <- 0.05
z_critico <- qnorm(1 - alpha/2)
rechazo <- abs(valor_z) > z_critico
mensaje <- if (rechazo) "Se RECHAZA la hipótesis nula" else "NO se rechaza la hipótesis nula"
color_mensaje <- if (rechazo) "green" else "brick"
cat("Resultado:", mensaje, "\n")
cat("Estadístico Z:", round(valor_z, 3), "\n")
cat("Valor crítico:", round(z_critico, 3), "\n")
cat("p-valor:", round(p_valor, 4), "\n")
x_vals <- seq(-4, 4, length.out = 1000)
y_vals <- dnorm(x_vals)
plot(x_vals, y_vals, type = "l", lwd = 2, col = "navy",
     main = "Distribución Z estadistico y crítico",
     xlab = "Valor Z", ylab = "Densidad")
abline(v = valor_z, col = "red", lwd = 2, lty = 2)
abline(v = z_critico, col = "orange", lwd = 2, lty = 3)
abline(v = -z_critico, col = "orange", lwd = 2, lty = 3)
legend("topright", legend = c(
  paste("Z estadistico:", round(valor_z, 3)),
  paste("±Z crítico:", round(z_critico, 3)),
  paste("p-valor:", round(p_valor, 4)),
  mensaje
), text.col = c("black", "black", "black", color_mensaje), bty = "n")

