program ejercicio16;
const
valorAlto=9999;
type
    moto=record
    codigo:Integer;
    nombre:String;
    descripcion:String;
    modelo:Char;
    marca:String;
    stock:Integer;
    end;
    detalle=record
    cod:Integer;
    precio:Real;
    fecha:Integer;
    end;
    maestro=file of moto;
    det=file of detalle;
    arr_det=array[1..10] of detalle;
    arr_reg=array[1..10]of det;
procedure leer(var archivo:det;var datos:detalle);
begin
    if(not Eof(archivo))then
      read(archivo,detalle)
      else
      datos.cod=valorAlto;
end;
procedure minimo (var ar_det:arr_det;var rg_det:arr_reg;var min :detalle);
var
i:Integer
iMin:Integer;
begin
    iMin:=0;
    min.cod:=valorAlto;
    for i:=1 to 10 do begin
      if(rg_det[i].cod<> valorAlto)then begin
        if(rg_det[i].cod<iMin)then begin
          iMin:=i;
          min:=rg_det[i];
        end;
      end;
    end;
    if(iMin<>0)then
      leer(ar_det[iMin],rg_det[iMin]);
end;
procedure maximo(act_moto:Integer;cant_v:Integer;var max:Integer; var max_moto:moto);
begin
    if(cant_v>max)then begin
      max_moto:=act_moto;
      max:=cant_v;
    end;
end;
procedure actualizar(var mae:maestro; var ar_det:arr_det);
var
rgma:maestro;
min:detalle;
rg_det:arr_reg;
max_moto:moto;
max,i:Integer;
cant_vent:Integer;
actual_cod:Integer;
begin
for i:=1 to 10 do begin
  reset(ar_det[i]);
  leer(ar_det[i],rg_det[i]);
end;
max:=-1;
minimo(ar_det,rg_det,min);
while (min.cod<>valorAlto) do begin
    actual_cod:=min.cod;
    cant_vent:=0;
    while (actual_cod=min.cod) do begin
      cant_vent:=cant_vent+1;
      minimo(ar_det,rg_det,min)
    end;
    while(rgma.codigo<>actual_cod)do begin
      leer(mae,rgma);
    end;
    rgma.stock=rgma.stock-cant_vent;
    Seek(mae,FilePos(mae))-1;
    Write(mae,rgma);
    maximo(mae,cant_vent,max,max_moto);
end;
for i :=1 to 10 do
    close(arr_det[i]);
var
mae:maestro;
ar_det:arr_det;
begin
  actualizar(mae,ar_det);
end.