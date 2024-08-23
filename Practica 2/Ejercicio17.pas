program ejercicio17;
const
valorAlto=9999;
type
    hosp=record
    cod_loca:Integer;
    nom_loca:String;
    cod_muni:Integer;
    nom_muni:String;
    cod_hosp:Integer;
    nom_hosp:String;
    fecha:Integer;
    cant_casos:Integer;
    end;
    archivo=file of hosp;
procedure leer(var mae:archivo;var datos:hosp);
begin
  if(not Eof(mae))then
    read(mae,datos)
    else
    datos.cod_loca:=valorAlto;
end;
procedure informar(var mae:archivo);
var
cant_hosp,cant_municipio,cant_local,cant_total:Integer;
actual_codl,actual_codm,actual_codh:Integer;
actual_noml,actual_nomm,actual_nomh:String;
rgma:hosp;
tex:Text;
begin
Assign(tex,report.txt);
Rewrite(name);
assing(mae,'datos');
Reset(mae);
leer(mae,rgma);
cant_total:=0;
    while(rgma.cod_loca <> valorAlto) do begin
      actual_codl:=rgma.cod_loca;
      actual_noml:=rgma.nom_loca;
      cant_hosp:=0;
      WriteLn('nombre',actual_noml,actual_codl);
      while (actual_codl=rgma.cod_loca) do begin
        actual_codm:=rgma.cod_muni;
        actual_nomm:=rgma.nom_muni;
        cant_municipio:=0;
        WriteLn('nombre',actual_nomm,actual_codm);
        while (actual_codl=rgma.cod_loca) and (actual_codm= rgma.cod_muni) do begin
            actual_codh:=rgma.cod_hosp;
            actual_nomh:=rgma.nom_hosp;
            WriteLn('nombre',actual_nomh,actual_codh);
            cant_hosp:=0;
            while (actual_codl=rgma.cod_loca) and (actual_codm= rgma.cod_muni) and (actual_codh=rgma.cod_hosp) do begin
            cant_hosp:=cant_hosp+rgma.cant_casos;
            leer(mae,rgma);
            end;
            WriteLn('cantidad de casos',actual_nomh,actual_codh,cant_hosp);
            cant_municipio:=cant_municipio+cant_hosp;
        end;
        WriteLn('cantidad de casos',actual_nomm,actual_codm,cant_municipio);
        cant_local:=cant_local+cant_municipio;
         if(cant_municipio>1500)then begin
              Write(tex,actual_noml,actual_nomm,cant_municipio);
            end;
      end;
      WriteLn('cantidad de casos',actual_noml,actual_codl,cant_local);
      cant_total:=cant_total+ cant_local;
    end;
    WriteLn('cantidad de casos provincia',cant_total);
    Reset(mae);
end;
var
mae:archivo;
begin
  informar(mae);
end.