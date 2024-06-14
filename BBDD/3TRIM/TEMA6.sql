
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
/*CREAR PROCEDIMIENTO TODAY3_IS QUE, PRIMERO, TENGA UNA VARIABLE LOCAL LLAMADA ANTERIOR QUE SEA DATE Y VALGA UN DIA MENOS QUE EL PARAMETRO
DE FECHA ANTERIOR. MOSTRAR POR LA CONSOLA LA VARIABLE LLAMADA ANTERIOR. LUEGO MODIFICA TU BLOQUE DE CODIGO ANONIMO PARA LLAMAR A ESE 
TODAY3_IS CON EL DIA DE TU CUMPLEAÑOS.*/
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
begin
    today3_is(sysdate);
end;
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
    mivariable2:= 8;
    mivariable3 := 'Nombre';
    mivariable4 := 'Sevilla bajo';
    mifila.deptno := 8;
    select * into mifila from dept where deptno = 10; --para guardar todos los datos selecionados en la variable mifila
   -- dbms_output.put_line(mivariable);
    --dbms_output.put_line(mivariable2);
    --dbms_output.put_line(mifila.deptno);
     dbms_output.put_line(mifila.deptno|| mifila.dname|| mifila.loc);
end;
/
--PDF 2 Ejercicio 1
/* Declara una variable tipo fecha sin inicializarla.
? Declara una variable tipo fecha inicializada a día 6  de abril de 2021.
? Declara una variable numérica (NUMBER) con 3  dígitos que no sea null sin inicializar.
? Declara una variable numérica (NUMBER) con 4  dígitos de precisión de los cuales 2 son decimales,e inicialízala a 10,99.
? Declara una variable carácter (VARCHAR2) de  tamaño 10 con la frase CLASE DE DAMDAW.
? Declara una constante numérica y valor 11.*/

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
--Declara una variable que tenga el tipo de dato igual que el de la columna ENAME de la tabla EMP.
--Declara una variable que haga referencia a toda una fila de la tabla EMP.

--Ejercicio 3. Utilizando las dos variables declaradas en el ejercicio 2, asígnales los valores siguientes:
--? Primer caso: el valor del campo ENAME cuando EMPNO vale 7839.
--? Segundo caso: la fila completa cuando EMPNO vale 7698.
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
01. (16 – 8) / 2 = 4
02. (7 + 3) != 10
03. 0 IS NOT NULL
04. (3 = (9/3)) AND NULL
05. NULL OR (2 * 5 = 10)
06. 0 <> NULL
07. 4 BETWEEN 3 AND 9
08. NOT(2 ** 3 = 8)
09. ‘a12’ = ‘a’ || ’12’
10. 0 IS NULL
11. ‘ANA’ LIKE ‘%N’
12. ‘B’ IN (‘A’,’D’)

01.T
02.F
03.T
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
create or replace function calcularAreaTriangulo(base int,altura int)return number
is
    total number := 0;
begin
    total :=  (base*altura)/2;
    return total;
end;
/
begin
    dbms_output.put_line('El área es: ' || calcularAreaTriangulo(5,15));
end;
/
--Ejercio6 
--Crea un bloque de código anónimo que requiera por pantalla un nombre, luego un apellido y muestre como resultado “Hola nombre apellido”.
declare
    nombre varchar2(100) := '&dametunombre';
    apellido varchar2(100) := '&dametuapellido';
begin
    dbms_output.put_line('Hola ' || nombre || ' ' || apellido);
end;
/

--Ejercicio 7 
--Crea un programa que realiza la suma, resta, multiplicación y división de dos números enteros, num1 y num2 (8 y 4).
declare
    num1 int;
    num2 int;
begin
    num1 := 8;
    num2 := 4;
    dbms_output.put_line(num1+num2);
    dbms_output.put_line(num1-num2);
    dbms_output.put_line(num1*num2);
    dbms_output.put_line(num1/num2);
end;
/
--02/02/2024
/*Ejercio 8
Crea un programa que realiza la suma de dos números enteros, num1 y num2, si num1 es mayor que num2. En caso contrario que no haga nada. 
Asigna por ejemplo los valores 7 y 3 a los números.*/
SET SERVEROUTPUT ON; 
declare
    n1 int :=&dame_un_valor;
    n2 int := &dame_un_valor;
begin
    if n1 > n2 then  dbms_output.put_line('La suma  es: ' || (n1+n2));
    else dbms_output.put_line('');
    end if;
end;
/
declare
    num1 int := &introduce_valor ;
    num2 int := &introduce_valor ;
begin
    if num1 > num2 then dbms_output.put_line('La suma de  ' || num1 || ' y ' || num2 ||' es ' || (num1+num2));
    end if;
end;
/

/*Ejercicio 9 modificado
Crea una función llamada restarNumEnteros que reciba dos parámetros, num1 y num2, y si num1 es mayor que num2, devuelva la resta de ambos
números. En caso contrario, muestra por pantalla "Num1 es menor o igual que num2" y devuelva -1. Llama a dicha función desde un bloque de
código anónimo con los valores 7 y 3, en primer lugar, y 4 y 8 en segundo lugar.*/

create or replace function restarNumEnteros (num1 int, num2 int) return int
is
 
begin
    if num1 > num2 then dbms_output.put_line(num1 || ' es mayor que ' || num2 ||' '|| 'Su resta es:');
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
/*Crea un programa que tome pida una variable al usuario para que la introduzca por teclado (tiene que ser un número), y según sea su valor 
entre 0 y 10, devuelva por pantalla el valor de la nota: SUSPENSO, APROBADO, BIEN, NOTABLE,SOBRESALIENTE. En caso contrario, que devuelva
‘El valor introducido es incorrecto’.*/
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

--Ejercicio 11. Hacerlo con CASE el 10
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

/*12 Realiza un programa que lea por teclado dos números enteros. El primero será los goles del equipo de casa, y el segundo los goles del
equipo de fuera. Se quiere devolver por pantalla quién ha ganado: “El equipo de casa/visitante ha ganado”. En caso de empate se indicará
“El resultado del partido ha sido de empate”. */
declare
    eq1 INT := &goles_casa;
    eq2 INT := &goles_fuera;
begin
     if eq1 > eq2  then
        dbms_output.put_line('El equipo de casa ha ganado');
    elsif eq1 = eq2 then
        dbms_output.put_line('empate');
    else
        dbms_output.put_line('El equipo de fuera ha ganado');
    end if;
end;
/
--08/04/2024
--BUCLES
set serveroutput on;
declare
    i int := 0;
begin
    loop 
        if i <= 10 then
    dbms_output.put_line(i);
    elsif i = 11 then
        exit;
        end if;
        i := i+1; --i++ no, i+=1
    end loop;
