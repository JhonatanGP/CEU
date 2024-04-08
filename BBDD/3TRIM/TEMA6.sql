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
/*

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
*/

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
    variabale2 emp%rowtype;
begin
    --Primer caso
    select ename into variable1 from emp where empno = 7698;
    dbms_output.put_line(variable1);
    --Segundo caso
    select * into variable2 from emp where empno = 7698;
    dbms_output.put_line(variable2.ename);
end;
/
/*Ej 4
1.T
2 .F
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
/*
declare
    num1 int;
    num2 int;
begin 
    num1 := 8;
    num2 := 4;
    /*dbms_output.put_line(num1+num2);
    dbms_output.put_line(num1-num2);
    dbms_output.put_line(num1*num2);
    dbms_output.put_line(num1/num2);*//*
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
    dbms_output.put_line(num1/num2);*//*
    ejercicio7
end;
/
*/

--02/02/2024
--Ejercio8
SET SERVEROUTPUT ON; 
declare
    num1 int := 7;
    num2 int;
    --num2 int := 3;
begin
    num2 := 3;
    if num1 > num2 then 
        dbms_output.put_line('La suma de  ' || num1 || ' y ' || num2 ||' es ' || (num1+num2));
        dbms_output.put_line(num1+num2);
    end if;
end;
/

/*Ejercicio 9 modificado
Crea una función llamada restarNumEnteros que reciba dos
parámetros, num1 y num2, y si num1 es mayor que num2, devuelva
la resta de ambos números. En caso contrario, muestra por
pantalla "Num1 es menor o igual que num2" y devuelva -1.
Llama a dicha función desde un bloque de código anónimo con
los valores 7 y 3, en primer lugar, y 4 y 8 en segundo lugar.
*/
SET SERVEROUTPUT ON; 

create or replace function restarNumeros (num1 int, num2 int) return int
is

begin 
    if num1 > num2 then
        return num1 - num2;
    else
        dbms_output.put_line(num1 || 'es menor o igual que ' || num2);
        return -1;
    end if;
end;
/

declare
    numero1 int := 7;
    numero2 int := 3;
    resta int;
begin
    resta := restarNumeros (7,3);
    dbms_output.put_line(restarNumeros(numero1,numero2));
end;
/

--inda
create or replace function restarNumEnteros (num1 int, num2 int) return int
is
 
begin
    if num1 > num2 then
        return num1 - num2;
    else
        dbms_output.put_line(num1 || ' es menor o igual que ' || num2);
        return -1;
    end if;
end;
/
 
declare
    numero1 int := 7;
    numero2 int := 3;
    resta int;
begin
    resta := restarNumEnteros(7,3);
    dbms_output.put_line(resta);
    numero1 := 4;
    numero2 := 8;
    dbms_output.put_line(restarNumEnteros(numero1,numero2));
end;
/

--EJERCICIO 10 con IF / ELSIF / ELSE
declare
    nota number(2,1) := &nota;
begin
    if nota < 5 and nota >= 0 then
        dbms_output.put_line('SUSPENSO');
    elsif nota >= 5 and nota < 6 then
    dbms_output.put_line('APROBADO');
    elsif nota >= 6 and nota < 7 then
    dbms_output.put_line('BIEN');
    elsif nota >= 7 and nota < 9 then
    dbms_output.put_line('NOTABLE');
    elsif nota >= 9 and nota < 10 then
    dbms_output.put_line('SOBRESALIENTE');
    else
        dbms_output.put_line('El valor introducido es incorrecto');
    end if;
end;
/

--inda
declare
    nota number(3,1) := &nota;
begin
    if nota < 5 and nota >= 0 then
        dbms_output.put_line('SUSPENSO');
    elsif nota >=5 and nota < 6 then
        dbms_output.put_line('APROBADO');
    elsif nota >=6 and nota < 7 then
        dbms_output.put_line('BIEN');
    elsif nota >=7 and nota < 9 then
        dbms_output.put_line('NOTABLE');
    elsif nota >=9 and nota <= 10 then
        dbms_output.put_line('SOBRESALIENTE');
    else
        dbms_output.put_line('El valor introducido es incorrecto');
    end if;
end;
/

--Ejercicio 11. Hacerlo con CASE
declare
    nota number(3,1) := &nota;
