{
    Modificar el ejercicio 4 de la práctica 1 (programa de gestión de empleados),
 agregándole una opción para realizar bajas copiando el último registro del archivo en
 la posición del registro a borrar y luego truncando el archivo en la posición del último
 registro de forma tal de evitar duplicados.
}
program Ejercicio1;
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
        repeat
            read(arc_logico,per);
            if(per.nombre=nombre) and (per.apellido=ape)then begin
                with per do
                    WriteLn(nro_emple:5,  DNI:5, nombre:5, edad:5, apellido:5); 
            end;
        until (not Eof(arc_logico) and (per.nombre=nombre) and (per.apellido=ape));
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
            WriteLn(carga,' ',DNI,' ',edad,' ',nro_emple,' ',nombre,' ',apellido);
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
    Procedure actualizar (Var Emp:arch_persona);
    var 
        E: persona;
        FIN:boolean
        nro:Integer;
        nueva_edad:Integer;
    begin
        FIN:True;
        Reset( Emp );
        WriteLn('Ingresar nro de empleado al que desea modificar la edad');
        ReadLn(nro);
        WriteLn('Ingresar la nueva edad');
        ReadLn(nueva_edad);
        while not eof( Emp ) and (FIN) do begin
            Read( Emp, E);
            if(e.nro_emple = nro)then begin
              e.edad:=nueva_edad;
              FIN:=False;
              Seek( Emp, filepos(Emp) -1 );
              Write( Emp, E );
            end;
            
        end;
        close( Emp );
end;
procedure eliminar(var arc_logico:arch_persona; nroe:Integer);
    var
    aux_emple:persona;
    emple:persona;
    ok:Boolean;
    begin
    ok:=false;
     seek(arc_logico,FileSize(arc_logico)-1);
     Read(arc_logico,emple);
     Seek(arc_logico,0);
     while(not Eof(arc_logico)and not ok) do begin
       Read(arc_logico,aux_emple);
       if(aux_emple.nro_emple = nroe) then begin
            ok:=true;
            Seek(arc_logico,FilePos(arc_logico)-1);
            Write(arc_logico,emple);
            Seek(arc_logico,FileSize(arc_logico)-1);
            Truncate(arc_logico);  
       end;    
     end;
     if(ok)then
        WriteLn('El empleado se elmino con exito')
        else
        WriteLn('El empleado no fue encontrando;');
    Close(arc_logico);
    end;
var
    per:persona;
    arc_fisico:String;
    arc_logico:arch_persona;
    opcion:integer;
    carga:Text;
    nroe:Integer;
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
        WriteLn('7. Actualizar');
        WriteLn('8. Eliminar');
        ReadLn(opcion);
        case opcion of
            1:
            begin
                ImprimirArc(arc_logico);
            end;
            2:
            begin
                EncontrarNyA(arc_logico);
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
            7:
            begin
                actualizar(arc_logico);
            end;
            8:
            begin
              WriteLn('Ingresar el nro de empleado a eliminar');
              read(nroe);
              eliminar(arc_logico,nroe);
            end;
        end;
    until (opcion=0);
Close(arc_logico);
end.