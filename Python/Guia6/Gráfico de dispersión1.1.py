import numpy as np
import matplotlib.pyplot as plt
markers = ['.', ',', 'o','v' , '^' , '<', '>', '1', '2', '3', '4', 's', 'p', '*','h', 'H', '+', 'x', 'D', 'd', '|', '_']
plt.style.use('ggplot')
plt.figure(figsize=(12, 8))

#Nota seguir los espaciados si no estan asi no funciona
for i, marcador in enumerate (markers):
    x = np.random.rand(10)
    y = np.random.rand(10)
    plt.scatter(x, y, marker=marcador, label=f'Marcador: {marcador}', s=100)
#aqui termina el for importante
plt.legend (bbox_to_anchor=(1.05, 1), loc='upper left')
plt.title('Visualización de todos los marcadores disponibles en matplotlib')
plt.xlabel('Eje X')
plt.ylabel('Eje Y')
plt.tight_layout()
plt.show()
