program Ejercicio3;
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
        WriteLn('ingresar apellido del empleado');
        ReadLn(p.apellido);
        if(p.apellido<> 'FIN')then begin
      
            WriteLn('Ingresar nro de empleado');
            ReadLn(p.nro_emple);

            WriteLn('Ingresar DNI');
            ReadLn(p.DNI);

            WriteLn('Ingresar nombre');
            ReadLn(p.nombre);

            WriteLn('Ingresar edad');
            ReadLn(p.edad);
        end;
        
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
      while Eof(arc_logico) do begin
            read(arc_logico,per);
            if(per.edad>70)then begin
              with per do
                    WriteLn(nro_emple:5,  DNI:5, nombre:5, edad:5, apellido:5); 
            end;
      end;
    end;
var
    per:persona;
    arc_fisico:String;
    arc_logico:arch_persona;
begin
    WriteLn('Ingresar nombre del archivo');
    read(arc_fisico);
    Assign(arc_logico,arc_fisico);
    Rewrite(arc_logico);
    ReadLn;
    LeerPersona(per);
    while (per.apellido<>'FIN') do begin
      write(arc_logico,per);
      LeerPersona(per);
    end;
ImprimirArc(arc_logico);
WriteLn('//////////////////////////////////////');
EncontrarNyA(arc_logico);
WriteLn('//////////////////////////////////////');
Mayores70(arc_logico);
Close(arc_logico);
end.