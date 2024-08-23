program Ejercicio11;
const
valorAlto=9999;
type
     empr=record
        anio:Integer;
        mes:Integer;
        dia:Integer;
        id:Integer;
        tiempo:Real;
        end;
    archivo=file of empr;
procedure leer(var mae:archivo; var datos:empr);
begin
  if(not Eof(mae))then
    read(mae,datos)
    else
    datos.anio:=valorAlto;
end;
procedure informe(var mae:archivo);
var
rgma:empr;
annio:Integer;
act_anio,act_mes,act_dia,act_id:Integer;
tiempo_mes:Real;
tiempo_dia:Real;
total_tiempo:real;
tiempo_user:Real;
pos:Integer;
existe:Boolean;
begin
Assign(mae,'datos');
reset(mae);
total_tiempo:=0;
leer(mae,rgma);
existe:=False;
WriteLn('ingrese año a buscar');
ReadLn(annio);
    while(rgma.anio<>valorAlto) and (existe) do begin
      if(rgma.anio=annio)then begin
        existe:=true;
        pos:=FilePos(rgma)-1
      end
      else
      leer(mae,rgma);
    end;
    if(existe)then begin
    Seek(mae,pos);
    leer(mae,rgma);
    act_anio:=rgma.annio;
      while(rgma.anio=act_anio) do begin
        WriteLn('año',act_anio);
        act_mes:=rgma.mes;
        tiempo_mes:=0;
        while (rgma.anio=annio) and (rgma.mes=act_mes) do begin
            Write('mes',act_mes);
            act_dia:=rgma.dia;
            tiempo_dia:=0;
            while (rgma.anio=annio) and (rgma.mes=act_mes) and (rgma.dia=act_dia) do begin
                Write('dia',act_dia);
                act_id:=rgma.id;
                tiempo_user:=0;
                while (rgma.anio=annio) and (rgma.mes=act_mes) and (rgma.dia=act_dia) and (rgma.id=act_id) do begin
                  tiempo_user:=tiempo_user + rgma.tiempo;
                  leer(mae,rgma);
                end;
                Write('id_user',act_id,'en el dia',act_dia,'mes',act_mes);
                tiempo_dia:=tiempo_dia+tiempo_user;
            end;
            WriteLn('total acceso dia',act_dia,'mes',act_mes,'',tiempo_dia);
            tiempo_mes:=tiempo_mes+tiempo_dia;
        end;
        Write('total tiempo acceso mes',act_mes,'',tiempo_mes);
        total_tiempo:=total_tiempo+tiempo_mes;
      end;
      WriteLn('total al año',total_tiempo);
    end
    else
        Write('no se encontro el año');
Close(mae);

end;
var
mae:archivo
begin
informe(mae);
end.