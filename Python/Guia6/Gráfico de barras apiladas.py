import matplotlib.pyplot as pyplot
etiquetas = ('Python', 'Scala', 'C#', 'Java', 'PHP')
indices = (1, 2, 3, 4, 5)
web = [20, 2, 5, 10, 14]
ciencia_datos = [15, 8, 5, 15, 2]
juegos = [10, 1, 5, 5, 4]
pyplot.bar(indices, web, tick_label=etiquetas, label='web')
pyplot.bar (indices, ciencia_datos, tick_label=etiquetas,label='ciencia de datos', bottom=web)
web_y_juegos = [web[i] + ciencia_datos[i]
for i in range(0, len(web))]
pyplot.bar (indices, juegos, tick_label=etiquetas, label='juegos', bottom=web_y_juegos)
pyplot.ylabel('Uso')
pyplot.xlabel('Lenguajes de programacion')
pyplot.legend()
pyplot.show()