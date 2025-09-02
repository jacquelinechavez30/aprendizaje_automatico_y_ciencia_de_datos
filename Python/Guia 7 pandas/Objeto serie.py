#Series es una estructura de datos unidimensional, ordenada, y que también
#cuenta con un índice a través del cual se accede a sus elementos.
import pandas as pd
datos = [2, 3, 5, 7, 11]
serie = pd.Series (datos)
print("Ejemplo objeto serie")
print(serie)

#Método describe()
#Este método genera información correspondiente a estadística descriptiva.
#Las estadísticas descriptivas incluyen aquellas que resumen la tendencia
#central, la dispersión y la forma de la distribución de un conjunto de
#datos, excluyendo los valores NaN, según sea el caso.
import pandas as pd
datos = [2, 3, 5, 7, 11]
serie = pd.Series (datos)
print("Ejemplo de Metodo describe")
print(serie.describe())

#Conversión Series a Lista
import pandas as pd
datos = [2, 3, 5, 7, 11]
serie = pd.Series(datos)
print(type (datos))
print(type(serie))
lista = serie.tolist()
print("Conversión Series a Lista")
print(type(lista))

#Operaciones aritméticas básicas con Series
import pandas as pd
serie1 = pd.Series([1.5, 2.8, 3.1, 4.6, 5.2])
serie2 = pd.Series([9.3, 8.5, 7.4, 6.1, 4.2])
print("Operaciones aritmeticas con series")
print(serie1 + serie2)
print(serie1 - serie2)
print(serie1 * serie2)
print(serie1 / serie2)

#Conversión Diccionario Python a Series

import pandas as pd
datos = {'a': 10, 'b': 20, 'c': 30, 'd': 40}
serie = pd.Series (datos)
print("Conversión Diccionario Python a Series")
print(serie)

#Conversión Arreglo Numpy a Series

import numpy as np
import pandas as pd
arreglo = np.array([2, 3, 5, 7, 11])
print(arreglo)
serie = pd.Series (arreglo)
print("Conversión Arreglo Numpy a Series")
print(serie)

#Cambio de tipo de datos de un objeto series
import pandas as pd
datos = pd.Series(['150', '400', 'ACD104', '120.5', '250.15'])
print("Cambio de tipo de datos de un objeto series")
print(datos)

datos=pd.to_numeric(datos, errors='coerce')
print(datos)

# cambio de datos entero a float.
import pandas as pd

datos= pd.Series([150, 400, 'ACD104', 120, 250])
print("cambio de datos entero a float.")
print(datos)

datos = pd.to_numeric (datos, downcast='float',errors='coerce')
print(datos)

#Objeto DataFrame
#Un DataFrame es una estructura de datos bidimensional, que puede
#almacenar datos de diferentes tipos, y que cuenta con dos índices que
#proporcionan acceso eficiente tanto por filas como por columnas.
import pandas as pd
datos= {'A': [1, 2, 3, 4, 5], 'B': [9, 8, 7, 6, 5], 'C': [2, 3, 5, 7, 11]}
print("Objeto DataFrame")
print(type(datos))

df=pd.DataFrame(datos)
print(df)
print(type(df))

#Conversión de tipo de datos con DataFrame

import numpy as np
import pandas as pd

datos1 = {'A': [1, 2, 3, 4], 'B': [9, 8, 7, 6], 'C': [2, 3, 5, 7]}
print("Conversión de tipo de datos con DataFrame")
print(type(datos1))
df1 = pd.DataFrame(datos1)
print(df1)
print(df1.dtypes)
df2 = pd.DataFrame(data=datos1, dtype=np.int8)
print(df2)
print(df2.dtypes)

df3 = pd.DataFrame(data=datos1, dtype=np.float64)
print (df3)
print(df3.dtypes)

#Construcción de un DataFrame a partir de Series

import numpy as np
import pandas as pd
datos = {'columnal': [0, 1, 2, 3], 'columna2': pd.Series( [2, 3], index=[2, 3])}
df = pd.DataFrame (data=datos, index=[0, 1, 2, 3])
print("Construcción de un DataFrame a partir de Series")
print(df)

#Obtener un valor de un DataFrame a partir de su fila y columna
#Obtener el valor df[4, 'B'] del DataFrame df.
import pandas as pd

df = pd.DataFrame( [[0, 2, 3], [0, 4, 1], [10, 20, 30]],columns=['A', 'B', 'C'])
print("Obtener un valor de un DataFrame a partir de su fila y columna")
print(df)
print("df.iat[1, 2]: ",df.iat[1, 2])

import pandas as pd
df = pd.DataFrame( [[0, 2, 3], [0, 4, 1], [10, 20, 30]],columns=['A', 'B', 'C'])
print(df)
print("df.iat[1, 2]: ",df.iat[1, 2])
df.iat[1, 2] = 10
print("df.iat[1, 2]: ",df.iat[1, 2])
#Obtener un valor de un DataFrame a partir de su fila y columna
#Obtener el valor df[4, 'B'] del DataFrame df.
import pandas as pd
df = pd.DataFrame( [[0, 2, 3], [0, 4, 1], [10, 20, 30]],index=[4, 5, 6], columns=['A', 'B', 'C'])
print(df)
print("df[4,'B']: ",df.at[4, 'B'])

#Obtener información de indices y columnas de un DataFrame
import pandas as pd

df = pd.DataFrame({'A': [1, 2], 'B': [3, 4]})
print(df)
print("Columnas de df: ",df.columns)
print("Indices de df: ",df.index)

#Obtener información de indices y columnas de un DataFrame
#Ejemplo de uso de la propiedades axes para obtener información de indices y columnas de un DataFrame.
import pandas as pd

df= pd.DataFrame({'columnal': [10, 20, 50], 'columna2': [30, 40, 70]})
print(df)
print(df.axes)

#Obtener información de columnas, filas, elementos de un DataFrame
#Ejemplo de uso de la propiedades ndim, shape y size para obtener
#información de número de filas y columnas, número de elementos de un
#DataFrame.

import pandas as pd
indices = ['AA200620','AV200720','AV180320','B0200320','CB190620','CF200320']
df = pd.DataFrame( [[7.5, 9.1, 6.5, 7.5], [6.1, 7.1, 8.5,9.5],
[6.5, 7.8, 8.4, 7.9], [5.8, 6.5, 7.5, 8.2],
[9.5, 10, 8.7, 9.7],[8.6, 6.9, 8.2, 9.1]],
index=indices, columns=['Nota1', 'Nota2', 'Nota3', 'Nota4'])
print(df)
print("df.shape:\n",df.shape)
print("df.ndim:\n", df.ndim)
print("df.size:\n", df.size)

#Obtener información de columnas y filas de un DataFrame
#Ejemplo de uso de la propiedad index y del método keys() para obtener
#información de filas y columnas de un DataFrame.

import pandas as pd

indices = ['AA200620','AV200720','AV180320','80200320', 'CB190620','CF200320']
df = pd.DataFrame( [[7.5, 9.1, 6.5, 7.5], [6.1, 7.1, 8.5,9.5], [6.5, 7.8, 8.4, 7.9], [5.8, 6.5, 7.5, 8.2],
[9.5, 10, 8.7, 9.7],[8.6, 6.9, 8.2, 9.1]], index=indices,columns=['Notal', 'Nota2', 'Nota3', 'Nota4'])
print(df)
print("df.keys():\n",df.keys())
print("df.index:\n", df.index)