program Ejercicio4;
const
valorAlto='ZZZZ';
type
    datosM=record
        nom_prov:String;
        cant_per:Integer;
        total_enc:Integer;
    end;
    datosD=record
        nom_prov:String;
        cod_loca:Integer;
        cant_per:Integer;
        cant_enc:Integer;
    end;
    maestro=file of datosM;
    detalle=file of datosD;
    procedure leer(var archivo:detalle; var dato:datosD);
    begin
      if(not eof(archivo))then
        read (archivo,dato)
        else dato.nom_prov:=valorAlto;
    end;
    procedure minimo (var r1, r2: alumno; var min: alumno);
        begin
        if (r1.nombre < r2.nombre) then begin
            min := r1;
            leer(det1, r1);
        end
        else begin
            min := r2;
            leer(det2, r2);
  end;
end;
var
regM:datosM;
min,regd1,regd2:datosD;
mae1:maestro; det1,det2:detalle;
total_enc:Integer;
cant_total_alfb:Integer;
begin
Assign(mae1,'Maestro'); Assign(det1,'detalle1');
Assign(det2,'detalle2');
Reset(mae1); Reset(det1); Reset(det2);
leer(det1,regd1);
leer(det2,regd2);
    while (min.nom_prov <> valorAlto ) do begin
      Read(mae1,regM);
      while (regm.nom_prov <> min.nom_prov) do
        Read(mae1,regM);
      while (regm.nom_prov = min.nom_prov) do begin
        regm.cant_per:=regM.cant_per + min.cant_per;
        regM.total_enc:=regM.total_enc + min.cant_enc;
        minimo(regd1,regd2,min);
      end;

    end;
end.