begin
    case
        when nota between 0 and 4.9 then
            dbms_output.put_line('SUSPENSO');
        when nota >=5 and nota < 6 then
            dbms_output.put_line('APROBADO');
        when nota >=6 and nota < 7 then
            dbms_output.put_line('BIEN');
        when nota >=7 and nota < 9 then
            dbms_output.put_line('NOTABLE');
        when nota >=9 and nota <= 10 then
            dbms_output.put_line('SOBRESALIENTE');
        else
            dbms_output.put_line('El valor introducido es incorrecto');
    end case;
end;
/

/*12 Realiza un programa que lea por teclado dos números enteros. El primero será los goles del
equipo de casa, y el segundo los goles del equipo de fuera.
Se quiere devolver por pantalla quién ha ganado: “El equipo de casa/visitante ha ganado”. En caso
de empate se indicará “El resultado del partido ha sido de empate”. */


--08/04/2024

--BUCLES

set serveroutput on;
declare
    i int := 0;
begin
    loop 
        if i < 10 then
    dbms_output.put_line(i);
    elsif i = 10 then
        exit;
        end if;
        i := i+1; --i++ no, i+=1
    end loop;
end;
/
--otro ejemplo
set serveroutput on;
declare
    i int := 0;
begin
    loop 
        dbms_output.put_line(i);
        i := i+1;
        exit when i >=1;
    end loop;
end;
/
--Ejercicio 13
declare
    num1 int := 0;
begin
    loop 
    num1 := num1+2; --me lo suma segun ponga el numero
        dbms_output.put_line(num1);
        exit when num1 > 20;
    end loop;
end;
/

--Ejercicio 14
declare
    num1 int := 0;
begin
    loop 
    num1 := num1+1; --me lo suma segun ponga el numero
        dbms_output.put_line(num1);
        if num1 > 20 then
            exit;
        end if;
    end loop;
end;
/
--Ejercicio 15
declare
    num1 int := 0;
begin
    while num1 <=20 loop
        num1 := num1+1; --me lo suma segun ponga el numero
        dbms_output.put_line(num1);
    end loop;
end;
/
--Ejercicio 16
declare
begin
    for i in 1..20 loop
        dbms_output.put_line(i);
    end loop;
end;
/
-- Ejercicio 17 in reverse
declare
begin
    for i in reverse 0..20 loop
        dbms_output.put_line(i);
    end loop;
end;
/
--Ejercicio 18
declare 
    i int;
begin
    for indice in 0..40 loop
--  for indice in 1..40 loop
        i := mod(indice,2); 
      if i = 0 and indice != 0 then --CONDICION PAR
     -- if i != 0 then --CONDICION IMPAR
            dbms_output.put_line(indice);
        end if;
    end loop;
end;
/
-- Ejercicio 19
declare

begin
    for i in 1..10 loop
        for j in 1..10 loop
            dbms_output.put_line(i || 'x' || j || '=' || i*j);
        end loop;
    end loop;
end;
/

/*Actividad para pensar
Quiero pedir por teclado una palabra y a continuación mostraremos dicha palabra del revés. 
Deben salir en la misma línea. Ej: HOLA mostraría ALOH. */
declare
    palabra varchar(10) := '&palabra';
begin
    dbms_output.put_line(palabra); --coche
    dbms_output.put_line(substr(palabra,1,1)); --c
    dbms_output.put_line(length(palabra)); --5
end;
/

declare
    palabra varchar(10) := '&palabra';
    palabra2 varchar(10);
begin
    for i in reverse 1..length(palabra) loop
      --dbms_output.put_line(substr(palabra,i,1)); 
      palabra2 := palabra2 || substr(palabra,i,1);
    end loop;
    dbms_output.put_line(palabra2);
end;
/
--PDF REGISTROS Y TABLAS

/* Ejercicio 1
Declarar un tipo registro Tpersona con los siguientes campos: un código de tipo numérico, un nombre de tipo cadena
de 100 caracteres y la edad integer. Asignarle valor a una variable de tipo Tpersona e imprimirlo por pantalla */
declare
    type tPersona is record(
        codigo number,
        nombre varchar(100),
        edad int
    );
    persona1 tPersona;
    persona2 tPersona;
begin
    persona1.codigo := 1;
    persona1.nombre := 'Pedro';
    persona1.edad := 25;
    dbms_output.put_line('Mostrar los datos');
    dbms_output.put_line(persona1.codigo||'|'||persona1.nombre||'|'||persona1.edad);
    dbms_output.put_line(persona2.codigo||'|'||persona2.nombre||'|'||persona2.edad);