end;
/
--otro ejemplo
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
/*Realiza un programa que ejecute un bucle LOOP y se salga con un EXIT WHEN. Para ello crea una variable entero inicializada a 0 y que se vaya
incrementando en el bucle, además de mostrar por pantalla su valor; la condición de salida será cuando dicha variable valga más de 20.*/
declare
    num1 int := 0;
begin
    loop 
    num1 := num1+2; --me lo suma segun ponga el numero
        dbms_output.put_line(num1);
        exit when num1 >= 20;
    end loop;
end;
/
--Ejercicio 14. Realiza un programa que haga lo indicado en el ejercicio 13 pero que se salga mediante un IF condición THEN EXIT.
declare
    num1 int := 0;
begin
    loop 
    num1 := num1+1; --me lo suma segun ponga el numero
        dbms_output.put_line(num1);
        if num1 >= 20 then
            exit;
        end if;
    end loop;
end;
/
--Ejercicio 15. Realiza un programa que haga lo indicado en el ejercicio 13 pero emplea un bucle WHILE.
declare
    num1 int := 0;
begin
    while num1 <= 19 loop
        num1 := num1+1; --me lo suma segun ponga el numero
        dbms_output.put_line(num1);
    end loop;
end;
/
--Ejercicio 16. el 13 pero con FOR
declare
begin
    for i in 1..20 loop
        dbms_output.put_line(i);
    end loop;
end;
/
-- Ejercicio 17. El 13 pero con FOR in reverse
declare
begin
    for i in reverse 0..20 loop
        dbms_output.put_line(i);
    end loop;
end;
/
--Ejercicio 18 
/*Realiza un programa que muestre por pantalla los números pares hasta llegar a 40, inclusive.
Nota: la función MOD(m,n) devuelve el resto de dividir el parámetro m entre el parámetro n.*/
declare 
    i int;
begin
    for indice in 0..40 loop
        i := mod(indice,2); 
        if i = 0 and indice != 0 then --CONDICION PAR
     -- if i != 0 then --CONDICION IMPAR
            dbms_output.put_line(indice);
        end if;
    end loop;
end;
/
-- Ejercicio 19. Realiza un programa que muestre por pantalla las tablas de multiplicar del 1 al 10.
begin
    for i in 1..10 loop
        for j in 1..10 loop
            dbms_output.put_line(i || 'x' || j || '=' || i*j);
        end loop;
    end loop;
end;
/
/*Actividad para pensar
Pedir por teclado una palabra y mostraremos dicha palabra del revés. Deben salir en la misma línea. Ej: HOLA mostraría ALOH. */
declare
    palabra varchar(10) := '&palabra';
begin
    dbms_output.put_line(palabra); --coche
    dbms_output.put_line(substr(palabra,1,1)); --c
    dbms_output.put_line(length(palabra)); --5
end;
/
DECLARE
    p1 VARCHAR2(100) := '&palabra'; -- Pedimos al usuario que ingrese una palabra
    p2 VARCHAR2(100) := '';         -- Invertimos la palabra
BEGIN
    FOR i IN REVERSE 1..LENGTH(p1) LOOP
        p2 := p2 || SUBSTR(p1, i, 1);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Palabra invertida: ' || p2);
    dbms_output.put_line('Número de letras: ' || length(p1)); 
END;
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
    mascota1 tMascota;
begin
    persona1.codigo := 1;
    persona1.nombre := '&propietario';
    persona1.edad := 25;
    mascota1.propietario := persona1;
    mascota1.nombre := '&mascota';
    dbms_output.put_line('Mostrar los datos de personas');
    dbms_output.put_line(persona1.codigo||'|'||persona1.nombre||'|'||persona1.edad);
    dbms_output.put_line('Mostrar los datos de mascotas');
    dbms_output.put_line(mascota1.nombre||'|'||mascota1.propietario.codigo||'|'||mascota1.propietario.nombre||'|'||mascota1.propietario.edad);
end;
/
/*EJERCICIO 2 
02.1. Crea un registro tpersona igual que el del ejemplo de teoría. Después, crea otro registro alumno que tenga como
campos nombre varchar 100, y profesor tpersona.
02.2. Crea una variable alumno1 del tipo alumno, dale valores a todos sus campos y muéstralos por la salida.
02.3. Crea una variable alumno2 del tipo alumno, dale valores solo a nombre y código de profesor, y saca los datos por la salida. */
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
    alumno1.nombre := 'JUAN';
    alumno1.profesor.codigo := 440;
    alumno1.profesor.nombre := 'JULIO';
    alumno1.profesor.edad := 45;
    dbms_output.put_line('EJERCICIO2.2');
    dbms_output.put_line(alumno1.nombre);
    dbms_output.put_line(alumno1.profesor.codigo);
    dbms_output.put_line(alumno1.profesor.nombre);
    dbms_output.put_line(alumno1.profesor.edad);
    --Ejercicio 2.3
    alumno2.nombre := 'ANA';
    alumno2.profesor.codigo := 457;
    dbms_output.put_line('EJERCICIO2.3');
    dbms_output.put_line(alumno2.nombre);
    dbms_output.put_line(alumno2.profesor.codigo);
end;
/
/*Ej 5
Se quieren guardar todos los datos del departamento cuyo deptno es 30 en una variable del tipo %rowtype 
llamada filacompleta. Muestra por la salida el valor de los distintos campos de filacompleta.*/
declare
    filacompleta dept%rowtype;
begin
    select * into filacompleta from dept where deptno = 30;
    dbms_output.put_line(filacompleta.deptno);
    dbms_output.put_line(filacompleta.dname);
    dbms_output.put_line(filacompleta.loc);
end;
/
--15/04/2024
/*6
Se quieren guardar los datos deptno y loc del departamento cuyo deptno es 40 en una variable del tipo %rowtype llamada filacompleta2. 
Muestra por la salida el valor de los dos campos de filacompleta2.*/
set serveroutput on;
declare
    filacompleta2 dept%rowtype;
    ---departamentoCodigo dept.deptno%type;
begin
    select deptno,loc into filacompleta2.deptno, filacompleta2.loc from dept where deptno = 40;
    dbms_output.put_line(filacompleta2.deptno);
    dbms_output.put_line(filacompleta2.loc);
    select * into filacompleta2 from dept where deptno = 40;
    dbms_output.put_line(filacompleta2.deptno);
    dbms_output.put_line(filacompleta2.loc);
end;
/
/*Ejercicio 7
Declarar una tabla de números y asignarle con un bucle for los números del 1 al 10. Además de
asignar el valor dentro del bucle, mostrar el valor de la tabla por pantalla en cada iteración.*/
declare
    type tipoTablaNum is table of int index by binary_integer;
    valTablanum tipoTablaNum; --valTablaNum1(1) := 1; valTablaNum2(2) := 2; ...
