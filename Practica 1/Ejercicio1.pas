Program Ejercicio1;
type
    archivo=file of Integer;
procedure Recorrido(var arc_logico:archivo);
var
nro:Integer;
begin
  reset(arc_logico);
  while not Eof(arc_logico) do begin
    read(arc_logico,nro);
    Write(nro);
  end;
end;
var
arc_logico:archivo;
arc_fisico:String[12];
nro:integer;
begin
  Write('Ingresar el nombre del archivo');
  read(arc_fisico);
  Assign(arc_logico,arc_fisico);
  Rewrite(arc_logico);
  WriteLn('Ingresar numero');
  ReadLn(nro);
  while (nro<>3000) do begin
    Write(arc_logico,nro);
    ReadLn(nro);
  end;
  Recorrido(arc_logico);
  Close(arc_logico);
end.