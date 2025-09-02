import numpy as np
import matplotlib.pyplot as plt

v = np.array([186,196,206,216,226,236,246,256,266,276,286,296,306,316,326,
336,346,356,366,376,386,200,186,193,193,196,191,200,190,191])
plt.boxplot(v)

plt.xlabel('Grupo de Datos')
plt.ylabel('Valores')
plt.title('Grafico boxplot')
plt.grid()
plt.show()
