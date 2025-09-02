import numpy as np
import matplotlib.pyplot as plt

v = np.array([186, 196, 206, 216, 226, 236, 246, 256, 266, 276, 286, 296, 306, 316, 326, 336, 346, 356, 366, 376, 386, 200, 186, 193, 193, 196, 191, 200, 190, 191])

plt.boxplot(v)

q1 = np.percentile(v, 25)
q2 = np.percentile(v, 50)
q3 = np.percentile(v, 75)
mean = np.mean(v)

plt.axhline(mean, color='red', linestyle='--', label=f'Media: {mean:.1f}')
plt.axhline(q1, color='blue', linestyle=':', label=f'Q1: {q1:.1f}')
plt.axhline(q2, color='green', linestyle='-.', label=f'Q2 (Mediana): {q2:.1f}')
plt.axhline(q3, color='purple', linestyle=':', label=f'Q3: {q3:.1f}')

plt.xlabel('Grupo de Datos')
plt.ylabel('Valores')
plt.title('Gráfico boxplot')
plt.grid()
plt.legend()
plt.show()