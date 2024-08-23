{
    Los árboles B+ representan una mejora sobre los árboles B dado que conservan la
propiedad de acceso indexado a los registros del archivo de datos por alguna clave,
pero permiten además un recorrido secuencial rápido. Al igual que en el ejercicio 2,
considere que por un lado se tiene el archivo que contiene la información de los
alumnos de la Facultad de Informática (archivo de datos no ordenado) y por otro lado
se tiene un índice al archivo de datos, pero en este caso el índice se estructura como
un árbol B+ que ofrece acceso indizado por DNI al archivo de alumnos. Resuelva los
siguientes incisos:
}
{
 a. ¿Cómo se organizan los elementos (claves) de un árbol B+? ¿Qué elementos se
 encuentran en los nodos internos y que elementos se encuentran en los nodos
 hojas?.
    Rta: Los elementos claves en un arbol B+ se organiza de la manera en la que los nodos internos son separadores
    para organizar los nodos hojas.
    En los nodos internos solo se van a encontrar datos que son usados como separadores
    para optimizar la busqueda en los nodos hojas.
    Los nodos hojas contienen pares de clave-valor que representan los registros de datos reales.

 b. ¿Qué característica distintiva presentan los nodos hojas de un árbol B+? ¿Por
 qué?.
    Rta:En los nodos hojas la caracteristica es que ademas de contener valores que represetan datos del registro
    tambien almacenan la clave que se usa como separador en el nodo interno.
    Esta característica permite que los nodos hojas formen una estructura de lista enlazada, lo que facilita 
    el recorrido secuencial de los registros de datos. Debido a que los nodos hojas están enlazados entre sí, 
    se puede navegar eficientemente a través de los registros de datos en orden ascendente o descendente
    sin necesidad de acceder a los nodos internos.

 c. Defina en Pascal las estructuras de datos correspondientes para el archivo de
 alumnos y su índice (árbol B+). Por simplicidad, suponga que todos los nodos del
 árbol B+ (nodos internos y nodos hojas) tienen el mismo tamaño.



 d. d. Describa, con sus palabras, el proceso de búsqueda de un alumno con un DNI
 específico haciendo uso de la estructura auxiliar (índice) que se organiza como
 un árbol B+. ¿Qué diferencia encuentra respecto a la búsqueda en un índice
 estructurado como un árbol B?.
   Rta: La busqueda en los arboles B+ son similares a las las demas con la unica diferencia que el dato
   que se busca va a estar en un nodo terminar, los nodos iternos son contienen separadores que se usan como guias
   para los nodos terminales ademas que una vez llegado a un nodo terminales es mas facil realizar la busqueda
   secuencial porque estan enlazadas en una lista.
   El proceso de busqueda es comparar el dato con la raiz ver si es mayor/menor o igual en caso de se menor ir
   al nodo izq volver a comparar en este caso si es menor o mayor y buscar en los nodos terminales.

 e. Explique con sus palabras el proceso de búsqueda de los alumnos que tienen DNI
 en el rango entre 40000000 y 45000000, apoyando la búsqueda en un índice
 organizado como un árbol B+. ¿Qué ventajas encuentra respecto a este tipo de
 búsquedas en un árbol B?.
   Rta:El proceso de busqueda empieza en comparar si 40000000 es mayor o menor que la raiz ir al nodo no terminal
   de la izq o derecha segun el valor de la raiz hacer lo mismo hasta llegar a un nodo terminal y empezar a recorrer
   los nodos terminales hasta encontrar el 45000000, la ventaja de buscar entre rangos en arboles B+ es que
   los nodos terminales estan enlazados por una lista y eso facilita el recorrido de los nodos, esto permite que
   no tenga que volver al nodo raiz en cada paso.
   

}