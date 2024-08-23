program Ejercicio4;
type
reg_flor = record
nombre: String[45];
codigo:integer;
end;
tArchFlores = file of reg_flor;
procedure leer(var f:reg_flor);
begin
  WriteLn('Ingrese codigo');
  ReadLn(f.codigo);
  if(f.codigo<>-1) then
    WriteLn('Ingrese nombre');
    ReadLn(f.nombre);
end;
procedure crearArchivo(var arc_logico:tArchFlores);
var
f:reg_flor;
begin
  Assign(arc_logico,'ArchFlores');
  Rewrite(arc_logico);
  f.nombre:='Cabecera';
  f.codigo:=0;
  write(arc_logico,f);
  leer(f);
  while(f.codigo<> -1) do begin
    write(arc_logico,f);
    leer(f);
  end;
  Close(arc_logico);
end;
procedure imprimir(var arc_logico:tArchFlores);
var
f:reg_flor;
begin
  Reset(arc_logico);
  while(not Eof(arc_logico))do begin
    read(arc_logico,f);
    if(f.codigo>0)then
    WriteLn('Codigo: ',f.codigo,' nombre: ',f.nombre );
  end;
end;
procedure agregarFlor (var a: tArchFlores ; nombre: string;
 codigo:integer);
 var
 aux,cabecera:tArchFlores;
 begin
   reset(a);
   aux.nombre:=nombre;
   aux.codigo:=codigo;
   read(a,cabecera);
   if(cabecera.codigo=0)then begin
        Seek(a,FileSize(a));
        Write(a,f);
    End 
    else
    begin
        Seek(a,a.codigo * -1 );
        Read(a,cabecera);
        Seek(a,FilePos(a)-1);
        Write(a,f);
        Seek(a,0);
        Write(a,cabecera);
    end;
 Close(a);
 end;
procedure eliminarFlor (var a: tArchFlores; flor:reg_flor)
var
aux,cabecera:reg_flor;
begin
  Reset(a);
  Read(a,cabecera);
    while(not Eof(a)) do
    Read(a,aux);
    if(aux.codigo = flor.codigo) then begin
      seek(a,FilePos(a)-1);
      aux.codigo:=FilePos(a)* -1;
      Write(a,aux);
      Seek(a,0);
      Write(a,aux);
    end;

end;
var
arc_logico:tArchFlores;
nom:String[45];
cod:Integer;
begin
crearArchivo(arc_logico);
imprimir(arc_logico);
WriteLn('Ingresar nombre para agregar');
ReadLn(nom);
WriteLn('Ingresar cod para agregar');
ReadLn(cod);
agregarFlor(nom,cod,arc_logico,nombre,cod);
imprimir(a);

end.