begin
   for i in 1 ..10 loop
        valTablaNum(i) := i;
        dbms_output.put_line(valTablaNum(i));
    end loop;
end;
/
-- exception
declare
    type tipoTablaNum is table of int index by binary_integer;
    valTablanum tipoTablaNum; --valTablaNum1(1) := 1; valTablaNum2(2) := 2; ...
begin
   for i in 1 ..10 loop
        valTablaNum(i) := i;
        dbms_output.put_line(valTablaNum(i));
    end loop;
    --dbms_output.put_line(valTablaNum(20));
    valTablaNum(22) := 1;
    dbms_output.put_line(valTablaNum(22));
exception
    when no_data_found then
        dbms_output.put_line('No hay valores');
end;
/
/*Ejercicio 8
Declarar una tabla de ‘personas’. Donde ‘personas’ es un tipo registro que almacena nombre, apellido1
y apellido2. Asignarle valores para una persona e imprimirlos por pantalla.*/
set serveroutput on;
declare
        type personas is record (
        nombre varchar (100),
        apellido1 varchar(100),
        apellido2 varchar(100)
        );
        --Creamos el tipo de dato tabla
        type tTabla is table of personas index by binary_integer;
        --declaramos una variable del tipo tTabla
        tablaValores tTabla;
begin
    tablaValores(1).nombre := 'Pepito';
    tablaValores(1).apellido1 := 'Garcia';
    tablaValores(1).apellido2 := 'Grillos';    
    dbms_output.put_line(tablaValores(1).nombre || ' ' || tablaValores(1).apellido1 || ' ' || tablaValores(1).apellido2);
    tablaValores(2).nombre := 'Antonio';
    tablaValores(2).apellido1 := 'Montaño';
    tablaValores(2).apellido2 := 'Palacios';    
    dbms_output.put_line(tablaValores(2).nombre || ' ' || tablaValores(2).apellido1 || ' ' || tablaValores(2).apellido2);
end;
/
/*Ejercicio 9. Sobre el ejercicio 7:
1. Utilizar la función COUNT para devolver el número de elementos.
2. Recorrerlo con FIRST Y LAST.
3. Eliminar el último de la tabla y devolver el número total de elementos.
4. Preguntar si existe valor en la posición 10.*/
declare
    type tipoTablaNum is table of int index by binary_integer;
    valTablanum tipoTablaNum; --valTablaNum1(1) := 1; valTablaNum2(2) := 2; ...
begin
   for i in 1 ..10 loop
        valTablaNum(i) := i;
        dbms_output.put_line(valTablaNum(i));
    end loop;
end;
/
-- exception
declare
    type tipoTablaNum is table of int index by binary_integer;
    valTablanum tipoTablaNum; --valTablaNum1(1) := 1; valTablaNum2(2) := 2; ...
begin
   for i in 1 ..10 loop
        valTablaNum(i) := i;
        dbms_output.put_line(valTablaNum(i));
    end loop;
    --1
    dbms_output.put_line(valTablaNum.count);
    --2
    for j in valTablaNum.first..valTablaNum.last loop
        dbms_output.put_line(valTablaNum(j));
    end loop;
    --3
    valTablaNum.delete(valTablaNum.last);
        dbms_output.put_line(valTablaNum.count);
    --4
    if not(valTablaNum.exists(10)) then
        dbms_output.put_line('No existe la posición 10');
    else
        dbms_output.put_line('Existe la posición 10');
    end if;
end;
/
/*Ejercicio 10
Se quiere mostrar por pantalla los datos de ciertos empleados (tabla emp). Se pide:
? Se pedirá al usuario por la entrada de plsql que introduzca dos valores integer que coincidan con dos empnos de la tabla emp,
y se guardarán en una tabla de integers.
? Se debe crear una tabla que contendrá como valores todos los campos de las filas de emp cuyo empno coincida con los de la
tabla anterior. Puedes usar registros o %rowtype.
? Recorre la tabla anterior mostrando por la salida los valores de cada columna de los dos registros.
NOTA: debes usar las funciones FIRST, LAST, COUNT, etc. para los índices de tus bucles. Usa por ejemplo empno 7839 y 7698. */
declare
    valor1 emp.empno%type := &empno1;
    valor2 emp.empno%type := &empno2;
    type tTabla1 is table of emp.empno%type index by binary_integer;
    tabla1 tTabla1;
    type tTabla2 is table of emp%rowtype index by binary_integer;
    tabla2 tTabla2;
begin
    tabla1(1) := valor1;
    tabla1(2) := valor2;
    for i in tabla1.first..tabla1.last loop
        select * into tabla2(i) from emp where empno = tabla1(i);
    end loop;
    for j in tabla2.first..tabla2.last loop
        dbms_output.put_line(tabla2(j).empno);
        dbms_output.put_line(tabla2(j).ename);
        dbms_output.put_line(tabla2(j).job);
        dbms_output.put_line(tabla2(j).mgr);
        dbms_output.put_line(tabla2(j).hiredate);
        dbms_output.put_line(tabla2(j).sal);
        dbms_output.put_line(tabla2(j).comm);
        dbms_output.put_line(tabla2(j).deptno);
    end loop;
end;
/
--LUNES 22/04/2024 FALTÉ
CREATE TABLE ESTUDIANTES (
    codigo           NUMBER PRIMARY KEY,
    dni              VARCHAR2(10),
    nombre           VARCHAR2(50),
    apellidos        VARCHAR2(50),
    fecha_nacimiento DATE
);
INSERT INTO ESTUDIANTES (codigo,dni, nombre, apellidos, fecha_nacimiento)
VALUES (1,'75812952P', 'Ricardo','Lopez Lopez', to_date('10/10/1999','dd/mm/yyyy'));
INSERT INTO ESTUDIANTES (codigo,dni, nombre, apellidos, fecha_nacimiento)
VALUES (2,'48956895Q', 'Marta','Carrasco Perez', to_date('10/10/1998','dd/mm/yyyy'));
INSERT INTO ESTUDIANTES (codigo,dni, nombre, apellidos, fecha_nacimiento)
VALUES (3,'58268587L', 'Blanca','Baron Santos', to_date('01/05/1999','dd/mm/yyyy'));
INSERT INTO ESTUDIANTES (codigo, dni, nombre, apellidos, fecha_nacimiento)
VALUES (4,'28388914P', 'Ana','Ramirez Gomez', to_date('08/04/1999','dd/mm/yyyy'));
INSERT INTO ESTUDIANTES (codigo, dni, nombre, apellidos, fecha_nacimiento)
VALUES (5,'97898989T', 'Marta','Valencia Cabello', to_date('15/06/1999','dd/mm/yyyy'));

