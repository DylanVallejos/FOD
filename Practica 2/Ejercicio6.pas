program Ejercicio6;
const
valorAlto=9999;
type
 datosD=record
    cod_user:Integer;
    fecha:Integer;
    tiempo_sesion:Integer;
 end;
 datosM=record
    cod_user=Integer;
    fecha:Integer;
    total_tiempo:Integer;
 end;
 maestro=file of datosM;
 arc_detalle=array [1..5]of file of datosD;
 reg_detalle=array [1..5]of datosD;
{preguntar de donde sale la variable detalle}
procedure   leer (var archivo:detalle;var dato:datosD);
begin
  if(not Eof(archivo))then
    read(archivo,dato)
    else  dato.cod_user=valorAlto;
end;
procedure minimo(var reg_det:reg_detalle;var min:datosD;var deta:arc_detalle);
    var
    i:Integer;
    begin
    for i:=1 to 30 do begin
      if(reg_det[i].cod_user < min.cod_user)then
        min=reg_det[i];
        leer(deta[i],reg_det[i]);
    end;
var
min:datosD;
deta:arc_detalle;
mae1:maestro;
regm:datosM;
n:Integer;
i:Integer;
reg_det:reg_detalle;
begin
  for i:=1 to 100 do begin
        Assign(deta[i],'det'+1);
        Reset(deta[i]);
        leer(deta[i],reg_det[i]);
    end;
    Assign(mae,'/var/log/maestro');
    Rewrite(mae);
    minimo(reg_det,min,deta);
    while(min.cod_user <> valorAlto )do begin
      regm.cod_user=min.cod_user;
      regm.fecha=min.fecha;
      regm.total_tiempo=0;
        while (regm.cod_user = min.cod_user) and (regm.fecha = min.fecha) do begin
          regm.total=regm.total + min.tiempo_sesion;
          minimo(reg_det,min,deta);
        end;
        seek(mae, filepos(mae)-1);
        Write(mae1,regm);
    end;
end