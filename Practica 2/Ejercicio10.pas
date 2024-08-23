program Ejercicio10;
const
valorAlto=99999;
type
    empleado=record
        departamento:Integer;
        division:Integer;
        nro_empleado:Integer;
        cat:Integer;
        can_h:Integer;
    end;
    archivo=file of empleado;
    cate=array [1..15]of real;
procedure leer(var mae:archivo; dato:empleado);
begin
  if(not Eof(mae))then
    Read(mae,dato)
    else
    dato.departamento:=valorAlto;
end;
procedure informe(var mae:archivo; v:cate);
var
rgma:empleado;
actual_dep:Integer;
actual_div:Integer;
actual_emp:Integer;
h_dep:Integer;
h_div:Integer;
h_emp:Integer;
m_emp:real;
m_div:real;
m_dep:Real;
begin
Assign(mae,'datos');
reset(mae);
leer(mae,rgma);
    while (rgma.departamento <> valorAlto) do begin
        actual_dep:=rgma.departamento;
        h_dep:=0;
        m_dep:=0;
        WriteLn('departamento',actual_dep);
        while (rgma.departamento = actual_dep) do begin
            actual_div:=rgma.division;
            h_div:=0;
            m_div:=0;
            WriteLn('Division',actual_div);
            while (rgma.departamento = actual_dep) and (rgma.division = actual_div) do begin
              actual_emp:=rgma.nro_empleado;
              h_emp:=0;
              m_emp:=0;
              WriteLn('empleado',actual_emp);
                while (rgma.departamento = actual_dep) and (rgma.division = actual_div) and (rgma.nro_empleado = actual_emp) do begin
                h_emp:=h_emp+rgma.can_h;
                m_emp:=rgma.can_h * v[rgma.cat];
                leer(mae,rgma);
                end;
                 WriteLn('empleado',actual_emp,'monto',m_emp,'horas',h_emp);
                h_div:=h_div+h_emp;
                m_div:=m_div+m_emp;
            end;
            WriteLn('division',actual_div,'monto',m_div,'horas',h_div);
            m_dep:=m_dep+m_div;
            h_dep:=h_dep+h_div;
        end;
        WriteLn('total horas departamento',h_dep);
        WriteLn('monto total departamento',m_dep);
    end;
    Close(mae);
end;
var
mae:archivo; v:cate;
begin
informe(mae,v);
end.