CREATE TABLE ASIGNATURAS(
    codigo          NUMBER(10) PRIMARY KEY,
    curso           NUMBER(1),
    descripcion     VARCHAR2(50),
    profesor        VARCHAR2(50)
);
INSERT INTO ASIGNATURAS VALUES (1,1,'Redes','Elena Perez');
INSERT INTO ASIGNATURAS VALUES (2,1,'Gestion de Base de datos','Ricardo Del Valle');
INSERT INTO ASIGNATURAS VALUES (3,1,'Social','Sofia Islas');
INSERT INTO ASIGNATURAS VALUES (4,1,'Matematicas','Federico Lopez');
INSERT INTO ASIGNATURAS VALUES (5,1,'Ingles','Dolores Martin');
INSERT INTO ASIGNATURAS VALUES (6,2,'Educacion Fisica','David Gomez');
INSERT INTO ASIGNATURAS VALUES (7,2,'Musica','Teresa Jimenez');
INSERT INTO ASIGNATURAS VALUES (8,2,'Lengua','Pepa de la Puerta');
INSERT INTO ASIGNATURAS VALUES (9,2,'Natural','Inma Alonso');
INSERT INTO ASIGNATURAS VALUES (10,2,'Aleman','Marta Jimenez');

CREATE TABLE MATRICULAS(
    cod_alumno      NUMBER(10),
    cod_asignatura  NUMBER(10),
    nota            VARCHAR2(4),
    PRIMARY KEY (cod_alumno,cod_asignatura),
    FOREIGN KEY (cod_alumno) REFERENCES estudiantes(codigo),
    FOREIGN KEY (cod_asignatura) REFERENCES ASIGNATURAS(codigo)
);
INSERT INTO MATRICULAS VALUES (1,1,4.5);
INSERT INTO MATRICULAS VALUES (1,2,5);
INSERT INTO MATRICULAS VALUES (1,3,8);
INSERT INTO MATRICULAS VALUES (2,2,6);
INSERT INTO MATRICULAS VALUES (2,6,9);
INSERT INTO MATRICULAS VALUES (2,9,8);
INSERT INTO MATRICULAS VALUES (3,5,10);
INSERT INTO MATRICULAS VALUES (3,8,9);
INSERT INTO MATRICULAS VALUES (4,2,10);
INSERT INTO MATRICULAS VALUES (4,4,9);
INSERT INTO MATRICULAS VALUES (4,6,4);
INSERT INTO MATRICULAS VALUES (4,8,6);
INSERT INTO MATRICULAS VALUES (5,5,10);
INSERT INTO MATRICULAS VALUES (5,6,9);
INSERT INTO MATRICULAS VALUES (5,7,10);
INSERT INTO MATRICULAS VALUES (5,9,6);
commit;

--MARTES 23/04/2024

/*1.Se necesita una función llamada compruebaCadena que reciba dos parámetros que sean palabras del tipo varchar tamaño 10. Si la palabra
1 tiene más letras que la palabra 2, la función devolverá concatenadas ambas palabras, siendo primero la palabra 1 y a continuación la
palabra 2 (juntas). Si la palabra 2 tiene más letras que la palabra 1, la función devolverá una palabra que sea la unión/concatenación de
la palabra 2 junto a la palabra 1 (en ese orden). Si ambas palabras tienen el mismo número de letras, la función debe devolver tantos
guiones como letras tengan (ej.: si ambas palabras tienen 4 letras, debe devolver ----).*/
set serveroutput on;
create or replace function compruebaCadena(palabra1 varchar,palabra2 varchar) return varchar
is
    tam_palabra1 int := length(palabra1);
    total varchar(100) := '';
begin
    if tam_palabra1 > length(palabra2) then
        return palabra1||palabra2;
    elsif tam_palabra1 < length(palabra2) then
        return palabra2||palabra1;
    else --tam_palabra1 = length(palabra2)
        for i in 1..tam_palabra1 loop
            total := total || '-';
        end loop;
        return total;
    end if;
end;
/
/*2.Realiza un bloque de código anónimo que pida al usuario que meta dos palabras por teclado de menos de diez letras (palabra 1 y palabra 2),
y después muestra por pantalla el resultado de llamar a compruebaCadena usando las siguientes cadenas:
2.1. Palabra 1 igual a DECKARD y palabra 2 igual a RICK.
2.2. Palabra 1 igual a ZHORA y palabra 2 igual a BATTY. */
declare
    palabra1 varchar(10) := '&palabra1';
    palabra2 varchar(10) := '&palabra2';
begin
    dbms_output.put_line(compruebaCadena(palabra1,palabra2));
end;
/

/*Ejercicio 4.
Definir un cursor explícito que seleccione el nombre, apellidos y DNI de la tabla
ESTUDIANTES por ORDEN ALFABÉTICO DE APELLIDO, y en caso de coincidir, orden ALFABÉTICO DE NOMBRE. 
Recorrerlo y mostrar todos los datos recuperados. Escribir al final el número de filas recuperadas en total.*/

declare
    --cursor datosEstudiantes is select * from estudiantes;
    --filaEstudiante estudiantes%rowtype;
    cursor datosEstudiantes is 
        select nombre,apellidos,dni 
            from estudiantes
            order by apellidos,nombre;
    nombreEstudiante estudiantes.nombre%type;
    apellidosEstudiante estudiantes.apellidos%type;
    dniEstudiante estudiantes.dni%type;
begin
    open datosEstudiantes;
    loop
        fetch datosEstudiantes into nombreEstudiante,apellidosEstudiante,dniEstudiante;
        exit when datosEstudiantes%notfound;
        dbms_output.put_line(apellidosEstudiante||', '||nombreEstudiante||', DNI: '||dniEstudiante);      
    end loop;
    dbms_output.put_line('Total de estudiantes: '||datosEstudiantes%rowcount);
    close datosEstudiantes;
end;
/

/*Ejercicio 5.
Definir un cursor explícito que seleccione el nombre y la fecha de nacimiento de la tabla ESTUDIANTES. Recorrerlo y mostrar todos 
los datos recuperados con WHILE LOOP. Escribir al final el número de filas recuperadas en total. */
set serveroutput on;
declare
    cursor datos is select * from estudiantes;
    fila estudiantes%rowtype; --fila.nombre, fila.fecha_nacimiento
    contador int := 0;
begin
    open datos;
    fetch datos into fila;
    while datos%found loop
        contador := contador + 1;
        dbms_output.put_line(fila.nombre||'-'||fila.fecha_nacimiento);
        fetch datos into fila;
    end loop;
    close datos;
    dbms_output.put_line('Total = ' || contador);
end;
/
/*Ejercicio 6.
Definir un cursor explícito que seleccione el nombre, apellidos y fecha de nacimiento de la tabla ESTUDIANTES. Recorrerlo y 
mostrar todos los datos recuperados con un bucle FOR. Escribir el número de filas recuperadas en total.*/
set serveroutput on;
declare
    cursor datos is select nombre,apellidos,fecha_nacimiento from estudiantes;
    fila estudiantes%rowtype;
    total int := 0;
