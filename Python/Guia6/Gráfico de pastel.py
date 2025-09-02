import matplotlib.pyplot as pyplot
etiquetas= ('Python', 'Java', 'Scala', 'C#')
tamanio = [45, 30, 15, 10]
pyplot.pie(tamanio, labels=etiquetas,autopct='%1.f%%', counterclock=False,startangle=90)
pyplot.show()
