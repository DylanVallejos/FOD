program Parcial2;
type
    empleado=record
        dni:Integer;
        nombre:String;
        apellido:String;
        edad:Integer;
        Domicilio:Integer;
        fecha:Integer;
    end;
    archivo=file of empleado;

procedure Agregar_Empleado(var a:archivo);
var
act,cabecera:empleado;
pos:Integer;
e:empleado;
begin
Reset(a);
read(e.dni);
if(existeEmpleado(a,e.dni))then 
    Write('existe el empleado')
    else
    begin
  leer(e);
  Seek(a,0);
  read(a,cabecera);
  pos=cabecera.edad* -1;
  if(pos = 0 )then begin
    Seek(a,FileSize(a));
    Write(a,e);
    end
    else begin
    Seek(a,0);
    read(a,act);
    Seek(a,FilePos(a)-1);
    cabecera:=act;
    Write(a,e);
    Seek(a,0);
    Write(a,act);
    end;
end;
Close(a);
end;
procedure Quitar_Empleado(var a:archivo);
var
aux,act,cabecera:empleado;
pos:Integer;
DNI:Integer;
begin
  Reset(a);
  read(DNI);
         read(a,cabecera);
      if(ExisteEmpleado(a,DNI))then begin
        leer(a,aux);
        while(aux.dni<> DNI)do
            leer(a,aux);
        pos=FileSize(a)-1;
        Seek(a,pos);
        read(a,act);
        Seek(a,pos);
        act.edad:=cabecera.edad;
        cabecera.edad:=pos*-1;
        Write(a,act);
        Seek(a,0);
        Write(a,cabecera);
    end
    else
        Write('no se encuentra el empleado');
    Close(a);
end;
var
    arc:archivo;
begin
  Assign(arc,'maestro');
  Agregar_Empleado(arc);
  Quitar_Empleado(arc);
end.