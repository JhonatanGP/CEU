--1.

select * from emp where empno = 8000;
create or replace function insertaEmpleado(codigo emp.empno%type) return varchar
is
    fila emp%rowtype;
begin
    resultado varchar(100);
    select * into fila from emp where empno = codigo;
    if fila.empno = codigo then
        insert from emp where empno = codigo;
        return 'Registro insertado correctamente';
    end if;
exception
    when no_data_found then
        return 'No se puede crear, ya existe';
end;
/

--2
declare
    codigoEmpno emp.empno%type := &escibe_un_codigo;
    resultado varchar(100);
begin
    dbms_output.put_line(insertaEmpleado(codigoEmpno)); 
    /
end;
/