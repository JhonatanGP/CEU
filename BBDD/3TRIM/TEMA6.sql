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
--19/03/24
--LOS BOLQUES NO ENTRAN NO SE GUARDAN, NO MEMORY. SOLO SE GUARDAN LOS PROCEDIMIENTOS Y FUNCIONES
--DENTRO DE FUNCIONES Y PROCEDIMIENTOS SE PONE IS.
-- EN CODIGO ANOMIMO ...

SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE TODAY2_IS(FECHA DATE)
IS 
BEGIN
    DBMS_OUTPUT.PUT_LINE('HOY ES ' ||TO_CHAR(FECHA,'DD/MM/YYYY'));
end;
/
--BLOQUE DE CODIGO ANONIMO
BEGIN
    TODAY2_IS('01/01/2021');
--  TODAY2_IS('HOLA');  VA DAR FALLO PORQUE NOS PIDE FECHA NO PALABRA
--  TODAY2_IS(4);       VA DAR FALLO PORQUE NOS PIDE FECHA NO NUMERO
END;
/
SHOW SERVEROUTPUT;
/*CREAR PROCEDIMIENTO TODAY3_IS QUE, PRIMERO, TENGA UNA VARIABLE LOCAL LLAMADA ANTERIOR QUE SEA DATE Y VALGA UN DIA MENOS QUE EL PARAMETRO DE FECHA
ANTERIOR. MOSTRAR POR LA CONSOLA LA VARIABLE LLAMADA ANTERIOR. LUEGO MODIFICA TU BLOQUE DE CODIGO ANONIMO PARA LLAMAR A ESE TODAY3_IS CON EL DIA
DE TU CUMPLEAÑOS.*/
CREATE OR REPLACE PROCEDURE TODAY3_IS(FECHA DATE)
IS
    ANTERIOR DATE;
BEGIN
    ANTERIOR := FECHA -1;
    DBMS_OUTPUT.PUT_LINE(ANTERIOR);
END;
/
BEGIN
    TODAY2_IS('01/01/2021');
    TODAY3_IS('01/01/2021');
END;
/
--CAMBIA EL TODAY3_IS PARA VER SOLO EL AÑO
CREATE OR REPLACE PROCEDURE TODAY3_IS(FECHA DATE)
IS
    ANTERIOR DATE;
BEGIN
    ANTERIOR := FECHA -1;
    DBMS_OUTPUT.PUT_LINE(TO_CHAR(ANTERIOR,'YYYY'));
END;
/
--
CREATE OR REPLACE PROCEDURE TODAY3_IS(FECHA DATE)
IS
    ANTERIOR DATE;
BEGIN
    ANTERIOR := FECHA -1;
    DBMS_OUTPUT.PUT_LINE(TO_CHAR(ANTERIOR,'YYYY'));
END;
/
--
SET SERVEROUTPUT ON;
CREATE OR REPLACE FUNCTION TODAY2_FUN(FECHA DATE) RETURN DATE
IS 
BEGIN
    DBMS_OUTPUT.PUT_LINE('HOY ES ' ||TO_CHAR(FECHA,'DD/MM/YYYY'));
    RETURN FECHA;
END;
/
--BLOQUE DE CODIGO ANONIMO
BEGIN
    DBMS_OUTPUT.PUT_LINE(TO_CHAR(TODAY2_FUN('01/01/2021'),'YYYY'));

END;
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
--PDF 2
-- Ejercicio 1
? Declara una variable tipo fecha sin inicializarla.
? Declara una variable tipo fecha inicializada a día 6
de abril de 2021.
? Declara una variable numérica (NUMBER) con 3
dígitos que no sea null sin inicializar.
? Declara una variable numérica (NUMBER) con 4
dígitos de precisión de los cuales 2 son decimales,
e inicialízala a 10,99.
? Declara una variable carácter (VARCHAR2) de
tamaño 10 con la frase CLASE DE DAMDAW.
? Declara una constante numérica y valor 11.

--LUNES 01/04/2024

SET SERVEROUTPUT ON; 
declare
    mivariable int;
    mivariable2 dept.deptno%type; --numbre (2,0) ahora, si cambia, el nuevo
    mivariable3 dept.dname%type;
    mivariable4 dept.loc%type;
    mifila dept%rowtype;
begin
    mivariable := 25;-- 2 cosas que no se pueden hacer ni el = para asignar ni el == para comparar
    mivariable2:=8;
    mivariable3 := 'Nombre';
    mivariable4 := 'Sevilla bajo';
    mifila.deptno := 8;
    select * into mifila from dept where deptno = 10; --para guardar todos los datos selecionados en la variable mifila
   -- dbms_output.put_line(mivariable);
    --dbms_output.put_line(mivariable2);
    --dbms_output.put_line(mifila.deptno);
     dbms_output.put_line(mifila.deptno||mifila.dname||mifila.loc);
end;
/

--Ejercicio 1
SET SERVEROUTPUT ON; 
declare
    fecha date;
    fecha2 date := '06/04/2021';
    -- fecha2 date := to_date('06/04/2021');
    -- fecha2 date := to_date('06/04/2021'),'dd/mm/yyyy';
    numero number(3);
    numero1 number(4,2) := 10.99;
    nombre1 varchar2(10) := 'CLASE DE D';
    -- nombre1 varchar2(15) := 'CLASE DE DAMDAW';
begin
    dbms_output.put_line('');
end;
/
--Ejercicio 2
declare 
    variable1 emp.ename%type;
    variabale2 emp.%rowtype;
begin
    --Primer caso
    select ename into variable1 from emp where
    dbms_output.put_line(variable1);
    --Segundo caso
    select * into variable2 from emp where empno = 7698;
    dbms_output.put_line(variable2.ename);
end;
/
/*Ej 4
1.T
2.F
3.T
4.N
5.T
6.T
7.T
8.F
9.T
10.F
11.F
12.F
*/
--EJERCICIO 5
--Crea un bloque de código anónimo que pida la base y altura de un triángulo, y devuelva el área de este.
--NOTA: El área de un triángulo es base por altura entre dos.
SET SERVEROUTPUT ON; 

create or replace function calcularAreaTriangulo(base int,altura int)return number
is
    total number := 0;
begin
    total :=  (base*altura)/2;
    return total;
end;
/

declare
    base int :=&dame_un_valor_para_base;
    altura int := &dame_un_numero_para_altura;
    total int;
begin
    total := (base*altura)/2;
    dbms_output.put_line('El área es: ' || total);
    dbms_output.put_line('El área es (con funcion): ' || calcularAreaTriangulo(5,15));
end;
/
--Ejercio6
SET SERVEROUTPUT ON; 
declare
    nombre varchar2(100) := '&dametunombre';
    apellido varchar2(100) := '&dametuapellido';
begin
    dbms_output.put_line('Hola ' || nombre || ' ' || apellido);
end;
/

--Ejercicio 7
declare
    num1 int;
    num2 int;
begin 
    num1 := 8;
    num2 := 4;
    /*dbms_output.put_line(num1+num2);
    dbms_output.put_line(num1-num2);
    dbms_output.put_line(num1*num2);
    dbms_output.put_line(num1/num2);*/
    ejercicio7
end;
/

--Ejercicio 7 otra forma
declare
    num1 int;
    num2 int;
begin 
    num1 := 8;
    num2 := 4;
    /*dbms_output.put_line(num1+num2);
    dbms_output.put_line(num1-num2);
    dbms_output.put_line(num1*num2);
    dbms_output.put_line(num1/num2);*/
    ejercicio7
end;
/


    