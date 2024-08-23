{
     Definir un programa que genere un archivo con registros de longitud fija conteniendo
 información de asistentes a un congreso a partir de la información obtenida por
 teclado. Se deberá almacenar la siguiente información: nro de asistente, apellido y
 nombre, email, teléfono y D.N.I. Implementar un procedimiento que, a partir del
 archivo de datos generado, elimine de forma lógica todos los asistentes con nro de
 asistente inferior a 1000.
 Para ello se podrá utilizar algún carácter especial situándolo delante de algún campo
 String a su elección. Ejemplo: ‘@Saldaño’.
}
program ejercicio2;
const
valorAlto=9999;
type
    asistente=record
        nro_asis:Integer;
        AyN:String;
        email:Char;
        telefono:Integer;
        DNI:Integer;
    end;
    asis=file of asistente;
procedure leer(var a:asistente);
begin
    WriteLn('nro asis');
    ReadLn(a.nro_asis);
    if(a.nro_asis <> -1)then begin
      WriteLn('Apellido y nombre');
      ReadLn(a.AyN);

      WriteLn('email');
      ReadLn(a.email);

      WriteLn('telefono');
      ReadLN(a.telefono);

      WriteLn('dni');
      ReadLn(a.DNI);
    end;
end;
procedure crear(var arc_logico:asis);
var
a:asistente;
begin
leer(a);
    while (a.nro_asis <> -1) do begin
      Write(arc_logico,a);
      leer(a);
    end;
    Close(arc_logico);
end;

procedure imprimir(var a:asistente);
begin
    with a do begin
			writeln ('NRO: ',nro_asis,' APELLIDO Y NOMBRE: ',AyN,' MAIL: ',email,' TELEFONO: ',telefono,' DNI: ',DNI);
			writeln ('');
		end;
end;
procedure imprimir_Arc(var arc_logico:asis);
var
aux_a:asistente;
begin
  Reset(arc_logico);
  while (not Eof(arc_logico)) do begin
        Read(arc_logico,aux_a);
        imprimir(aux_a);    
  end;
  Close(arc_logico);
end;
procedure leer(var archivo:asis; var a:asistente);
    begin
      if(not eof(archivo))then
            read (archivo,a)
        else a.nro_asis:=valorAlto;
    end;
procedure eliminar_log(var arc_logico:asis);
var
reg_A:asistente;
begin
  Reset(arc_logico);
  leer(arc_logico,reg_A);
  while (reg_A.nro_asis <> valorAlto) do begin
    if(reg_A.nro_asis < 1000 )then begin
      reg_A.AyN:='@borrado';
      Seek(arc_logico,FilePos(arc_logico)-1);
      Write(arc_logico,reg_A);
    end;
    leer(arc_logico,reg_A);
  end;
end;
var
arc_logico:asis;
begin
  Assign(arc_logico,'archivo.dot');
  Rewrite(arc_logico);
  crear(arc_logico);
  imprimir_Arc(arc_logico);
  eliminar_log(arc_logico);
  WriteLn('////////////////////////////////////////////');
  imprimir_Arc(arc_logico);

end.