begin
    for fila in datos loop
        total := total + 1;
        dbms_output.put_line(fila.nombre||fila.apellidos||fila.fecha_nacimiento);
    end loop;
    dbms_output.put_line(total);
end;
/
/*Ejercicio 7.
Se quiere mostrar por pantalla el nombre y apellidos de los estudiantes que se llamen de cierta forma. 
Para ello se pedirá al usuario que introduzca el nombre a buscar.
El formato requerido para mostrar por pantalla es el siguiente (todo en mayúsculas): “APELLIDOS, NOMBRE”.
Ej.: CARRASCO PEREZ, MARTA.
En el supuesto de que SELECT no se traiga ningún registro, mostrar por pantalla “NO HAY DATOS”. Utiliza un
bucle WHILE. Lanza la ejecución para el nombre “Marta” y después para el nombre “Luis”. */
set serveroutput on;
declare
    vNombre estudiantes.nombre%type := '&nombre';
    cursor cEstudiantes is select nombre,apellidos from estudiantes where upper(nombre) = upper(vNombre);
    filaEstudiante estudiantes%rowtype;
    total int := 0;
begin
    for filaEstudiante in cEstudiantes loop
        total := total + 1;
        dbms_output.put_line(upper(filaEstudiante.apellidos)||', '||upper(filaEstudiante.nombre));
    end loop;
    if total = 0 then
        dbms_output.put_line('NO HAY DATOS');
    end if;
end;
/

--LUNES 29/04/2024
-- ACTIVIDADES 1
/*1. Se quiere saber si un año es bisiesto o no. Para ello, se debe pedir por pantalla introducir un año, y 
  luego se mostrará un mensaje por pantalla indicando "El año es bisiesto" o "El año no es bisiesto", 
  según corresponda. Un año es bisiesto si el resto de dividir el año entre 4 es cero y además, el resto 
  de dividir ese año entre 100 es distinto de cero o bien el resto de dividir ese año entre 400 es cero.*/
set serveroutput on;
declare
    anyo int := &introduce_anyo;
begin
    if mod(anyo,4) = 0 and (mod(anyo,100) != 0 or mod(anyo,400) = 0) then
        dbms_output.put_line('El año es bisiesto');
    else
        dbms_output.put_line('El año no es bisiesto');
    end if;
end;
/
/*2. Realiza el ejercicio anterior pero usando la siguiente condición para saber si es bisiesto: "un año bisiesto tiene 366 días". */
set serveroutput on;
declare
    anyo int := &introduce_anyo;
begin
    if ( to_date('31/12/' || anyo) - to_date('01/01/' || anyo) + 1 ) = 366 then
        dbms_output.put_line('El año es bisiesto');
    else
        dbms_output.put_line('El año no es bisiesto');
    end if;
end;
/
/*3. Obtener dos listas con los pares e impares desde el 1 hasta el número que se introduzca por pantalla.*/
set serveroutput on;
declare
    num int := &num_maximo;
    pares varchar2(100);
    impares varchar2(100);
begin
    for i in 1..num loop
        if mod(i,2) = 0 then
            pares := pares || ',' || i;
        else
            impares := impares || ',' || i;
        end if;
    end loop;
    pares := substr(pares,2);
    impares := substr(impares,2);
    dbms_output.put_line('Nº pares: ' || pares);
    dbms_output.put_line('Nº impares: ' || impares);
end;
/
/*4. Dado un determinado código de departamento (DEPTNO) de la tabla DEPT, devolver por pantalla el nombre (DNAME).*/
set serveroutput on;
declare
    num int := &num_maximo;
    pares varchar2(100);
    impares varchar2(100);
begin
    for i in 1..num loop
        if mod(i,2) = 0 then
            pares := pares || ',' || i;
        else
            impares := impares || ',' || i;
        end if;
    end loop;
    pares := substr(pares,2);
    impares := substr(impares,2);
    dbms_output.put_line('Nº pares: ' || pares);
    dbms_output.put_line('Nº impares: ' || impares);
end;
/
--otra forma CON TABLAS
declare
    num int := &num_maximo;
    type tipoTabla is table of int index by binary_integer;
    pares tipoTabla;
    impares tipoTabla;
    cadena varchar2(100);
begin
    for i in 1..num loop
        if mod(i,2) = 0 then --es par
            pares(pares.count+1) := i;
        else
            impares(impares.count+1) := i;
        end if;
    end loop; 
    dbms_output.put_line('Nº pares:');
    for i in pares.first..pares.last loop
        cadena := cadena || ',' || pares(i);
    end loop;
    cadena := substr(cadena,2);
    dbms_output.put_line(cadena);
    dbms_output.put_line('Nº impares:');
    for i in impares.first..impares.last loop
        dbms_output.put_line(impares(i));
    end loop;
end;
/
/*5. Obtener el nombre (ENAME) y puesto de trabajo (JOB) del empleado (tabla EMP) que tenga el código (EMPNO) igual a 7782.*/
set serveroutput on;

/*6.Pedir por pantalla un NIF (8 números y una letra). Comprobar si la letra es correcta y luego mostrar por pantalla si ese NIF escorrecto.*/
set serveroutput on;


/*7. Realiza una función a la que se le pase por parámetro un valor de empno de la tabla EMP, y devuelva los campos nombre y salario.
En el supuesto de que no haya encontrado ningún empno en la tabla EMP con dicho valor, que llame a una excepción que muestre por
pantalla "Valor no existe en la base de datos".*/
set serveroutput on;

/*8. Realiza una función a la que se le pase por parámetro un valor de empno de la tabla EMP, y si existe, que borre el registro completo.
En el supuesto de que no haya encontrado ningún empno en la tabla EMP con dicho valor, que llame a una excepción que muestre por 
pantalla "No se ha podido borrar, el valor no existe en la base de datos".*/
set serveroutput on;

/*9. Realiza un procedimiento que muestre por pantalla el nombre de todos los departamentos de la tabla DEPT.*/
set serveroutput on;

/*10. Realiza una función que devuelva el número total de empleados de la tabla EMP.
Si el número total es mayor de 5, crea una excepción que muestre el mensaje "hay más de 5 empleados".*/

/*11. Crea un programa que pida dos números enteros por pantalla. Si ambos números son divisibles entre sí (requisito, el primer número debe
ser mayor o igual que el segundo), entonces que muestre por pantalla el mensaje “Son divisibles”. En caso contrario, que se muestre el 
mensaje "No son divisibles". NOTA: dos números son divisibles si su resto es cero. Puedes usar la función MOD.*/
set serveroutput on;

