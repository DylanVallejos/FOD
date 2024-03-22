program Ejercicio2;
const
    valorAlto=9999;
type
    alumno=record
        cod_alum:Integer;
        Mcursa_SF:Integer;
        Mcursa_CF:Integer;
        apellido:String;
        nombre:String;
    end;

    det_alumno=record
        cod_alum:Integer;
        mate:Boolean;
    end;
    alu_M=file of alumno;
    alu_D=file of det_alumno;
    procedure cargar_mae(var mae:Text;var arc_mae:alu_M );
    var
        alu:alumno;
    begin
        while(not Eof(mae))do begin
          with alu do ReadLn(carga, cod_alum, Mcursa_SF, Mcursa_CF, apellido, nombre);
          Write(arc_mae,alu);
        end;
        Close(mae); Close(arc_mae);
    end;

     procedure cargar_det(var det:Text;var arc_det:alu_D );
    var
        alu:det_alumno;
    begin
        while(not Eof(det))do begin
          with alu do ReadLn(carga, cod_alum, mate);
          Write(arc_det,alu);
        end;
        Close(det); Close(arc_det);
    end;
    
    procedure convertir_mae(var mae:alu_M);
    var
        arc_text:Text;
        alum:alumno;
    begin
      Assign(arc_text,reporteAlumnos.txt);
      Rewrite(arc_text);
      while not Eof(mae) do begin
            Read(mae,alum);
            with alum do
            WriteLn(arc_text,' ',cod_alum,' ',Mcursa_SF,' ',Mcursa_CF,' ',apellido,' ', nombre);
        end;
        Close(arc_text);
    end;

    procedure convertir_det(var det:alu_D);
    var
        arc_text:Text;
        det_alu:det_alumno;
    begin
      Assign(arc_text,reporteDetalle.txt);
      Rewrite(arc_text);
      while not Eof(mae) do begin
            Read(mae,det_alu);
            with det_alu do
            WriteLn(arc_text,' ',cod_alum,' ',mate);
        end;
        Close(arc_text);
    end;

     procedure leer(var archivo:alu_D; var Rdet:det_alumno);
    begin
        if (not Eof(archivo))then
          Read(archivo,Rdet)
          else
            dat.cod_alum:=valorAlto;
    end;
    procedure actualizar_mae(var mae:alu_M; var det:alu_D);
    var
        regD:det_alumno;
        regM:alumno;
    begin
        leer(det,regD);
        while(regD.cod_alum <> valorAlto) do begin
          read(mae,regM);
          while(regM.cod_alum <> regD.cod_alum)do
            Read(mae,regM);
            while (regM.cod_alum = regD.cod_alum) do begin
                if(regD.mate) then
                  regM.Mcursa_CF=regM.Mcursa_CF+1    
                  else
                    regM.Mcursa_SF=regM.Mcursa_SF+1;
                leer(det,regD);
            end;
            Seek(mae(FilePos(mae)-1));
            Write(mae,regM);
        end;
        close(mae); Close(det);
    end;
    procedure filtro_alu(var mae:alu_M);
    var
        name_text:String;
        arc_text:Text;
        alum:alumno;
    begin
      Write('Ingresar nombre del archivo de texto');
      ReadLn(name_text);
      Assign(name_text,arc_text);
      Rewrite(name_text);
      while (not eof(mae)) do begin
        read(mae,alum);
        if(alum.Mcursa_SF > 4) then
          with alum do
            WriteLn(arc_text,' ',cod_alum,' ',Mcursa_SF,' ',Mcursa_CF,' ',apellido,' ', nombre);
        
      end;
      Close(name_text); Close(mae);
    end;
var
    mae:Text;
    det:Text;
    nue_mae:alu_M;
    nue_det:alu_D;
    arc_mae:String;
    arc_det:String;
begin
  Assign(mae,'alumnos.txt');{Este archivo contiene la informacion de alumnos ya cargadas}
  Reset(mae);
  Assign(det,'detalle.txt');{Este archivo tiene la informacion detalle de las materias}
  reset(det);

  WriteLn('Ingresar nombre del archivo maestro');
  ReadLn(arc_mae);
  Assign(nue_mae,arc_mae);
  Rewrite(nue_mae);

  WriteLn('Ingresar nombre del archivo detalle');
  ReadLn(arc_det);
  Assign(nue_mae,arc_det);
  Rewrite(nue_det);

  Cargar_mae(mae,nue_mae);
  Cargar_det(det,nue_det);

  convertir_mae(nue_mae);
  covertir_det(nue_det);

  actualizar_mae(nue_mae,nue_det);
  filtro_alu(nue_mae);
end.