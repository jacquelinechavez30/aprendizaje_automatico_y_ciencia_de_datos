import matplotlib.pyplot as pyplot
etiquetas = ('Python', 'Java', 'Scala', 'C#')
tamanio = [45, 30, 15, 10]
separacion = (0.1, 0, 0, 0)
pyplot.pie(tamanio,explode=separacion,
labels=etiquetas,
autopct='%1.f%%',
shadow=True,
counterclock=False,
startangle=90)
pyplot.show()