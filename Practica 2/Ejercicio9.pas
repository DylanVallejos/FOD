program Ejercicio9;
const
    valorAlto=9999999;
type
    mesas=record
        cod_prov:Integer;
        cod_loca:Integer;
        nro_mesa:Integer;
        cant_votos:Integer;
    end;
archivo=file of mesas;
procedure leer(var mae:archivo;var rgma:mesas);
begin
  if(not Eof(mae)) then
    read(mae,rgma)
    else
    dato.cod_prov:=valorAlto;
end;
procedure informar(var mae:archivo);
var
rgma:mesas;
actual_prov:Integer;
actual_loca:Integer;
total_prov:Integer;
total_local:Integer;
total_general:Integer;
begin
Assign(mae,'datos');
Reset(mae);
leer(mae,rgma);
total_general:=0;
while(rgma.cod_prov <> valorAlto)do begin
  actual_prov:=rgma.cod_prov;
  total_prov:=0;
  WriteLn('Codigo provincia',actual_prov);
  while (actual_prov= rgma.cod_prov) do begin
    actual_loca:=rgma.cod_loca;
    total_local:=0;
    WriteLn('Codigo localidad',actual_loca);
    while (actual_loca=rgma.cod_loca) and (actual_prov= rgma.cod_prov) do begin
      total_local:=total_local + rgma.cant_votos;
      leer(mae,rgma);
    end;
    WriteLn('Total votos',total_local);
    total_prov:=total_prov + total_local;
  end;
  WriteLn('Total provincia',total_prov);
  total_general:=total_general + total_prov;
end;
    WriteLn('Total votos general',total_general);
    Close(mae);
end;
var
mae:archivo;
begin
informar(mae);

end.