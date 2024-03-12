program Ejercicio4;
type
    persona=record
        nro_emple:String;
        apellido:String;
        nombre:String;
        edad:Integer;
        DNI:Integer;
    end;
    arch_persona=file of persona;

    procedure LeerPersona(var p:persona);
    begin
            WriteLn('Ingresar nombre');
            ReadLn(p.nombre);

            WriteLn('ingresar apellido del empleado');
            ReadLn(p.apellido); 

            WriteLn('Ingresar nro de empleado');
            ReadLn(p.nro_emple);

            WriteLn('Ingresar DNI');
            ReadLn(p.DNI);



            WriteLn('Ingresar edad');
            ReadLn(p.edad);
        
        
    end;

    procedure ImprimirArc(var arc_logico:arch_persona);
    var
        per:persona;
    begin
        reset(arc_logico);
        while not Eof(arc_logico) do begin
            read(arc_logico,per);
            with per do
                WriteLn(nro_emple:5,  DNI:5, nombre:5, edad:5, apellido:5);
            end;
    end;
    procedure EncontrarNyA(var arc_logico:arch_persona);
    var
        nombre:string;
        ape:string;
        per:persona;
    begin
        WriteLn('Ingresar nombre a buscar');
        ReadLn(nombre);
        WriteLn('Ingresar apellido a buscar');
        ReadLn(ape);
        reset(arc_logico);
        while not Eof(arc_logico) do begin
            read(arc_logico,per);
            if(per.nombre=nombre) and (per.apellido=ape)then begin
                with per do
                    WriteLn(nro_emple:5,  DNI:5, nombre:5, edad:5, apellido:5); 
            end;
        end;
    end;
    procedure Mayores70(var arc_logico:arch_persona);
    var
        per:persona;
    begin
      reset(arc_logico);
      while not Eof(arc_logico) do begin
            read(arc_logico,per);
            if(per.edad>70)then begin 
                with per do
                        WriteLn(nro_emple:5,  DNI:5, nombre:5, edad:5, apellido:5);
            
            end;
      end;
    end;
    procedure agregar (var arc_logico:arch_persona);
    var
    per:persona;
    begin
        Reset(arc_logico);
        Seek(arc_logico,FileSize(arc_logico));
        LeerPersona(per);
        while per.nombre <> 'NO' do begin
          Write(arc_logico,per);
          WriteLn('Si quiere dejar de agregar escriba NO');
          LeerPersona(per);
        end;
    end;
    procedure convertir (var arc_logico:arch_persona; var carga:Text);
    var
     text_name:String;
     per:persona;
    begin
        WriteLn('Ingresar el nombre del archivo de texto');
        ReadLn(text_name);
        Assign(carga,text_name);
        Rewrite(carga);
        while not Eof(arc_logico) do begin
            Read(arc_logico,per);
            with per do
            WriteLn(carga,' ',nombre,' ',apellido,' ',nro_emple,' ',DNI,' ',edad);
        end;
        Close(carga)
    end;
    procedure filtrarEmpleados(var arc_logico:arch_persona; var carga:Text);
    var
        text_name:String;
        per:persona;
    begin
        WriteLn('Ingresar el nombre del archivo de texto');
        ReadLn(text_name);
        Assign(carga,text_name);
        Rewrite(carga);
        while not Eof(arc_logico) do begin
            Read(arc_logico,per);
            if(per.DNI <> 00)then begin 
                with per do
                WriteLn(carga,' ',nombre,' ',apellido,' ',nro_emple,' ',DNI,' ',edad);
             end;
        end;
        Close(carga)
    end;
var
    per:persona;
    arc_fisico:String;
    arc_logico:arch_persona;
    opcion:integer;
    carga:Text;
begin
    WriteLn('Ingresar nombre del archivo');
    read(arc_fisico);
    Assign(arc_logico,arc_fisico);
    Reset(arc_logico);
    ReadLn;
    repeat
        WriteLn('1. Iprimir datos del archivo');
        WriteLn('2. Encontrar un empleado en el archivo');
        WriteLn('3. Iprimir datos de empleados mayores a 70');
        WriteLn('4. Agregar empelados');
        WriteLn('5. Convertir todo a texto');
        WriteLn('6. Filtrar empleados');
        ReadLn(opcion);
        case opcion of
            1:
            begin
                ImprimirArc(arc_logico);
                WriteLn('//////////////////////////////////////');
            end;
            2:
            begin
                EncontrarNyA(arc_logico);
                WriteLn('//////////////////////////////////////');
            end;
            3:
            begin
                Mayores70(arc_logico);
            end;
            4:
            begin
                agregar(arc_logico);
            end;
            5:
            begin
                convertir(arc_logico,carga);
            end;
            6:
            begin
                filtrarEmpleados(arc_logico,carga);
            end;
        end;
    until (opcion=0);
Close(arc_logico);
end.