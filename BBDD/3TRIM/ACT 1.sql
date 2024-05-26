--1
set serveroutput on;
create or replace function compruebaCadena(palabra1 varchar,palabra2 varchar) return varchar
is
    resultado varchar(10) := '';
begin
    if length (palabra1) > length (palabra2) then
        return palabra1 || palabra2;
    elsif length (palabra1) < length (palabra2) then
        return palabra2 || palabra1;
    else
        for i in 1..length (palabra1) loop
            resultado := resultado || '-';
        end loop;
        return resultado;
    end if;
end;
/
--2
declare
    palabra1 varchar(10) := '&palabra1';
    palabra2 varchar(10) := '&palabra2';
begin
    dbms_output.put_line(compruebaCadena(palabra1,palabra2));
end;
/
