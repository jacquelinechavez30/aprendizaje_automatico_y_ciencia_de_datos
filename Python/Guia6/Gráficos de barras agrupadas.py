import matplotlib.pyplot as pyplot

ancho_de_barra = 0.35

equipoa = (60, 75, 56, 62, 58)
equipob = (55, 68, 80, 73, 55)

indice_teama = (1, 2, 3, 4, 5)
indice_teamb = [i + ancho_de_barra for i in indice_teama]

marcas = [i + ancho_de_barra / 2 for i in indice_teama]
etiquetas_de_marcas = ('Laboratorio1', 'Laboratorio2', 'Laboratorio3', 'Laboratorio4', 'Laboratorio5')

pyplot.bar(indice_teama, equipoa, ancho_de_barra, color='b', label='Equipo A')
pyplot.bar(indice_teamb, equipob, ancho_de_barra, color='g', label='Equipo B')

pyplot.xlabel('Laboratorios')
pyplot.ylabel('Resultados')
pyplot.title('Resultados por Laboratorios')
pyplot.xticks(marcas, etiquetas_de_marcas)

pyplot.legend()
pyplot.show()