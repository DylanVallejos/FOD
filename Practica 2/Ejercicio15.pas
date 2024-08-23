program ejercicio15;
const
valorAlto=9999;
DIMF=100;
type
    semi=record
        fecha:Integer;
        cod_sem:Integer;
        nom_sem:String;
        desc:String;
        precio:Real;
        total_ejem:Integer;
        total_vend:Integer;
    end;
    det=record
    fech:Integer;
    cod_s:Integer;
    cant_eje:Integer;
    end;
    maestro= file of semi;
    detalle=file of detalle;
    arr_reg=array[1..DIMF] of det;
    arr_det=array[1..DIMF]of detalle;
procedure leer(var archivo:detalle;var datos:det);
begin
  if(not Eof(archivo))then
    Read(archivo,datos)
    else
    datos.fech:=valorAlto;
end;
procedure min(var ar_det:arr_det;var ar_reg:arr_reg;var min:det);
var
i,iMin:Integer;
begin
    iMin:=0;
    min.fech:=valorAlto;
    min.cod_s:=valorAlto;
    for i:=1 to DIMF do begin
        if(ar_reg[i].fech<>valorAlto)then begin
      if(ar_reg[i].fech<min.fech) or ((ar_reg[i].cod_s<min.cod_s) and (ar_reg[i].fech=min.fech)) then begin
        iMin:=i;
        min:=ar_reg[i];
      end;
    end;   
    end;
    if(iMin<>0)then
      leer(ar_det[iMin],ar_reg[iMin]);
end;
procedure actualizar(var mae:maestro;var ar_det:arr_reg);
var
reg_det:arr_reg;
min:det;
rgma:semi;
i:Integer;
max:Integer;
actual_sem:Integer;
actual_fech:Integer;
cant_vend:Integer;
begin
  for i:=1 to DIMF do begin
    reset(ar_det[i]);
    leer(ar_det[i],arr_reg[i]);
  end;
  max:=-1;
minimo(arr_det,arr_reg,min);
read(mae,rgma);
while(min.fech<>valorAlto)do begin
  actual_fech:=min.fech;
  while(actual_fech=min.fech) do begin
    actual_sem:=min.cod_s;
    cant_vend:=0;
    while (actual_fech=min.fech) and (actual_sem=min.cod_s) do begin
      cant_vend:=cant_vend + min.cant_ejeM;
      min(arr_det,arr_reg,min);
    end;
    while(rgma.fecha<>actual_fech) or (rgma.cod_sem<>actual_sem) do 
    read(mae,rgma);
    if(rgma.total_ejem >= cant_vend ) then begin
    rgma.total_vend:=rgma.total_vend + cant_vend;       
    rgma.total_ejem:=rgma.total_ejem-cant_vend;
    Seek(mae,FilePos(mae)-1);
    Write(mae,rgma);
    end
    else
    Write('no posee stock disponible');
  end;
end;
end;
var
mae:maestro; ar_det:arr_det
begin
  actualizar(mae,ar_det);
end.