import matplotlib.pyplot as pyplot
x = [0, 1, 2, 3, 4, 5, 6]
y = [0, 2, 6, 14, 30, 43, 75]

pyplot.ylabel('Velocidad', fontsize=12)
pyplot.xlabel('Tiempo', fontsize=12)

pyplot.title("Velocidad vs Tiempo")
pyplot.plot(x, y, 'bo-')
pyplot.show()
