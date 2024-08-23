{
    a. Defina en Pascal las estructuras de datos correspondientes para el archivo de
        alumnos y su índice.
}
program Ejercicio2;
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
        enlaces:array[1..M-1] of Integer;
    end;
    arch=file of nodoAB;
    TAarchivoDatos=file of alumno;
var
arc:arch;
archivoDatos:TAarchivoDatos;
begin
end.
{
 b. Suponga que cada nodo del árbol B cuenta con un tamaño de 512 bytes. ¿Cuál
 sería el orden del árbol B (valor de M) que se emplea como índice? Asuma que
 los números enteros ocupan 4 bytes. Para este inciso puede emplear una fórmula
 similar al punto 1b, pero considere además que en cada nodo se deben
 almacenar los M-1 enlaces a los registros correspondientes en el archivo de
 datos.

 c. ¿Qué implica que el orden del árbol B sea mayor que en el caso del ejercicio 1?
    Rta: Mayor eficiencia de busqueda al tener mas nodos y menos niveles en el arbol es mas facil encontrar un 
    elemento porque no se necesitaria recorrer mas niveles para encontrar el elemento.

 D. Describa con sus palabras el proceso para buscar el alumno con el DNI 12345678
 usando el índice definido en este punto
    Rta:

 e. ¿Qué ocurre si desea buscar un alumno por su número de legajo? ¿Tiene sentido
 usar el índice que organiza el acceso al archivo de alumnos por DNI? ¿Cómo
 haría para brindar acceso indizado al archivo de alumnos por número de legajo?
    Rta: No se deberia buscar por numero de legajo porque el arbol esta ordenado por otro criterio que es DNI
    por lo cual tampoco tendria sentido porque la busqueda seria poco eficiente, para poder buscar por numero
    de legajo lo mejor deberia ser crear otro arbol que este ordenado por nro de legajo.

 f. Suponga que desea buscar los alumnas que tienen DNI en el rango entre
 40000000 y 45000000. ¿Qué problemas tiene este tipo de búsquedas con apoyo
 de un árbol B que solo provee acceso indizado por DNI al archivo de alumnos?
    Rta:El mayor de los problemas es que tengas que volver a leer nodos porque los dni que buscas pueden que esten
    en diferentes niveles.
}