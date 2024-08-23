{
     Considere que desea almacenar en un archivo la información correspondiente a los
 alumnos de la Facultad de Informática de la UNLP. De los mismos deberá guardarse
 nombre y apellido, DNI, legajo y año de ingreso. Suponga que dicho archivo se organiza
 comounárbol B de orden M.
 a. Defina en Pascal las estructuras de datos necesarias para organizar el archivo de
 alumnos como un árbol B de orden M.
 

}

program ejercicio1;
const
orden=M;
type
    alumno=record
        nombre:String;
        apellido:String;
        dni:Integer;
        legajo:Integer;
        anio_ingr:Integer;
    end;
    nodoAB=record
        elementos:array[1..M-1]of alumno;
        hijos:array[1..M]of ^nodoAB;
        cant_Elem:Integer;
    end;
    arch=file of nodoAB;
var
arc:arch;
begin
end.
{
    b. Suponga que la estructura de datos que representa una persona (registro de
 persona) ocupa 64 bytes, que cada nodo del árbol B tiene un tamaño de 512
 bytes y que los números enteros ocupan 4 bytes, ¿cuántos registros de persona
 entrarían en un nodo del árbol B? ¿Cuál sería el orden del árbol B en este caso (el
 valor de M)? Para resolver este inciso, puede utilizar la fórmula N = (M-1) * A + M *
 B + C, donde N es el tamaño del nodo (en bytes), A es el tamaño de un registro
 (en bytes), B es el tamaño de cada enlace a un hijo y C es el tamaño que ocupa
 el campo referido a la cantidad de claves. El objetivo es reemplazar estas
 variables con los valores dados y obtener el valor de M (M debe ser un número
 entero, ignorar la parte decimal).

  Rta:En cada nodo entrarian 8 registros. 

 d. ¿Qué dato seleccionaría como clave de identificación para organizar los
 elementos (alumnos) en el árbol B? ¿Hay más de una opción?

    Rta:Seleccionaria el legajo para identificar a cada alumno,Si existe mas de una opcion ya que DNI tambien es una clave unica
    que se puede usar como clave para indentificar a los alumnos ambos elementos nunca se repiten porque son datos unicos de un alumno.

 e. Describa el proceso de búsqueda de un alumno por el criterio de ordenamiento
 especificado en el punto previo. ¿Cuántas lecturas de nodos se necesitan para
 encontrar un alumno por su clave de identificación en el peor y en el mejor de
 los casos? ¿Cuáles serían estos casos?.

    Rta:En el mejor caso: es 1 lectura, en este caso el dato que buscabas estaba en la raiz.
        En el peor caso: h lecturas(con h altura arbol). Y  en este caso se tuvo que recorrer toda la altura del arbol.
    
 ¿Qué ocurre si desea buscar un alumno por un criterio diferente? ¿Cuántas
 lecturas serían necesarias en el peor de los casos
    Rta: En caso de querer buscar un alumno por un criterio diferente es posible pero seria menos eficiente ya que esta ordenado
    por otro criterio ya sea dni o legajo, por lo cual si quisieras buscarlo por ejemplo por el nombre en el peor caso vas a tener
    que recorrer todo el arbol.

 ¿Qué ocurre si desea buscar un alumno por un criterio diferente? ¿Cuántas
 lecturas serían necesarias en el peor de los casos?
    Rta:Tendrias que recorrer todos los nodos del arbol, harias la misma cantidad de lecturas que cuantos nodos tengas
    en el arbol.
}

