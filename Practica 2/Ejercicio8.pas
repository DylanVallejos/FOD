program Ejercicio8;
const
valorAlto=9999;
type
 cliente=record
 cod_cliente:Integer;
 NyA:String;
 anio:Integer;
 mes:Integer;
 dia:Integer;
 monto:Real;
 end;
archivo=file of cliente;
procedure leer(var mae:archivo; var datos:cliente);
    begin
        if(not eof(archivo))then
        read(archivo,datos)
        else datos.cod_cliente=valorAlto;
    end;
procedure Informar(var mae:archivo);
var
rgma:archivo;
actual:cliente;
anio,mes,cod_cli:Integer;
total_empresa:Real;
total_mes:Real;
total_anio:Real;
begin
Assign(mae,'datos');
reset (mae);
leer(mae,rgma);
total_empresa:=0;
    while(rgma.cod_cliente <> valorAlto)do begin
      actual.cod_cliente=rgma.cod_cliente;
      total_anio:=0;
      Write('el cliente ',actual.cod_cliente,'nombre y apellido',rgma.NyA);
      while (actual.cod_cliente = rgma.cod_cliente) do begin
        actual.anio:=rgma.anio;
        Write('en el año',actual.anio);
        total_mes:=0;
        while (actual.cod_cliente = rgma.cod_cliente) and (actual.anio = rgma.anio) do begin
          actual.mes:=rgma.mes;
          Write('en el mes',actual.mes);
          while (actual.cod_cliente = rgma.cod_cliente) and (actual.anio = rgma.anio) and (actual.mes=rgma.mes) do begin
            total_mes:=total_mes + rgma.monto;
            leer(mae,rgma);
        end;
        if (total_mes > 0) then begin
          WriteLn('en el mes',actual.mes,' el cliente compro',total_mes);
          total_anio:=total_anio + total_mes;
        end;
        WriteLn('en el año'actual.anio'se compro',total_anio);
        total_empresa:=total_empresa + total_anio;
      end;
    end;
    write('el total que compro la empresa fue',total_anio);
    close(mae);
end;
var
arc:archivo;
begin
Informar(arc);
end.