{Una empresa posee un archivo con información de los ingresos percibidos por diferentes
empleados en concepto de comisión, de cada uno de ellos se conoce: código de empleado,
nombre y monto de la comisión. La información del archivo se encuentra ordenada por
código de empleado y cada empleado puede aparecer más de una vez en el archivo de
comisiones.

Realice un procedimiento que reciba el archivo anteriormente descripto y lo compacte. En
consecuencia, deberá generar un nuevo archivo en el cual, cada empleado aparezca una
única vez con el valor total de sus comisiones.

NOTA: No se conoce a priori la cantidad de empleados. Además, el archivo debe ser
recorrido una única vez}
program Ejercicio1;
const
    valorAlto=9999;
type
    empleados_D=record
            cod_emple:Integer;
            nomb:String;
            monto:Real;
            end;
    empleados_M=record
            cod_emple:Integer;
            nombre:String;
            total:Real;
            end;
    emple_D=file of empleados_D;
    emple_M=file of empleados_M;
    procedure leer(var archivo:detalle; var Rdat:empleados_D);
    begin
        if (not Eof(archivo))then
          Read(archivo,Rdat)
          else
            dat.cod_emple:=valorAlto;
    end;
    procedure cagarMaestro(var mae:emple_M; var det:emple_D);
    var
        regD:empleados_D;
        regM:empleados_M;
    begin
      leer(det,regD);
      while(regD.cod_emple<>valorAlto)do begin
        Read(mae,regM);
        while(regM.cod_emple<>regD.cod_emple) do
          Read(mae,regM);
        while(regM.cod_emple = regD.cod_emple) do begin
            regM.total:=regM.total+regD.monto;
            leer(dat,regD);
        end;
        Seek(mae, FilePos(mae)-1);
        Write(mae,regM);
      end;
      Close(mae); Close(det);
    end;
var
    mae:empleados_M;
    det:emple_D
    arc_fisico:String;
begin
  Assign(det,'DETALLE');{DETALLE es un archivo con la carga de los empleados}
  reset(det);
  ReadLn(arc_fisico);
  Assign(mar,arc_fisico);
  Rewrite(mae);
  cagarMaestro(mae,det);
end.