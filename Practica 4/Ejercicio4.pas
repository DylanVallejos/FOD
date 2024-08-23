Program Ejercicio4;

procedure buscar(NRR, clave, NRR_encontrado, pos_encontrada, resultado);
var clave_encontrada: boolean;
begin
if (nodo = null)
resultado := false; {clave no encontrada}
else
posicionarYLeerNodo(A, nodo, NRR);
claveEncontrada(A, nodo, clave, pos, clave_encontrada);
if (clave_encontrada) then begin
NRR_encontrado := NRR; { NRR actual }
pos_encontrada := pos; { posicion dentro del array }
resultado := true;
end
else
buscar(nodo.hijos[pos], clave, NRR_encontrado, pos_encontrada,
resultado)
end;
{
 a. PosicionarYLeerNodo(): Indique qué hace y la forma en que deben ser
enviados los parámetros (valor o referencia). Implemente este módulo en Pascal.
    Rta: Se para en el nodo actual para leer los datos que almacena, los parametros:
    A: (Asumiendo que es el archivo) Se tiene que enviar por referencia.
    nodo: Por refencia, va a almacenar el nodo actual leido.
    NRR: se para por valor se utilizará para acceder al
    nodo correspondiente en el almacenamiento secundario
    y cargarlo en la memoria principal para su procesamiento.

 b. claveEncontrada(): Indique qué hace y la forma en que deben ser enviados los
 parámetros (valor o referencia). ¿Cómo lo implementaría?
    Rta:(Asumiendo que es el archivo) Se tiene que enviar por referencia.
    nodo: Por refencia, va a almacenar el nodo actual leido.
    clave:por valor, es la clave que contiene el nodo actual.
    pos:por referencia porque contiene la posicion actual.
    clave_encontrada: se pasa por referencia porque se usa para saber si la clave se encuentra o no.

 c. ¿Existe algún error en este código? En caso afirmativo, modifique lo que
 considere necesario.
    Rta:Falta declarar variables, errores de sintaxys.

 d. ¿Qué cambios son necesarios en el procedimiento de búsqueda implementado
 sobre un árbol B para que funcione en un árbol B+.
    Rta: la primera comparacion no se deberia hacer porque los datos que buscas estan en los
    nodos terminales en conclusion tendrias que ir hasta los nodos terminales para buscar el dato.
    


}