/*12. Crea un programa que devuelva por pantalla el día de la semana que es.*/
set serveroutput on;

/*13. Realiza un programa que pida por pantalla tres números y que luego muestre por pantalla el resultado de sumar los tres valores.
Debes contemplar que no se introduzcan números negativos como condición.*/
set serveroutput on;

/*14. Desarrolla un programa que te pida por pantalla tu salario (número entero). Primero comprueba que es mayor que cero (si es menor que 
cero,devuelve por pantalla el mensaje "Salario no válido"). Si el salario es menor de 20000, devuelve el mensaje "Tu salario es bajo".
Si el salario está entre 20000 y 40000, indica por pantalla "Tu salario está bien". Si el salario es mayor de 40000, muestra por pantalla
"Tu salario está muy bien!". Debes emplear CASE… WHEN.*/
set serveroutput on;

/*15. Crea un registro con tres campos, id, nombre y puesto, los cuáles deben tener el mismo tipo de dato que empno, ename y job de la tabla 
EMP. Crea una variable del tipo de ese registro, asígnale valores y muéstralo por la salida. Luego mediante un cursor implícito obtén esos
campos para empno = 7698, guardándolo en esa variable del tipo de ese registro, y luego mostrándolo por la salida.*/
set serveroutput on;

/*16. Crea una variable que sea del tipo ROWTYPE (tabla EMP) y una tabla que tenga los siguientes valores en las posiciones 1, 2 y 3: 
7839, 7698 y 7782. Mediante un bucle while que recorra toda la tabla (usa la función count para el tamaño máximo del índice), 
muestra por la salida de pantalla el nombre del trabajador (campo ename de la tabla emp) que corresponda su empno a cada valor
guardado en la tabla (7839,7698,7782).*/
set serveroutput on;

/*17. Crea un registro que tenga los siguientes campos: codigo tipo number 4, nombre tipo varchar2 tamaño 10 y trabajo tipo varchar2 tamaño 9.
Después crea un tipo de tabla con la estructura del registro anterior (codigo, nombre, trabajo) y usa una variable con ese tipo de tabla 
para guardar en ella los datos (empno, ename y job) de la tabla emp cuyo empno valga 7839. Recuerda que es una tabla,por lo que tendrás que 
guardar dichos datos en la posición 1 de la tabla, por ejemplo. Muestra por la salida de pantalla el empno, ename y job de esa tabla.*/
set serveroutput on;

/*18. Hacer una función obtenerNombreEmp que dado por parámetro un empno te devuelva el ename.*/
set serveroutput on;

/*19. Hacer un procedimiento mostrarDatosEmp que reciba por parámetro un empno y muestre por pantalla el nombre del empleado y el nombre de 
su jefe. Utiliza la función obtenerNombreEmp.*/
set serveroutput on;

/*20. Empaqueta la función y el procedimiento anterior en un paquete denominado libreriaEmpleados.*/
set serveroutput on;

/*21. A través de un bloque de código anónimo, llama al procedimiento mostrarDatosEmp del paquete libreriaEmpleados con el empno 7698.*/
set serveroutput on;

/*22. Muestra por la salida el nombre de cada departamento junto al número de empleados que tiene.*/
set serveroutput on;

/*23. Obtén el salario medio de los empleados y muestra por pantalla ese salario medio junto al resultado del 21% de ese importe y para 
finalizar, poner la suma del salario medio junto al 21% de dicho valor. Ej.: Importe de salario medio 1000, con 210 del 21% y total 1210.*/
set serveroutput on;

/*24. Muestra por la salida el nombre y salario de los empleados que hayan sido contratados en septiembre.*/
set serveroutput on;

/*25. Pide por la entrada de teclado un determinado mes y devuelve por la salida el nombre del empleado que haya sido contratado en dicho mes.
En el caso de que no haya ninguno, mostrar el mensaje "No hay empleados que hayan sido contratados en ese mes".*/
set serveroutput on;

/*26. Se quiere hacer un bloque de código anónimo que pida todos los campos de la tabla emp e introduzca dicho registro en la tabla.*/
set serveroutput on;

/*27. Se quiere un código de bloque anónimo que borre registros de la tabla emp. Para ello pedirá un código empno por teclado, y si una vez
comprobado que existe, se borrará de la tabla. Se debe mostrar un mensaje "No hay registros con ese código" cuando no haya empleados con
ese empno. Si se borra el registro, debes indicarlo por la pantalla con el mensaje "Se ha borrado adecuadamente el empleado".*/
set serveroutput on;

/*28. Se quiere saber el nombre de los empleados que hayan sido contratados en un determinado mes. Para ello debes crear un bloque de código
anónimo que pida un mes por el teclado con letras. Con esa información debes obtener todos los registros de la tabla emp cuyo hiredate haya 
sido en dicho mes, recuperar el nombre y mostrarlo por la salida.*/
set serveroutput on;

/*29. Se quiere saber cuántos empleados hay en cada departamento. Para ello crea un bloque de código anónimo que pida por teclado el código
de departamento deptno. Después, habrá que comprobar que dicho código existe o no en la tabla dept mostrando un mensaje en caso positivo
y otro en caso negativo. Si hay departamentos con ese código, se comprobará que hay o no empleados de ese departamento en la tabla emp, 
mostrando mensajes en ambos casos (positivo y negativo). Para finalizar, sí y solo sí hay empleados de ese departamento, debes calcular 
el número de empleados que hay de ese departamento e indicarlo en un mensaje como el que sigue “Hay xx empleados en ese departamento”,
donde xx es el número obtenido del total de empleados de ese departamento.*/

/*30. Se quiere saber el número de veces de cierta vocal que tienen los nombres de los empleados. Para ello se pedirá al usuario por teclado
una vocal, que habrá que comprobar inicialmente si realmente lo es o no. Si es vocal, se contará cuantas veces aparece en cada nombre de
cada empleado, indicando un mensaje como el que sigue: "KING tiene 1 vez la vocal i" donde se debe haber introducido inicialmente por 
teclado "i". Deben mostrarse todos los empleados con el número de veces que aparece la vocal introducida.*/

/*31. Se quiere un bloque de código anónimo que busque el empleado que tiene el nombre más largo y el que tiene el nombre más corto. En caso 
de coincidencia en el tamaño de los nombres, se pondrán todos.*/

/*32. Haz una función llamada DevolverCodDept que reciba el nombre de un departamento y devuelva su código.*/

/*33. Realiza un procedimiento llamado HallarNumEmp que recibiendo un nombre de departamento, muestre en pantalla el número de empleados de
dicho departamento. Puedes utilizar la función creada en el ejercicio 32. Si el departamento no tiene empleados deberá mostrar un mensaje
informando de ello. Si el departamento no existe se tratará la excepción correspondiente.*/

