set serveroutput on;
declare
    num1 int := 7;
    num2 int := 3;
begin
    dbms_output.put_line(num1 + num2);
end;
/
declare 
    n1 int := 8;
    n2 int := 8;
    suma int := n1+n2;
begin
    dbms_output.put_line(suma);
end;
/
declare 
    n1 int := 8;
    n2 int := 8;
    suma int := n1+n2;
begin
    dbms_output.put_line('La suma de 8+8 es: ' || suma);
end;
/
--ej &
declare 
    n1 int := 4;
    n2 int := 4;
    n3 int := &introduce_numero;
    suma int := n1+n2+n3;
begin
    dbms_output.put_line(suma);
end;
/
--ej cadena
declare
    nom varchar(100) := 'Jhonatan';
    apel varchar(100) := '&Apellidos';
begin
    dbms_output.put_line('Su nombre es: ' || nom ||' ' || apel);
end;
/
--19/03/24
--LOS BLOQUES NO ENTRAN NO SE GUARDAN, NO MEMORY. SOLO SE GUARDAN LOS PROCEDIMIENTOS Y FUNCIONES
--DENTRO DE FUNCIONES Y PROCEDIMIENTOS SE PONE IS.
-- EN CODIGO ANOMIMO ...
set serveroutput on;
create or replace procedure hoy_es(fecha date)
is 
begin
    dbms_output.put_line('Hoy es ' || to_char(fecha,'dd/mm/yyyy'));
end;
/
begin
    hoy_es(sysdate);
end;
/
create or replace function cuadrado (x number) return number
is
begin
    return x*x;
end;
/
begin
    dbms_output.put_line(cuadrado(9));
end;
/
/*CREAR PROCEDIMIENTO TODAY3_IS QUE, PRIMERO, TENGA UNA VARIABLE LOCAL LLAMADA ANTERIOR QUE SEA DATE Y VALGA UN DIA MENOS QUE EL PARAMETRO
DE FECHA ANTERIOR. MOSTRAR POR LA CONSOLA LA VARIABLE LLAMADA ANTERIOR. LUEGO MODIFICA TU BLOQUE DE CODIGO ANONIMO PARA LLAMAR A ESE 
TODAY3_IS CON EL DIA DE TU CUMPLEAÑOS.*/
create or replace procedure today3_is (fecha date)
is
    anterior date;
begin
    anterior := fecha -1;
    dbms_output.put_line('Ayer fue ' || to_char(anterior,'dd/mm/yyyy'));
end;
/
begin 
    hoy_es(sysdate);
    today3_is(sysdate);
end;
/
--CAMBIA EL TODAY3_IS PARA VER SOLO EL AÑO
create or replace procedure today3_is(fecha date)
is 
    anterior date;
begin
    anterior := fecha -1;
    dbms_output.put_line(to_char(anterior,'yyyy'));
end;
/
begin
    today3_is(sysdate);
end;
/
-- %type para coger el typo de dato de una tabla
-- %rowtype para coger el typo de dato de una columna entera
declare 
    pi constant number := 3.1415926435;
   -- pi constant number := 3; no se puede poner 2
begin
    --pi :=1;
    dbms_output.put_line(pi);
end;
/
--               LUNES 01/04/2024  PDF 2 
-- Ejercicio 1

--Declara una variable tipo fecha sin inicializarla.
--Declara una variable tipo fecha inicializada a día 6 de abril de 2021.
--Declara una variable numérica (NUMBER) con 3 dígitos que no sea null sin inicializar.
--Declara una variable numérica (NUMBER) con 4 dígitos de precisión de los cuales 2 son decimales,e inicialízala a 10,99.
--Declara una variable carácter (VARCHAR2) de tamaño 10 con la frase CLASE DE DAMDAW.
--Declara una constante numérica y valor 11.
set serveroutput on;
declare
    fecha date;
    fecha2 date := '06/04/2021';
    -- fecha2 date := to_date('06/04/2021');
    -- fecha2 date := to_date('06/04/2021'),'dd/mm/yyyy';
    numero number(3);
    numero1 number(4,2) := 10.99;
    nombre1 varchar2(10) := 'CLASE DE D';
    -- nombre1 varchar2(15) := 'CLASE DE DAMDAW';
    num_const constant number := 11;
begin
    dbms_output.put_line('');
end;
/
--Ejercicio 2
-- Declara una variable que tenga el tipo de dato igual que el de la columna ENAME de la tabla EMP.
-- Declara una variable que haga referencia a toda una fila de la tabla EMP.
declare 
    variable1 emp.ename%type;
    variable2 emp%rowtype;
begin
