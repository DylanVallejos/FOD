program Ejercicio5;
const
valorAlto=9999;
type
    datosM=record
        cod_prod:Integer;
        stock_disp:Integer;
        stock_min:Integer;
        precio_:Real;
        nombre:String;
        descrp:String;
    end;
    datosD=record
        cod_prod:Integer;
        cant_vend:Integer;
    end;
    maestro=file of datosM;
    arc_detalle=array[1..100]of file of datosD;
    reg_detalle=array[1..10] of datosD;
    procedure leer(var archivo:detalle; var dato:datosD);
    begin
      if(not eof(archivo))then
        read(archivo,dato)
        else dato.cod_prod=valorAlto;
    end;
    procedure minimo(var reg_det:reg_detalle;var min:datosD;var deta:arc_detalle);
    var
    i:Integer;
    begin
    for i:=1 to 30 do begin
      if(reg_det[i].cod_prod < min.cod_prod)then
        min=reg_det[i];
        leer(deta[i],reg_det[i]);
    end;
    end;
    procedure informe_txt (var mae:datosM;var arc_text:Text);
    var
    datoM:datosM;
    begin
      while(not eof(mae))do begin
        Read(mae,datoM);
        if(datosM.stock_disp < prod.stock_min ) then begin
          with datoM do
            wirte(arc_text,' ',cod_prod,' ',stock_disp,' ',precio,' ',nombre,' ',descrp);
        end;
      end;
      Close(mae); Close(name_text);
    end;
var
min:datosD;
deta:arc_detalle;
mae1:maestro;
regm:datosM;
arc_txt:Text;
name_txt:String;
begin
    Write('ingrese el nombre del txt');
        Read(name_txt);
        Assign(name_txt,arc_txt);
        Rewrite(name_txt);
    for i:=1 to 100 do begin
        Assign(deta[i],'det'+1);
        Reset(deta[i]);
        leer(deta[i],reg_det[i]);
    end;
    Assign(mae1,'maestro');
    Reset(mae1);
    minimo(reg_det,min.deta);
    while (min.cod_prod <> valorAlto) do begin
        regm.cod_prod=min.cod_prod;
        while (regm.cod_prod = min.cod_prod ) do begin
          regm.stock_disp=regm.stock_disp - min.cant_vend;
          minimo(reg_det,min,deta);
        end;
      Write(mae1,regm);
        informe_txt(mae1,arc_txt);
    end;
end.