/*34. Realiza una función llamada CalcularCosteSalarial que reciba un nombre de departamento y devuelva la suma de los salarios y comisiones
de los empleados de dicho departamento. Trata las excepciones que consideres necesarias.*/

/*35. Realiza un procedimiento MostrarCostesSalariales que muestre los nombres de todos los departamentos y el coste salarial de cada uno de
ellos. Puedes usar la función del ejercicio 34.*/

/*36. Realiza un procedimiento MostrarAbreviaturas que muestre las tres primeras letras del nombre de cada empleado.*/

/*37. Realiza un procedimiento MostrarMasAntiguos que muestre el nombre del empleado más antiguo de cada departamento junto con el nombre del
departamento. Trata las excepciones que consideres necesarias.*/

/*38. Realiza un procedimiento MostrarJefes que reciba el nombre de un departamento y muestre los nombres de los empleados de ese departamento
que son jefes de otros empleados.Trata las excepciones que consideres necesarias.*/

/*39. Realiza un procedimiento MostrarMejoresVendedores que muestre los nombres de los dos vendedores con más comisiones. Trata las excepciones 
que consideres necesarias.*/

/*40. Realiza un procedimiento MostrarsodaelpmE que reciba el nombre de un departamento al revés y muestre los nombres de los empleados de 
ese departamento. Trata las excepciones que consideres necesarias.*/

/*41. Realiza un procedimiento RecortarSueldos que recorte el sueldo un 20% a los empleados cuyo nombre empiece por la letra que recibe como 
parámetro.Trata las excepciones que consideres necesarias.*/

/*42. Realiza un procedimiento BorrarBecarios que borre a los dos empleados más nuevos de cada departamento. Trata las excepciones que 
consideres necesarias.*/






-- 02. ACTIVIDADES BLOQUE BÁSICO

/*1. Crea una función llamada borrarEmpleado que reciba por parámetro un código empno y que si, existe dicho código en la base de datos 
(tabla emp), borre dicho registro. Debe devolver "Registro borrado correctamente" si lo puede realizar, y si no, "No existe dicho código".*/
select * from emp where empno = 8000;
create or replace function borrarEmpleado(codigo emp.empno%type) return varchar
is
    fila emp%rowtype;
begin
    select * into fila from emp where empno = codigo;
    if fila.empno = codigo then
        delete from emp where empno = codigo;
        return 'Registro borrado correctamente';
    end if;
exception
    when no_data_found then
        return 'No existe dicho código';
end;
/
/*2. Crea un bloque de código anónimo que pida por teclado un código empno, llame a la función borrarEmpleado con dicho valor como parámetro,
y finalmente muestre por la salida el mensaje recibido por dicha función.*/
declare
    codigoEmpno emp.empno%type := &mete_un_codigo;
    resultado varchar(100);
begin
    dbms_output.put_line(borrarEmpleado(codigoEmpno)); --1
    /*
    resultado := borrarEmpleado(codigoEmpno); --2
    dbms_output.put_line(resultado);--2
    */
end;
/
    
/*3. Realiza una función llamada actualizaNombreEmpleado que reciba por parámetros el código empno del empleado a modificar, y el nuevo
nombre que sustituye a su valor en ename de la tabla emp. Se debe comprobar que existe el empno correspondiente al código pasado por parámetro,
y solo si existe, modificarlo. Debe devolver un mensaje indicando si se hizo o no el cambio de nombre.*/

/*4. Realiza un bloque de código anónimo que llame a la función actualizaNombreEmpleado que pida por teclado un código empno y después un
ename, llame a la función actualizaNombreEmpleado con dichos valores como parámetros, y finalmente muestre por la salida el mensaje
recibido por dicha función.*/

/*5. Mejora la función actualizaNombreEmpleado para que compruebe que el nombre pasado por parámetro no coincida con el ename 
(independientemente de que se escriba en mayúsculas o minúsculas), y si coincide, la función no debe hacer el update y sin embargo debe
devolver el mensaje "No se ha actualizado el registro porque ese nombre es el que tenía el empleado".*/

/*6. Se quiere un procedimiento mostrarAlReves que cuando se le llame desde un bloque de código anónimo con un parámetro, muestre por la
salida de consola ese nombre al revés. Ej.: mostrarAlReves('HOLA') debe mostrar ALOH por la salida.*/




--ACTIVIDADES COMPLEMENTARIAS
/*1. Muestra por la salida el nombre de cada departamento junto al número de empleados que tiene.*/

/*2. Obtén el salario medio de los empleados y muestra por pantalla ese salario medio junto al resultado del 21% de ese importe y para
finalizar, poner la suma del salario medio junto al 21% de dicho valor. Ej.: Importe de salario medio 1000, con 210 del 21% y total 1210. */

/*3. Muestra por la salida el nombre y salario de los empleados que hayan sido contratados en septiembre.*/

/*4. Pide por la entrada de teclado un determinado mes y devuelve por la salida el nombre del empleado que haya sido contratado en dicho
mes. En el caso de que no haya ninguno, mostrar el mensaje "No hay empleados que hayan sido contratados en ese mes".*/

/*5. Se quiere hacer un bloque de código anónimo que pida todos los campos de la tabla emp e introduzca dicho registro en la tabla.*/

/*6. Se quiere un código de bloque anónimo que borre registros de la tabla emp. Para ello pedirá un código empno por teclado, y si una
vez comprobado que existe, se borrará de la tabla. Se debe mostrar un mensaje “No hay registros con ese código” cuando no haya empleados
con ese empno. Si se borra el registro, debes indicarlo por la pantalla con el mensaje “Se ha borrado adecuadamente el empleado”.*/

/*7. Se quiere saber el nombre de los empleados que hayan sido contratados en un determinado mes. Para ello debes crear un bloque de 
código anónimo que pida un mes por el teclado con letras. Con esa información debes obtener todos los registros de la tabla emp cuyo
hiredate haya sido en dicho mes, recuperar el nombre y mostrarlo por la salida.*/

/*8. Se quiere saber cuántos empleados hay en cada departamento. Para ello crea un bloque de código anónimo que pida por teclado el código
de departamento deptno. Después, habrá que comprobar que dicho código existe o no en la tabla dept mostrando un mensaje en caso positivo
y otro en caso negativo. Si hay departamentos con ese código, se comprobará que hay o no empleados de ese departamento en la tabla emp,
mostrando mensajes en ambos casos (positivo y negativo). Para finalizar, sí y solo sí hay empleados de ese departamento, debes calcular
el número de empleados que hay de ese departamento e indicarlo en un mensaje como el que sigue “Hay xx empleados en ese departamento”,
donde xx es el número obtenido del total de empleados de ese departamento.*/

