program Ejercicio7;
const
valorAlto=9999;
type
    datos_D=record
        cod_loca:Integer;
        cod_cepa:Integer;
        cant_act:Integer;
        cant_nuevos:Integer;
        cant_recp:Integer;
        cant_falle:Integer;
    end;
    datos_M=record
        cod_loca:Integer;
        cod_cepa:Integer;
        cant_act:Integer;
        cant_nuevos:Integer;
        cant_recp:Integer;
        cant_falle:Integer;
        nombre_localidad:Integer;
        nombre_cepa:Integer;
    end;
    maestro=file of maestro;
    arc_detalle=array [1..10]of file of datos_D;
    reg_detalle=array [1..10]of datos_D;
    procedure leer(var archivo:detalle; var datos:datos_D);
    begin
        if(not eof(archivo))then
        read(archivo,datos)
        else dato.cod_loca=valorAlto;
    end;
    procedure minimo(var reg_det:reg_detalle;var min:datos_D;var deta:arc_detalle);
        var
        i:Integer;
        begin
        for i:=1 to 10 do begin
        if(reg_det[i].cod_user < min.cod_user)then
            min=reg_det[i];
            leer(deta[i],reg_det[i]);
        end;
        end;
        procedure actualiza_mae(var mae:maestro; var vec_det:arc_detalle);
        var
        min:datos_D;
        rgma:datos_M;
        i:Integer;
        reg_det:reg_detalle;
        actual:datos_D;
        loc_actual:String
        cepa_actual:Integer;
        cant_localidades:Integer;
        activos:Integer;
        begin
        Assign(mae,'maestro');
        Reset(mae);
        for i:=1 to 10 do begin
                Assign(deta[i],'det'+1);
                Reset(deta[i]);
                leer(deta[i],reg_det[i]);
        end;
        minimo(reg_det,min,vec_det);
        read(mae,rgma);
        while(min.cod_loca<>valorAlto)do begin
            loc_actual:=min.loc_actual;
             while(loc_actual = min.cod_loca)do begin
                    actual=min;
                    actual.cant_act:=0;
                    actual.cant_nuevos:=0;
                    actual.cant_recp:=0;
                    actual.cant_falle:=0;
                    cepa_actual:=min.cod_loca;
                while(loc_actual = min.cod_loca) and (cepa_actual = min.cod_cepa) do begin
                    actual.cant_act:=actual.cant_act + min.cant_act;
                    actual.cant_nuevos:=actual.cant_nuevos + min.cant_act;
                    actual.cant_recp:=actual.cant_falle + min.cant_recp;
                    actual.cant_falle:=actual.cant_falle + min.cant_falle;
                    min(reg_det,min,vec_det);
            end;
                while(rgma <> loc_actual)and (rgma <> cepa_actual) do 
                    read(mae,rgma);
                rgma.cant_act:=rgma.cant_act + actual.cant_act;
                rgma.cant_nuevos:=rgma.cant_nuevos + actual.cant_nuevos;
                rgma.cant_recp:=rgma.cant_recp + actual.cant_recp;
                rgma.cant_falle:=rgma.cant_falle + actual.cant_falle;
                seek(mae, filepos(mae)-1);
                Write(mae1,regm);
                activos:=rgma.cant_act;
                if(activos> 50)then
                  cant_localidades:=cant_localidades + 1;
                activos:=0;
                end;
        end;
        close(mae);
        for i:=1 to 10 do
            close(vec_det[i]);
        WriteLn('la cantidad de localidades con mas de 50 casos activos son',cant_localidades);  
        end;
var
mae:mestro;
vec_det:arc_detalle;
begin
  actualiza_mae(mae,vec_det);
end.