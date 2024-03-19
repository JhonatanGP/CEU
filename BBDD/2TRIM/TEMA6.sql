set serveroutput on;
begin
    dbms_output.put_line('No he puesto nada');
end;
/
--ej
set serveroutput on;
declare
    num int := 7;
begin
    dbms_output.put_line(num);
end;
/
--ej
set serveroutput on;
declare
    num1 int := 7;
    num2 int := 3;
begin
    dbms_output.put_line(num1 + num2);
end;
/
--ej
set serveroutput on;
declare
    num1 int := 8;
    num2 int := 8;
    suma int := num1 + num2;
begin
    dbms_output.put_line(suma);
end;
/
--ej
set serveroutput on;
declare
    num1 int := 8;
    num2 int := 8;
    suma int := num1 + num2;
begin
    dbms_output.put_line('La suma de 8+8 es: ' || suma);
end;
/
--ej
set serveroutput on;
declare
    num1 int := 8;
    num2 int := 8;
    suma int := num1 - num2;
begin
    dbms_output.put_line('La resta de 8-8 es: ' || suma);
end;
/
--ej
set serveroutput on;
declare
    num1 int := 8;
    num2 int := 4;
    otro int := &dame_algo;
    suma int := num1 + num2 + otro;
begin
    dbms_output.put_line('La suma es: ' || suma);
end;
/
--ej
set serveroutput on;
declare
    num1 int := 8;
    num2 int := 4;
    cadena varchar(8) := '&cadena';
    suma int := num1 + num2;
begin
    dbms_output.put_line('La suma es: ' || suma ||' '|| cadena);
end;
/