{Explicacion de como lo hice
Primero agrego el   35 a la raiz
El 40 lo agrego a la derecha de la misma raiz
El 32 lo reacomodo en la raiz y queda [32,35,40]
El 28 produce un overflow por lo tanto separo 28,32,35,40 y queda 28,32 en un nodo terminal izq 35 en la raiz y 40 en 
un nodo terminal derecho.
El 26 se agrega en el nodo terminal izq y queda [26,28,32]
El 37 se agrega al nodo terminal derecho y queda [37,40]
El 25 produce overflow asi que tengo que redistribuir 25,26,28,32 con lo cual subo el 28 a la raiz y queda [28,35]
del lado izquierdo quedan el 25 y 26 y del lado derecho del 28 queda el 32.
El 23 se agrega sin problemas al nodo terminal izquierdo y queda [23,25,26]
El 21 produce overflow con lo cual tengo que redistribuir el 21,23,25,26 con lo cual sube el 25 a la raiz y queda [25,28,35]
de lado izquiero de 25 queda [21,23] y del lado derecho del mismo queda el [26]
El 36 se agrega al nodo terminal derecho de 35 y queda [36,37,40].
El 45 produce overflow y hay que redistrubir el [36,37,40,45] con lo cual tendria que subir el 40 a la raiz pero no se puede
porque la raiz no tiene espacio en ese caso hay que volver a redistribuir la raiz [25,28,35,40] en la raiz queda el 35
del lado izquierdo esta el 25 y 28 con sus respectivos nodos terminales y del lado derecho el 40 con sus respectivos nodos tambien
y agregando el 45 al lado derecho

}