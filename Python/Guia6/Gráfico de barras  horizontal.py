import matplotlib.pyplot as pyplot
etiquetas = ('Python', 'Scala', 'C#', 'Java', 'PHP')
indices = (1, 2, 3, 4, 5)
tamanios = [45, 10, 15, 30, 22]
pyplot.barh(indices, tamanios, tick_label=etiquetas)
pyplot.ylabel('Uso')
pyplot.xlabel('Lenguajes de programacion')
pyplot.show()
