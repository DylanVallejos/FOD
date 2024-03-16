Program Ejercicio2;
type
    archivo=file of Integer;
procedure Recorrido(var arc_logico:archivo);
var
nro:Integer;
suma:Integer;
cant_menores:Integer;
cant_nros:integer;
begin
  cant_nros:=0;
  suma:=0;
  cant_menores:=0;
  reset(arc_logico);
  while not Eof(arc_logico) do begin
    read(arc_logico,nro);
    if(nro < 1500) then
      cant_menores:=cant_menores+1;
    suma:=suma+nro;
    cant_nros:=cant_nros+1;
  end;
  WriteLn('El promedio es ',suma/cant_nros);
  WriteLn('la cantidad de numeros menos a 1500 es',cant_menores);
end;
var
arc_logico:archivo;
arc_fisico:String[12];
nro:integer;
begin
  Write('Ingresar el nombre del archivo');
  read(arc_fisico);
  Assign(arc_logico,arc_fisico);
  Reset(arc_logico);
  Recorrido(arc_logico);
  Close(arc_logico);
end.