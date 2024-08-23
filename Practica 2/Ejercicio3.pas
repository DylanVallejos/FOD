program ejercicio3;
const
    valorAlto=9999;
type
    produ=record
        cod_prod:Integer;
        pre_venta:Real;
        stock_act:Integer;
        stock_min:Integer;
        nom_com:String;      
    end;
    venta=record
        codi_prod:Integer;
        cant_uni:Integer;

    end;
    produ_M=file of produ;
    vent_D=file of venta;
    procedure leer(var archivo:vent_D;var dato:venta);
    begin
      if(not(eof(archivo)))then 
        Read(archivo,det)
        else
            dato.codi_prod:=valorAlto;
    end;
    procedure actualizarMaestro(var mae:produ_M; var det:vent_D);
    var
        total:Integer;
        regD:venta;
        regM:produ;
        aux:Integer;
    begin
        leer(det,regD);
        while(regD.codi_prod <> valorAlto ) do begin
            aux=regD.codi_prod;
            total:=0;
            while (aux = regD.codi_prod) do begin
                total:= total + regD.cant_uni;
                leer(det,regD);
            end;
            while (regM.cod_prod <> aux) do
                read(mae,regM);
            regM.stock_act=regM.stock_act - total;
            Seek(mae,FilePos(mae)-1);
            Write(mae,regM);
        end;
        Close(det);
        Close(mae);
    end;
    procedure filtrar_text (var mae:produ_M);
    var
    name_text:String;
    arc_text:Text;
    prod:produ;
    begin
      WriteLn('Ingrese nombre del archivo de texto');
      Read(name_text);
      Assign(name_text,arc_text);
      Rewrite(name_text);
      while(not eof(mae))do begin
        Read(mae,prod);
        if(prod.stock_act < prod.stock_min ) then begin
          with prod do
            wirte(arc_text,' ',cod_prod,' ',pre_venta,' ',stock_act,' ',stock_min,' ',nom_com);
        end;
      end;
      Close(mae); Close(name_text);
    end;
var
    det:vent_D;
    mae:produ_M;

    
begin
  Assign(mae,'MAESTRO');
  Reset(mae);
  Assign(det,'DETALLE');
  reset(det);
  actualizarMaestro(mae,det);
  filtrar_text(mae);
end.