program Parcial1;
type
    SO=record
        nombre_del_sistema_operativo:String;
        cantidad_instalaciones:Integer;
        es_de_codigo_abierto:String;
        tipo_licencia:String;
    end;
    archivo=file of SO;
procedure alta_SO(var archi:archivo; var r:SO);
var
act,cabecera:SO;
pos:Integer;
begin
Reset(archi);
Seek(a,0);
read(a,cabecera);
pos:=cabecera.cantidad_instalaciones*-1;
if(pos=0)then begin
  seek(a,FileSize(a));
  Write(a,r);
  end
  else
  begin
    seek(a,pos);
    read(a,act);
    Seek(a,FilePos(pos)-1);
    Write(a,r);
    cabecera:=act;
    Seek(a,0);
    Write(a,cabecera);
  end;
  Close(a);
end;
procedure baja_SO(var archi:archivo; r:SO);
var
cabecera,act:SO;
pos:Integer;
ok:Boolean;
begin
  ok:=false;
  Reset(archi);
    leer(archi,act);
    while(act.nombre_del_sistema_operativo <> valorAlto) and not (ok) do begin
            if(act.nombre_del_sistema_operativo = r.nombre_del_sistema_operativo)then
              ok=true
              else
              leer(archi,act);        
    end;
    if(ok)then begin
      pos=FilePos(a)-1;
      Seek(a,0);
      read(a,cabecera);
      Seek(a,pos);
      act.cantidad_instalaciones:=cabecera.cantidad_instalaciones;
      Write(a,act);
      Seek(a,0);
      Write(a,cabecera);
    end
    else
        write('no se encontro'); 
Close(a);
end;
  

var
 archi:archivo; nuevo_SO:SO;
begin
    assing(archi, 'mae');
    alta_SO(archi,nuevo_SO);
    baja_SO(archi,nuevo_SO);
end.