/*9. Se quiere saber el número de veces de cierta vocal que tienen los nombres de los empleados. Para ello se pedirá al usuario por 
teclado una vocal, que habrá que comprobar inicialmente si realmente lo es o no. Si es vocal, se contará cuantas veces aparece en cada
nombre de cada empleado, indicando un mensaje como el que sigue: “KING tiene 1 vez la vocal i” donde se debe haber introducido inicialmente
por teclado “i”. Deben mostrarse todos los empleados con el número de veces que aparece la vocal introducida.*/

/*10. Se quiere un bloque de código anónimo que busque el empleado que tiene el nombre más largo y el que tiene el nombre más corto. En
caso de coincidencia en el tamaño de los nombres, se pondrán todos.1. Muestra por la salida el nombre de cada departamento junto al número
de empleados que tiene.*/

---MARTES 07/05/2023
--05. PROCEDIMIENTOS Y FUNCIONES

/* 1 Crea un procedimiento que se llame consultarEmpleado. Debe tomar una variable de entrada v_empno con el tipo de dato del campo empno de la
tabla emp. Debe tomar como variables de salida v_ename y v_job, cuyos tipos de datos deben coincidir con los de los campos ename y job de la
tabla emp. Controla con una excepción que no se encuentre ningún dato con el valor de v_empno de entrada, mostrando el mensaje:
“No se encontraron datos”.*/
set serveroutput on;
create or replace procedure consultarEmpleado(
    v_empno emp.empno%type,
    v_ename out emp.ename%type,
    v_job out emp.job%type)
is
    noHayDatos exception; --opción3
begin
    select empno into numEmp from emp where empno = v_empno; --opción 2
    select ename,job into v_ename,v_job from emp where empno = v_empno; --opción 2
    select count(*) into contador from emp where empno = v_empno; --opción 3
    if contador = 0 then --opción 3
        raise noHayDatos;
    else
        select ename,job into v_ename,v_job from emp where empno = v_empno;
    end if;
    select ename,job into v_ename,v_job from emp where empno = v_empno; --opción 1
exception
    when no_data_found then --opción 1 / opción 2
        dbms_output.put_line('No se encontraron datos');
    when noHayDatos then --opción 3
        dbms_output.put_line('No se encontraron datos');
end;
/
declare
    v_empno emp.empno%type;
    v_ename emp.ename%type;
    v_job emp.job%type;
begin
    v_empno := 1111;
    consultarEmpleado(v_empno,v_ename,v_job);
    dbms_output.put_line(v_ename||'|'||v_job);
end;
/
--otro
create or replace procedure consultarEmpleado(
    v_empno emp.empno%type,
    v_ename out emp.ename%type,
    v_job out emp.job%type)
is
    noHayDatos exception; --opción3
    numEmp emp.empno%type;
    contador int := 0;
begin
    select empno into numEmp from emp where empno = v_empno; --opción 2
    select ename,job into v_ename,v_job from emp where empno = v_empno; --opción 2
    select count(*) into contador from emp where empno = v_empno; --opción 3
    if contador = 0 then --opción 3
        raise noHayDatos;
    else
        select ename,job into v_ename,v_job from emp where empno = v_empno;
    end if;
    select ename,job into v_ename,v_job from emp where empno = v_empno; --opción 1
exception
    when no_data_found then --opción 1 / opción 2
        dbms_output.put_line('No se encontraron datos');
    when noHayDatos then --opción 3
        dbms_output.put_line('No se encontraron datos');
end;
/
declare
    v_empno emp.empno%type;
    v_ename emp.ename%type;
    v_job emp.job%type;
begin
    v_empno := 7839;
    consultarEmpleado(v_empno,v_ename,v_job);
    dbms_output.put_line(v_ename||'|'||v_job);
end;
/
--aaaaaaa
declare
    nombre emp.ename%type;
    puesto emp.job%type;
begin
    miPaquete.is_today;
    miPaquete.consultarEmpleado(7839,nombre,puesto);
    dbms_output.put_line(nombre||'|'||puesto);
end;
/
--aaa
/*
Ejercicio 2
Escriba un paquete gestionEMP con:
? Procedimiento nuevoEmpleado que inserte un nuevo empleado con los siguientes datos:
? Empno = 8000
? Ename = JUAN
? JOB = CLERK
? MGR = 7902
? HIREDATE = 01/05/22
? SAL = 1500
? COMM = NULL
? DEPTNO = 20
? Al insertar el nuevo empleado, debe mostrar un mensaje “Registro creado correctamente”.
Llamar al procedimiento en un bloque anónimo y muestra el mensaje.
*/
create or replace package gestionEMP
is
    procedure nuevoEmpleado(
        empno emp.empno%type,
        ename emp.ename%type,
        job emp.job%type,
        mgr emp.mgr%type,
        hiredate emp.hiredate%type,
        sal emp.sal%type,
        comm emp.comm%type,
        deptno emp.deptno%type,
        mensaje out varchar
    );
end;
/
create or replace package body gestionEMP
is
    procedure nuevoEmpleado(
        empno emp.empno%type,
        ename emp.ename%type,
        job emp.job%type,
        mgr emp.mgr%type,
        hiredate emp.hiredate%type,
        sal emp.sal%type,
        comm emp.comm%type,
        deptno emp.deptno%type,
        mensaje out varchar
    )
    is
        existe emp.empno%type;
    begin
        select empno into existe from emp where empno = empno;
        mensaje := 'El empno ya existe';
    exception
        when no_data_found then
            insert into emp values (empno,ename,job,mgr,hiredate,sal,comm,deptno);
            mensaje := 'Registro creado correctamente';
    end;
end;
/

create or replace package gestionEMP
is
    procedure nuevoEmpleado(
        vempno emp.empno%type,
        ename emp.ename%type,
        job emp.job%type,
        mgr emp.mgr%type,
        hiredate emp.hiredate%type,
        sal emp.sal%type,
        comm emp.comm%type,
        deptno emp.deptno%type,
        mensaje out varchar
    );
end;
/
create or replace package body gestionEMP
is
    procedure nuevoEmpleado(
        vempno emp.empno%type,
        ename emp.ename%type,
        job emp.job%type,
        mgr emp.mgr%type,
        hiredate emp.hiredate%type,
        sal emp.sal%type,
        comm emp.comm%type,
        deptno emp.deptno%type,
        mensaje out varchar
    )
    is
        existe emp.empno%type;
    begin
        select empno into existe from emp where empno = vempno;
        mensaje := 'El empno ya existe';
    exception
        when no_data_found then
            insert into emp values (vempno,ename,job,mgr,hiredate,sal,comm,deptno);
            mensaje := 'Registro creado correctamente';
    end;
end;
/
declare
    mensaje varchar(100);
begin
    gestionEMP.nuevoEmpleado(2222,'prueba',null,null,null,null,null,10,mensaje);
    dbms_output.put_line(mensaje);
end;
/