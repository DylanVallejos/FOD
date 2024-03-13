{Realizar un programa que permita:

 a. Crear un archivo binario a partir de la información almacenada en un archivo de texto.
 El nombre del archivo de texto es: “novelas.txt”

 b. Abrir el archivo binario y permitir la actualización del mismo. Se debe poder agregar
 una novela y modificar una existente. Las búsquedas se realizan por código de novela.

 NOTA: La información en el archivo de texto consiste en: código de novela,
 nombre,género y precio de diferentes novelas argentinas. De cada novela se almacena la
 información en dos líneas en el archivo de texto. La primera línea contendrá la siguiente
 información: código novela, precio, y género, y la segunda línea almacenará el nombre
 de la novela
}
program Ejercicio7;
type
    novelas=record
        cod_novela:Integer;
        precio:Real;
        genero:String;
        nombre_novela:String;
    end;
    arch_novelas= file of novelas;
    procedure leerNovela(var nov:novelas);
    begin
      WriteLn('ingresar codigo novela');
      ReadLn(nov.cod_novela);
      WriteLn('ingresar precio de la novela');
      ReadLn(nov.precio);
      WriteLn('ingresar genero de la novela');
      ReadLn(nov.genero);
      WriteLn('ingresar nombrede la novela');
      ReadLn(nov.nombre_novela);
    end;
    procedure cargar_novelas(var arc_logico:arch_novelas;var carga:Text);
    var
    nov:novelas;
    nom_Arch:String;
    begin
        WriteLn('Nombre del archivo de carga');
        ReadLn(nom_Arch);
        Assign(carga,nom_Arch);
        reset(carga);
        while not Eof(carga) do begin
           with votos do ReadLn(carga, cod_novela, precio, genero, nombre_novela);
           Write(arc_logico,votos);
        end;
        close(arc_logico); Close(carga);
    end;
    procedure modificar_novela(var arc_logico:arch_novelas);
    var
    FIN:Boolean;
    nuevo_precio:Real;
    nuevo_genero:String;
    nuevo_nombre:String;
    opcion:Integer;
    cod_busqueda:Integer;
    novela:novelas;
    begin
      FIN:=True;
      reset(arc_logico);
      WriteLn('Ingresar codigo de novela que desea modificar');
      ReadLn(cod_busqueda);
        while not Eof(arc_logico) and (FIN) do begin
            Read(arc_logico,novela);
            if(novela.cod_novela=cod_busqueda)then begin
                repeat
                    WriteLn('1. Modificar precio');
                    WriteLn('2. Modificar genero');
                    WriteLn('3. Modificar nombre');
                    WriteLn('0. Para salir');
                    ReadLn(opcion);
                    case opcion of
                        1:
                        begin
                            WriteLn('Ingresar nuevo precio');
                            ReadLn(nuevo_precio);
                            novela.precio:=nuevo_precio;
                            Seek( arc_logico, filepos(arc_logico) -1 );
                            Write( arc_logico, novela );
                        
                        end;
                        2:
                        begin
                            WriteLn('Ingresar nuevo genero');
                            ReadLn(nuevo_genero);
                            novela.genero:=nuevo_genero;
                            Seek( arc_logico, filepos(arc_logico) -1 );
                            Write( arc_logico, novela );
                        end;
                        3:
                        begin
                            WriteLn('Ingresar nuevo nombre');
                            ReadLn(nuevo_nombre);
                            novela.nombre_novela=nuevo_nombre;
                            Seek( arc_logico, filepos(arc_logico) -1 );
                            Write( arc_logico, novela );
                        end;
                    end;
                until(opcion = 0);
                FIN=False;
            end;
            close(arc_logico);
        end;
    end;
    procedure agregar_novela(var arc_logico:arch_novelas);
    var
    nov:novelas;
    begin
      Reset(arc_logico);
      Seek(arc_logico,FileSize(arc_logico));
      leerNovela(nov);
      while (nov.cod_novela <> 0) do begin
        Write(arc_logico,nov);
        WriteLn('Escribri 0 para dejar de agregar novelas');
        leerNovela(nov);
      end;
      Close(arc_logico);
    end;
var
    arc_logico:arch_novelas;
    arc_fisico:String[12];
    carga:Text;
begin
    WriteLn('Ingresar nombre del archivo');
    ReadLn(arc_fisico);
    Assign(arc_logico,arc_fisico);
    cargar_novelas(arc_logico,carga);
    modificar_novela(arc_logico);
    agregar_novela(arc_logico);
end.