end;
/
--otro tipo
declare
    type tPersona is record(
        codigo number,
        nombre varchar(100),
        edad int
    );
    type tMascota is record(
        nombre varchar(100),
        propietario tPersona
    );
    persona1 tPersona;
    persona2 tPersona;
    mascota1 tMascota;
begin
    persona1.codigo := 1;
    persona1.nombre := '&propietario';
    persona1.edad := 25;
    mascota1.propietario := persona1;
    mascota1.nombre := '&mascota';
    dbms_output.put_line('Mostrar los datos de personas');
    dbms_output.put_line(persona1.codigo||'|'||persona1.nombre||'|'||persona1.edad);
    dbms_output.put_line(persona2.codigo||'|'||persona2.nombre||'|'||persona2.edad);
    dbms_output.put_line('Mostrar los datos de mascotas');
    dbms_output.put_line(mascota1.nombre||'|'||mascota1.propietario.codigo||'|'||mascota1.propietario.nombre||'|'||mascota1.propietario.edad);
end;
/

--QUIERO QUE ME HAGAIS UN REGISTRO TDEPT CON LA ESTRUCTURA DE LA TABLA DEPT
DECLARE
    TYPE TDEPT IS RECORD(
    DEPTNO DEPT.DEPTNO%TYPE,
    DNAME DEPT.DNAME%TYPE,
    LOC DEPT.LOC%TYPE
    );
    DEPARTAMENTO TDEPT;
BEGIN
    SELECT DNAME INTO DEPARTAMENTO.DNAME FROM DEPT WHERE DEPTNO = 40;
    SELECT * INTO DEPARTAMENTO FROM DEPT WHERE DEPTNO = 40;
    DBMS_OUTPUT.PUT_LINE(DEPARTAMENTO.DNAME);
    DBMS_OUTPUT.PUT_LINE(DEPARTAMENTO.DEPTNO);
    DBMS_OUTPUT.PUT_LINE(DEPARTAMENTO2.DNAME);
    DBMS_OUTPUT.PUT_LINE(DEPARTAMENTO2.DEPTNO);
END;
/
/*EJERCICIO 2 
2.1. Crea un registro tpersona igual que el del ejemplo de teoría. Después, crea otro registro alumno que tenga como
campos nombre varchar 100, y profesor tpersona.

2.2. Crea una variable alumno1 del tipo alumno, dale valores a todos sus campos y muéstralos por la salida.

2.3. Crea una variable alumno2 del tipo alumno, dale valores solo a nombre y código de profesor, y
saca los datos por la salida. */

--Ejercicio2
declare
    type tPersona is record(
        codigo number,
        nombre varchar(100),
        edad int
    );
    --Ejercicio 2.1
    type alumno is record(
        nombre varchar(100),
        profesor tPersona
    );
    --Ejercicio 2.2
    alumno1 alumno;
    --Ejercicio 2.3
    alumno2 alumno;
begin
    --Ejercicio 2.2
    alumno1.nombre := 'Rocket';
    alumno1.profesor.codigo := 0;
    alumno1.profesor.nombre := 'Drax';
    alumno1.profesor.edad := 125;
    dbms_output.put_line(alumno1.nombre);
    dbms_output.put_line(alumno1.profesor.codigo);
    dbms_output.put_line(alumno1.profesor.nombre);
    dbms_output.put_line(alumno1.profesor.edad);
    --Ejercicio 2.3
    alumno2.nombre := 'Groot';
    alumno2.profesor.codigo := 0;
    dbms_output.put_line(alumno2.nombre);
    dbms_output.put_line(alumno2.profesor.codigo);
end;
/
/*Ej 5
Se quieren guardar todos los datos del
departamento cuyo deptno es 30 en una variable
del tipo %rowtype llamada filacompleta. Muestra
por la salida el valor de los distintos campos de
filacompleta.*/
declare
    filacompleta dept%rowtype;
begin
    select * into filacompleta from dept where deptno = 30;
    dbms_output.put_line(filacompleta.deptno);
    dbms_output.put_line(filacompleta.dname);
    dbms_output.put_line(filacompleta.loc);
end;
/

--6
declare
    filacompleta2 dept%rowtype;
    departamentoCodigo dept.deptno%type;
begin
    select deptno,loc into filacompleta from dept where deptno = 30;
    dbms_output.put_line(filacompleta.deptno);
    dbms_output.put_line(filacompleta.dname);
    dbms_output.put_line(filacompleta.loc);
end;
/



