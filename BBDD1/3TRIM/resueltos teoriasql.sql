--06
/*
Ejercicio 1
Haz una función llamada DevolverCodDept que reciba el nombre de un departamento y devuelva
su código
*/
create or replace function DevolverCodDept(nombredepartamento dept.dname%type)
return dept.deptno%type
is
resultado dept.deptno%type;
begin
select deptno
into resultado
from dept
where dname = nombredepartamento;
return resultado;
exception
when no_data_found then
return -1;
end;
/
declare
nombredpto dept.dname%type := '&mete_nombre_departamento';
begin
dbms_output.put_line(DevolverCodDept(nombredpto));
end;
/

/*
Ejercicio 2
Realiza un procedimiento llamado HallarNumEmp que recibiendo un nombre de departamento,
muestre en pantalla el número de empleados de dicho departamento. Puedes utilizar la función
creada en el ejercicio 1.
Si el departamento no tiene empleados deberá mostrar un mensaje informando de ello. Si el
departamento no existe se tratará la excepción correspondiente.
*/
create or replace procedure HallarNumEmp(pnombredepartamento dept.dname%type)
is
total int;
noexistedepartamento exception;
begin
if DevolverCodDept(pnombredepartamento) != -1 then
select count(*)
into total
from emp
where deptno = DevolverCodDept(pnombredepartamento);
if total != 0 then
dbms_output.put_line(total);
else
dbms_output.put_line('No tiene empleados');
end if;
else
raise noexistedepartamento;
end if;
exception
when noexistedepartamento then
dbms_output.put_line('No existe ese departamento');
end;
/
declare
nomdept dept.dname%type := '&mete_nombre_departamento';
begin
HallarNumEmp(nomdept);
end;
/
/*
Ejercicio 3
Realiza una función llamada CalcularCosteSalarial que reciba un nombre de departamento y
devuelva la suma de los salarios y comisiones de los empleados de dicho departamento. Trata
las excepciones que consideres necesarias.
*/
create or replace function CalcularCosteSalarial(nombredepartamento dept.dname%type)
return number
is
costetotal number(8,2);
codigo dept.deptno%type;
begin
codigo := DEVOLVERCODDEPT(nombredepartamento);
--if codigo != -1 then
if codigo >= 0 then
select sum(sal+nvl(comm,0))
into costetotal
from emp
where deptno = codigo;
if costetotal is null then
return 0;
else
return costetotal;
end if;
else
return -1;
end if;
end;
/
declare
departamento dept.dname%type := '&mete_departamento';
begin
dbms_output.put_line(CalcularCosteSalarial(departamento));
end;
/
/*
Ejercicio 4
Realiza un procedimiento MostrarCostesSalariales que muestre los nombres de todos los
departamentos y el coste salarial de cada uno de ellos. Puedes usar la función del ejercicio 3.
*/
create or replace procedure MostrarCostesSalariales
is
cursor departamentos is select dname from dept;
nombres departamentos%rowtype;
vcostes number(9);
begin
for nombres in departamentos loop
vcostes := CalcularCosteSalarial(nombres.dname);
if vcostes >= 0 then
dbms_output.put_line(nombres.dname || ' ' || vcostes);
end if;
end loop;
end MostrarCostesSalariales;
/
begin
MostrarCostesSalariales;
end;
/
/*
Ejercicio 5
Realiza un procedimiento MostrarAbreviaturas que muestre las tres primeras letras del nombre
de cada empleado.
*/
create or replace procedure MostrarAbreviaturas is
cursor cempleados is select ename from emp;
vnombres cempleados%rowtype;
begin
for vnombres in cempleados loop
dbms_output.put_line(substr(vnombres.ename,1,3));
end loop;
end;
/
begin
MostrarAbreviaturas;
end;
/
/*
Ejercicio 6
Realiza un procedimiento MostrarMasAntiguos que muestre el nombre del empleado más
antiguo de cada departamento junto con el nombre del departamento. Trata las excepciones que
consideres necesarias.
*/
create or replace procedure MostrarMasAntiguos
is
cursor cdepartamentos is select * from dept;
vdepartamentos cdepartamentos%rowtype;
nombreAntiguo emp.ename%type;
begin
for vdepartamentos in cdepartamentos loop
select ename
into nombreAntiguo
from emp
where deptno = DevolverCodDept(vdepartamentos.dname) and hiredate = (
select min(hiredate) from emp where deptno = DevolverCodDept(vdepartamentos.dname)
);
dbms_output.put_line(nombreAntiguo || ': ' || vdepartamentos.dname);
end loop;
exception
when no_data_found then
dbms_output.put_line('El departamento no tiene empleados');
end;
/
begin
MostrarMasAntiguos;
end;
/
select emp.ename
from emp
join dept on dept.deptno = emp.deptno
where hiredate = (select min(hiredate) from emp join dept on dept.deptno = emp.deptno where dname = 'SALES') and dname = 'SALES';


select min(hiredate) from emp where dname = 'SALES';
/*
Ejercicio 7
Realiza un procedimiento MostrarJefes que reciba el nombre de un departamento y muestre los
nombres de los empleados de ese departamento que son jefes de otros empleados.Trata las
excepciones que consideres necesarias.
*/
create or replace procedure MostrarJefes (nombredepartamento dept.dname%type)
is
cursor cempleados is select * from emp where deptno = DevolverCodDept(nombredepartamento);
vempleados cempleados%rowtype;
numEsclavos int := 0;
hayempleados int := 0;
begin
select count(*) into hayempleados from emp where deptno = DevolverCodDept(nombredepartamento);
if hayempleados > 0 then
for vempleados in cempleados loop
--¿Un departamento puede tener un jefe o más de un jefe? No, solo uno.
--¿Un jefe puede serlo de más de un empleado de un mismo departamento? Sí.
select count(deptno)
into numEsclavos
from emp
where mgr = vempleados.empno and deptno = vempleados.deptno;
if numEsclavos > 0 then
dbms_output.put_line(vempleados.ename || ' es jefe ');
end if;
end loop;
else
dbms_output.put_line('No hay empleados en ese departamento');
end if;
end;
/
declare
departamento dept.dname%type := '&mete_departamento';
begin
MostrarJefes(departamento);
end;
/

/*
Ejercicio 8
Realiza un procedimiento MostrarMejoresVendedores que muestre los nombres de los dos
vendedores con más comisiones. Trata las excepciones que consideres necesarias.
*/
create or replace procedure MostrarMejoresVendedores
is
cursor cempleados is select ename from emp order by nvl(comm,0) desc;
vempleados cempleados%rowtype;
contador int := 0;
begin
for vempleados in cempleados loop
if contador < 2 then
dbms_output.put_line(vempleados.ename);
contador := contador + 1;
else
exit;
end if;
end loop;
end;
/
create or replace procedure MostrarMejoresVendedores2
is
nempleadomax1 emp.ename%type;
empnoempleadomax1 emp.empno%type;
nempleadomax2 emp.ename%type;
begin
select empno,ename into empnoempleadomax1,nempleadomax1 from emp where comm = (select(max(comm)) from emp);
select ename into nempleadomax2 from emp where comm = (select(max(comm)) from emp where empno != empnoempleadomax1);
dbms_output.put_line(nempleadomax1);
dbms_output.put_line(nempleadomax2);
end;
/
create or replace procedure MostrarMejoresVendedores3 --añadiendo una excepción, el que no haya empleados con comisión
is
cursor cempleados is select ename from emp order by nvl(comm,0) desc;
vempleados cempleados%rowtype;
contador int := 0;
totalEmpleados int;
noHayEmpleados exception;
begin
select count(*)
into totalEmpleados
from emp;
if totalEmpleados > 0 then
for vempleados in cempleados loop
if contador < 2 then
dbms_output.put_line(vempleados.ename);
contador := contador + 1;
else
exit;
end if;
end loop;
else
raise noHayEmpleados;
end if;
exception
when noHayEmpleados then
dbms_output.put_line('No hay empleados');
end;
/

begin
MostrarMejoresVendedores;
MostrarMejoresVendedores2;
MostrarMejoresVendedores3;
end;
/
/*
Ejercicio 9
Realiza un procedimiento MostrarsodaelpmE que reciba el nombre de un departamento al revés
y muestre los nombres de los empleados de ese departamento. Trata las excepciones que
consideres necesarias.
*/
create or replace procedure MostrarsodaelpmE(nombreDepartamento dept.dname%type)
is
--cursor cempleados is select * from emp join dept on emp.deptno = dept.deptno where dname = nombreDepartamentoCorrecto;
cursor cempleados is select * from emp where deptno = DevolverCodDept(reverse(upper(nombreDepartamento)));
vempleados cempleados%rowtype;
codigoDepartamento dept.deptno%type;
contador int;
noHayEmpleados exception;
begin
select deptno
into codigoDepartamento
from dept
where dname = reverse(upper(nombreDepartamento)); --me dice si existe o no el nombre del departamento

select count(*)
into contador
from emp
where deptno = codigoDepartamento;

if contador = 0 then
raise noHayEmpleados;
end if;

for vempleados in cempleados loop
dbms_output.put_line(vempleados.ename);
end loop;

exception
when no_data_found then
dbms_output.put_line('Ese nombre de departamento no existe');
when noHayEmpleados then
dbms_output.put_line('No hay empleados en ese departamento');
end;
/
declare
--departamento dep.dname%type := 'SNOITAREPO';
departamento dept.dname%type := '&mete_nombre_departamento';
begin
MostrarsodaelpmE(departamento);
end;
/

--07
/*Crea un bloque de código anónimo que pida la base y altura de un triángulo, y devuelva el área de este.*/
DECLARE
Altura INT;
Base INT;
BEGIN
Altura := &Altura;
Base := &Base;
DBMS_OUTPUT.PUT_LINE(‘Triángulo de base: ‘ || Base || ‘ y altura: ‘ || Altura || ‘ tiene de área: ‘ || Base*Altura/2);
END;
/

/*Crea un bloque de código anónimo que requiera por pantalla un nombre, luego un apellido y muestre como resultado “Hola nombre apellido”.*/
set serveroutput on
DECLARE
nombre varchar(50);
apellidos varchar(100);
BEGIN
nombre := &Introduce_tu_nombre;
apellidos := &Introduce_tus_apellidos;
DBMS_OUTPUT.PUT_LINE('Hola '||nombre||' '||apellidos);
END;
/

/*Crea un programa que realiza la suma, resta, multiplicación y división de dos números enteros, num1 y num2 (8 y 4).*/
DECLARE
num1 int := 8;
num2 int := 4;
BEGIN
dbms_output.put_line(num1+num2);
dbms_output.put_line(num1-num2);
dbms_output.put_line(num1*num2);
dbms_output.put_line(num1/num2);
END;
/

/*Crea un programa que realiza la suma de dos números enteros, num1 y num2, si num1 es mayor que num2. En caso contrario que no haga nada.
Asigna por ejemplo los valores 7 y 3 a los números.*/
DECLARE
num1 int := 7;
num2 int := 3;
BEGIN
if num1 > num2 then
    dbms_output.put_line(num1+num2);
end if;
END;
/

/*Crea un programa que realiza la resta de dos números enteros, num1 y num2, si num1 es mayor que num2. En caso contrario, que muestre por pantalla ‘num1 es menor que num2’, sustituyendo num1 y num2 por sus valores.
Asigna por ejemplo los valores 7 y 3 a los números.*/
DECLARE
num1 int := 7; --3
num2 int := 3; --7
BEGIN
if num1 > num2 then
    dbms_output.put_line(num1-num2);
else
    dbms_output.put_line(num1 || ' es menor que ' || num2);
end if;
END;
/

/*Crea un programa que tome pida una variable al usuario para que la introduzca por teclado (tiene que ser un número), y según sea su valor entre 0 y 10, devuelva por pantalla el valor de la nota: SUSPENSO, APROBADO, BIEN, NOTABLE, SOBRESALIENTE. En caso contrario, que devuelva ‘El valor introducido es incorrecto’.*/
DECLARE
nota number(3,1);
BEGIN
nota := &Introduce_la_nota;
if nota >= 0 and nota < 5 then
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
END;
/

/*Realiza el mismo ejercicio anterior pero utilizando CASE en lugar de IF | ELSIF | END IF.*/
DECLARE
nota number(3,1);
BEGIN
nota := &Introduce_la_nota;
CASE
WHEN nota >= 0 and nota < 5 THEN
    dbms_output.put_line('SUSPENSO');
WHEN nota >=5 and nota < 6 THEN
    dbms_output.put_line('APROBADO');
WHEN nota >=6 and nota < 7 THEN
    dbms_output.put_line('BIEN');
WHEN nota >=7 and nota < 9 THEN
    dbms_output.put_line('NOTABLE');
WHEN nota >=9 and nota <= 10 THEN
    dbms_output.put_line('SOBRESALIENTE');
ELSE
    dbms_output.put_line('El valor introducido es incorrecto');
END CASE;
END;
/

/*Realiza un programa que lea por teclado dos números enteros. El primero será los goles del equipo de casa, y el segundo los goles del equipo de fuera.
Se quiere devolver por pantalla quién ha ganado: “El equipo de casa/visitante ha ganado”. En caso de empate se indicará “El resultado del partido ha sido de empate”.*/
DECLARE
numero1 int;
numero2 int;
BEGIN
numero1 := &Introduce_goles_equipo_casa;
numero2 := &Introduce_goles_equipo_visitante;
CASE
WHEN numero1 > numero2 THEN
    dbms_output.put_line('El equipo de casa ha ganado');
WHEN numero1 < numero2 THEN
    dbms_output.put_line('El equipo visitante ha ganado');
WHEN numero1 = numero2 THEN
    dbms_output.put_line('El resultado del partido ha sido de empate');
ELSE
    dbms_output.put_line('Los valores introducidos no son correctos');
END CASE;
END;
/

/*Realiza un programa que ejecute un bucle LOOP y se salga con un EXIT WHEN. Para ello crea una variable entero inicializada a 0 y que se vaya incrementando en el bucle, además de mostrar por pantalla su valor; la condición de salida será cuando dicha variable valga más de 20.*/
SET SERVEROUTPUT ON
DECLARE
VARIABLE INT := 0;
BEGIN
    LOOP
        VARIABLE := VARIABLE + 1;
        EXIT WHEN VARIABLE > 20;
        DBMS_OUTPUT.PUT_LINE(VARIABLE);
    END LOOP;
END;

/*Realiza un programa que haga lo indicado en el ejercicio anterior pero que se salga mediante un IF condición THEN EXIT.*/
SET SERVEROUTPUT ON
DECLARE
VARIABLE INT := 0;
BEGIN
    LOOP
        VARIABLE := VARIABLE + 1;
        IF VARIABLE > 20 THEN
            EXIT;
        END IF;
        DBMS_OUTPUT.PUT_LINE(VARIABLE);
    END LOOP;
END;

/*Realiza un programa que haga lo indicado en el ejercicio "Realiza un programa que ejecute un bucle LOOP y se salga con..." pero emplea un bucle WHILE.*/
SET SERVEROUTPUT ON
DECLARE
VARIABLE INT := 0;
BEGIN
    WHILE VARIABLE < 20 LOOP
        VARIABLE := VARIABLE + 1;
        DBMS_OUTPUT.PUT_LINE(VARIABLE);
    END LOOP;
END;

/*Realiza un programa que haga lo indicado en el ejercicio "Realiza un programa que ejecute un bucle LOOP y se salga con..." pero emplea un bucle FOR.*/
SET SERVEROUTPUT ON
BEGIN
    FOR VARIABLE IN 0 .. 20 LOOP
        DBMS_OUTPUT.PUT_LINE(VARIABLE);
    END LOOP;
END;

/*Realiza un programa que haga lo indicado en el ejercicio "Realiza un programa que ejecute un bucle LOOP y se salga con..." pero, en lugar de ir incrementando de 0 a 20, que haga lo opuesto, que vaya mostrando 20, 19, 18… y que termine con el 0. Emplea un bucle FOR.*/
SET SERVEROUTPUT ON
BEGIN
    FOR VARIABLE IN REVERSE 0 .. 20 LOOP
        DBMS_OUTPUT.PUT_LINE(VARIABLE);
    END LOOP;
END;

/*Realiza un programa que muestre por pantalla los números pares hasta llegar a 40, inclusive.
Nota: la función MOD(m,n) devuelve el resto de dividir el parámetro m entre el parámetro n.*/
SET SERVEROUTPUT ON
DECLARE
    DOS CONSTANT INT := 2;
BEGIN
    FOR VARIABLE IN 1 .. 40 LOOP
        IF MOD(VARIABLE,DOS) = 0 THEN
            DBMS_OUTPUT.PUT_LINE(VARIABLE);
        END IF;
    END LOOP;
END;

/*Realiza un programa que muestre por pantalla las tablas de multiplicar del 1 al 10.*/
SET SERVEROUTPUT ON
--AxB
BEGIN
    FOR A IN 1 .. 10 LOOP
        FOR B IN 1 .. 10 LOOP
            DBMS_OUTPUT.PUT_LINE(A || ' x ' || B || ' = ' || A*B);
        END LOOP;
    END LOOP;
END;

/*Declarar un tipo registro Tpersona con los siguientes campos: un código de tipo numérico, un nombre de tipo cadena de 100 caracteres y la edad integer. Asignarle valor a una variable de tipo Tpersona e imprimirlo por pantalla.*/
DECLARE
        TYPE TPERSONA IS RECORD (
        CODIGO NUMBER,
        NOMBRE VARCHAR(100),
        EDAD int);
        V_VAR1 TPERSONA;
BEGIN
        V_VAR1.CODIGO:=1;
        V_VAR1.NOMBRE:='FRANCISCO';
        V_VAR1.EDAD:=30;
        DBMS_OUTPUT.PUT_LINE('CODIGO: '||TO_CHAR(V_VAR1.CODIGO)||' PERSONA: '||V_VAR1.NOMBRE||' EDAD: '||TO_CHAR(V_VAR1.EDAD)||'.');
END;
/

/*Declarar una tabla de números y asignarle con un bucle for los números del 1 al 10. Además de asignar el valor dentro del bucle, mostrar el valor de la tabla por pantalla en cada iteración.*/
/*Utilizar la función COUNT para devolver el número de elementos.
Recorrerlo con FIRST Y LAST.
Eliminar el último de la tabla y devolver el número total de elementos.
Preguntar si existe valor en la posición 10.*/

DECLARE
    TYPE T_NUM IS TABLE OF NUMBER INDEX BY BINARY_INTEGER;
    TABLA T_NUM;
BEGIN
    FOR I IN 1..10 LOOP    
        TABLA(I):= I;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('ELEMENTOS: ' || TABLA.COUNT);
    FOR I IN TABLA.FIRST .. TABLA.LAST LOOP
        DBMS_OUTPUT.PUT_LINE(TABLA(I));
    END LOOP;
    TABLA.DELETE(TABLA.LAST);
    DBMS_OUTPUT.PUT_LINE('ELEMENTOS: ' || TABLA.COUNT);
    IF TABLA.EXISTS(10) THEN
        DBMS_OUTPUT.PUT_LINE('En la posición 10 hay valor');
    ELSE
        DBMS_OUTPUT.PUT_LINE('En la posición 10 NO hay valor');
    END IF;
END;
/


/*Declarar una tabla de ‘personas’. Donde ‘personas’ es un tipo registro que almacena nombre, apellido1 y apellido2.
Asignarle valores para una persona e imprimirlos por pantalla.*/
DECLARE
    TYPE PERSONAS IS RECORD(
        NOMBRE VARCHAR2(100),
        APELLIDO1 VARCHAR2(100),
        APELLIDO2 VARCHAR2(100)
    );
    TYPE TPERSONAS IS TABLE OF PERSONAS INDEX BY BINARY_INTEGER;
    V_TABLA TPERSONAS;
    V_PERSONA PERSONAS;
BEGIN
    V_PERSONA.NOMBRE := 'LUIS';
    V_PERSONA.APELLIDO1 := 'GARCIA';
    V_PERSONA.APELLIDO2 := 'PEREZ';
    V_TABLA(1) := V_PERSONA;
    DBMS_OUTPUT.PUT_LINE( V_TABLA(1).NOMBRE || ' ' || V_TABLA(1).APELLIDO1 || ' ' || V_TABLA(1).APELLIDO2 );
END;
/

/*1. Definir un cursor implícito para obtener por pantalla el nombre y los apellidos del estudiante con DNI=’00000000T’ de la tabla ESTUDIANTES (fichero estudiantes.sql).
NOTA: tener en cuenta que el DNI puede no existir en la tabla.
2. Prueba ahora con el DNI 97898989T.*/
DECLARE
    V_NOMBRE ESTUDIANTES.NOMBRE%TYPE;
    V_APELLIDOS ESTUDIANTES.APELLIDOS%TYPE;
    V_DNI ESTUDIANTES.DNI%TYPE := '00000000T';
BEGIN
    SELECT NOMBRE, APELLIDOS INTO V_NOMBRE, V_APELLIDOS
    FROM ESTUDIANTES
    WHERE DNI = V_DNI;
    DBMS_OUTPUT.PUT_LINE( 'EL NOMBRE DEL ESTUDIANTE ES: ' || V_NOMBRE || ' ' || V_APELLIDOS );
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE( 'EL DNI ' || V_DNI || ' NO SE ENCUENTRA EN LA BD' );
END;
/

/*1. Definir un cursor implícito para obtener por pantalla el dni y los apellidos del estudiante cuyo nombre sea Marta en la tabla ESTUDIANTES (fichero estudiantes.sql).
NOTA: tener en cuenta tanto que puede no existir ningún estudiante que se llame así o que pueda haber varios con el mismo nombre.
2. Prueba ahora con el nombre Blanca.*/
DECLARE
    V_NOMBRE ESTUDIANTES.NOMBRE%TYPE := 'Marta';
    V_APELLIDOS ESTUDIANTES.APELLIDOS%TYPE;
    V_DNI ESTUDIANTES.DNI%TYPE;
BEGIN
    SELECT DNI, APELLIDOS INTO V_DNI, V_APELLIDOS
    FROM ESTUDIANTES
    WHERE NOMBRE = V_NOMBRE;
    DBMS_OUTPUT.PUT_LINE( 'EL DNI Y APELLIDOS DEL ESTUDIANTE ES: ' || V_DNI || ' ' || V_APELLIDOS );
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE( 'EL ESTUDIANTE ' || V_NOMBRE || ' NO SE ENCUENTRA EN LA BD' );
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE( 'EL ESTUDIANTE ' || V_NOMBRE || ' SE ENCUENTRA REPETIDO EN LA BD' );
END;
/

/*Definir un cursor explícito que seleccione el nombre, apellidos y DNI de la tabla ESTUDIANTES. Abrir el cursor, extraer el primer dato, mostrar cuántos registros se han procesado (uno) y cerrarlo. Luego mostrar el nombre del estudiante del registro procesado en el cursor.
¿Qué sucede si ponemos dos FETCH?*/
DECLARE
    CURSOR C_NOMBRES IS
        SELECT NOMBRE, APELLIDOS, DNI
        FROM ESTUDIANTES;
    V_ESTUDIANTES C_NOMBRES%ROWTYPE;
BEGIN
    OPEN C_NOMBRES;
    FETCH C_NOMBRES INTO V_ESTUDIANTES;
    DBMS_OUTPUT.PUT_LINE(C_NOMBRES%ROWCOUNT);
    CLOSE C_NOMBRES;
    DBMS_OUTPUT.PUT_LINE(V_ESTUDIANTES.NOMBRE);
END;
/

--Si ponemos dos FETCH seguidos devolverá 2 y Marta.

/*Definir un cursor explícito que seleccione el nombre, apellidos y DNI de la tabla ESTUDIANTES. Recorrerlo y mostrar todos los datos recuperados.
Escribir al final el número de filas recuperadas en total.*/
DECLARE
    CURSOR C_NOMBRES IS
        SELECT NOMBRE, APELLIDOS, DNI
        FROM ESTUDIANTES;
    V_ESTUDIANTES C_NOMBRES%ROWTYPE;
BEGIN
    OPEN C_NOMBRES;
    LOOP
        FETCH C_NOMBRES INTO V_ESTUDIANTES;
        EXIT WHEN C_NOMBRES%NOTFOUND; --DEVUELVE TRUE CUANDO NO HAY DATOS EN EL CURSOR
        DBMS_OUTPUT.PUT_LINE( V_ESTUDIANTES.NOMBRE || ' ' || V_ESTUDIANTES.APELLIDOS || ' - ' || V_ESTUDIANTES.DNI );
    END LOOP;
    DBMS_OUTPUT.PUT_LINE( 'TOTAL: ' || C_NOMBRES%ROWCOUNT );
    CLOSE C_NOMBRES;
END;
/

/*Definir un cursor explícito que seleccione el
nombre y la fecha de nacimiento de la tabla ESTUDIANTES. Recorrerlo y mostrar todos los datos recuperados con WHILE LOOP.
Escribir al final el número de filas recuperadas en total.*/
DECLARE
    CURSOR C_ESTUDIANTES IS
        SELECT NOMBRE, FECHA_NACIMIENTO
        FROM ESTUDIANTES;
    V_ESTUDIANTES C_ESTUDIANTES%ROWTYPE;
BEGIN
    OPEN C_ESTUDIANTES;
    FETCH C_ESTUDIANTES INTO V_ESTUDIANTES;
    WHILE C_ESTUDIANTES%FOUND LOOP
        DBMS_OUTPUT.PUT_LINE( V_ESTUDIANTES.NOMBRE || ' (' || V_ESTUDIANTES.FECHA_NACIMIENTO || ')' );
        FETCH C_ESTUDIANTES INTO V_ESTUDIANTES;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE( '---' );
    DBMS_OUTPUT.PUT_LINE( 'TOTAL: ' || C_ESTUDIANTES%ROWCOUNT );
    CLOSE C_ESTUDIANTES;
END;
/

/*Definir un cursor explícito que seleccione el
nombre, apellidos y fecha de nacimiento de la tabla ESTUDIANTES. Recorrerlo y mostrar todos los datos recuperados con un bucle FOR.
Escribir el número de filas recuperadas en total.*/
DECLARE
    CURSOR C_ESTUDIANTES IS
        SELECT NOMBRE, APELLIDOS, FECHA_NACIMIENTO
        FROM ESTUDIANTES;
    V_ESTUDIANTES C_ESTUDIANTES%ROWTYPE;
    V_TOTAL INT := 0;
BEGIN
    FOR V_ESTUDIANTES IN C_ESTUDIANTES
    LOOP
        DBMS_OUTPUT.PUT_LINE( V_ESTUDIANTES.NOMBRE || ' ' || V_ESTUDIANTES.APELLIDOS || ' (' || V_ESTUDIANTES.FECHA_NACIMIENTO || ')' );
        V_TOTAL := V_TOTAL + 1;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE( '---' );
    DBMS_OUTPUT.PUT_LINE( 'TOTAL: ' || V_TOTAL );
END;
/

/*Se quiere mostrar por pantalla el nombre y apellidos de los estudiantes que se llamen de cierta forma. Para ello se pedirá al usuario que introduzca el nombre a buscar.
El formato requerido para mostrar por pantalla es el siguiente (todo en mayúsculas): “APELLIDOS, NOMBRE”. Ej.: CARRASCO PEREZ, MARTA.
En el supuesto de que SELECT no se traiga ningún registro, mostrar por pantalla “NO HAY DATOS”. Utiliza un bucle WHILE.
Lanza la ejecución para el nombre “Marta” y después para el nombre “Luis”.*/
DECLARE
    V_NOMBRE ESTUDIANTES.NOMBRE%TYPE := '&NOMBRE';
    CURSOR C_ESTUDIANTES IS
        SELECT NOMBRE, APELLIDOS
        FROM ESTUDIANTES
        WHERE NOMBRE = V_NOMBRE;
    V_ESTUDIANTES C_ESTUDIANTES%ROWTYPE;
BEGIN
    OPEN C_ESTUDIANTES;
    FETCH C_ESTUDIANTES INTO V_ESTUDIANTES;
    IF C_ESTUDIANTES%NOTFOUND THEN
        DBMS_OUTPUT.PUT_LINE( 'NO HAY DATOS' );
    ELSE
        WHILE C_ESTUDIANTES%FOUND LOOP
            DBMS_OUTPUT.PUT_LINE( UPPER( V_ESTUDIANTES.APELLIDOS || ', ' || V_ESTUDIANTES.NOMBRE ) );
            FETCH C_ESTUDIANTES INTO V_ESTUDIANTES;
        END LOOP;
    END IF;
    CLOSE C_ESTUDIANTES;
END;
/

/*Realiza el mismo ejercicio anterior pero con un bucle FOR.*/
DECLARE
    V_NOMBRE ESTUDIANTES.NOMBRE%TYPE := '&NOMBRE';
    CURSOR C_ESTUDIANTES IS
        SELECT NOMBRE, APELLIDOS
        FROM ESTUDIANTES
        WHERE NOMBRE = V_NOMBRE;
    V_ESTUDIANTES C_ESTUDIANTES%ROWTYPE;
BEGIN
    OPEN C_ESTUDIANTES;
    FETCH C_ESTUDIANTES INTO V_ESTUDIANTES;
    IF C_ESTUDIANTES%NOTFOUND THEN
        DBMS_OUTPUT.PUT_LINE( 'NO HAY DATOS' );
    END IF;
    CLOSE C_ESTUDIANTES;
    FOR V_ESTUDIANTES IN C_ESTUDIANTES LOOP
        DBMS_OUTPUT.PUT_LINE( UPPER( V_ESTUDIANTES.APELLIDOS || ', ' || V_ESTUDIANTES.NOMBRE ) );
    END LOOP;
END;
/

/*Escribir un bloque que divida un número entre cero. Capturar la excepción WHEN OTHERS y mostrar por pantalla el código y mensaje de error.*/
set serveroutput on;

declare
    resultado number(5,2);
begin
    resultado := 4/0;
exception
    when others then
        dbms_output.put_line( 'Ocurrió el error '||SQLCODE||' mensaje: '||SQLERRM );
end;
/

/*Sobre la tabla Estudiantes. Escribir un bloque que muestre el número total de estudiantes y lanzar una excepción NO_ALUMNOS si el número es igual a 0, indicando con un mensaje que no hay alumnos.*/
DECLARE
    TOTAL INT;
    NO_ALUMNOS EXCEPTION;
BEGIN
    SELECT COUNT(*) INTO TOTAL FROM ESTUDIANTES;
    IF TOTAL = 0 THEN
       RAISE NO_ALUMNOS;
    END IF;
    dbms_output.put_line(TOTAL);
    EXCEPTION
       WHEN NO_ALUMNOS THEN
          dbms_output.put_line('No hay alumnos');
END;
/

/*Incorporar una nueva excepción MUCHOS_ALUMNOS, si el total de alumnos es mayor o igual que 5.*/
DECLARE
    TOTAL INT;
    NO_ALUMNOS EXCEPTION;
    MUCHOS_ALUMNOS EXCEPTION;
BEGIN
    SELECT COUNT(*) INTO TOTAL FROM ESTUDIANTES;
    IF TOTAL = 0 THEN
       RAISE NO_ALUMNOS;
    ELSIF TOTAL >= 5 THEN
        RAISE MUCHOS_ALUMNOS;
    END IF;
    dbms_output.put_line(TOTAL);
    EXCEPTION
       WHEN NO_ALUMNOS THEN
          dbms_output.put_line('No hay alumnos');
        WHEN MUCHOS_ALUMNOS THEN
          dbms_output.put_line('Hay demasiados alumnos');
END;
/

/*Crea un procedimiento que se llame consultarEmpleado. Debe tomar una variable de entrada v_empno con el tipo de dato del campo empno de la tabla emp. Debe tomar como variables de salida v_ename y v_job, cuyos tipos de datos deben coincidir con los de los campos ename y job de la tabla emp.
Controla con una excepción que no se encuentre ningún dato con el valor de v_empno de entrada, mostrando el mensaje “No se encontraron datos”.*/
CREATE OR REPLACE PROCEDURE consultarEmpleado
 (v_empno emp.empno%type, v_ename OUT emp.ename%type, v_job OUT emp.job%type)
IS
BEGIN
    SELECT ename, job 
    INTO v_ename, v_job
    FROM emp
    WHERE empno = v_empno;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        dbms_output.put_line('No se encontraron datos');
END;
/

/*Invoca al procedimiento consultarEmpleado pasando tres variables (id, nombre y puesto). La variable id debe obtener su valor pidiéndola por pantalla al usuario.
Se debe mostrar por pantalla el resultado devuelto del procedimiento anterior en las variables de salida nombre y puesto.*/
DECLARE
    nombre emp.ename%type;
    puesto emp.job%type;
    id emp.empno%type := &identificador;
BEGIN
    consultarEmpleado(id, nombre, puesto);
    dbms_output.put_line(id||': '||nombre||' ('||puesto||')');
END;
/

--Solución mejorada Ejercicio
DECLARE
    nombre emp.ename%type;
    puesto emp.job%type;
    id emp.empno%type := &identificador;
BEGIN
    consultarEmpleado(id, nombre, puesto);
    if (nombre is not NULL and puesto is not NULL) then
        dbms_output.put_line(id||': '||nombre||' ('||puesto||')');
    end if;
END;
/

/*Escribe un procedimiento denominado is_today que muestre por pantalla la fecha de hoy, y luego llámalo desde un bloque anónimo.*/
CREATE OR REPLACE PROCEDURE today_is is
BEGIN
  DBMS_OUTPUT.PUT_LINE( 'Hoy es ' || TO_CHAR(SYSDATE, ' DD/MM/YYYY') );
END today_is;
/


BEGIN
    TODAY_IS(); 
END;
/

/*Escribe un procedimiento denominado is_today2 que, dada la fecha de hoy, la escriba por pantalla. Invoca al procedimiento con la fecha de hoy.*/
CREATE OR REPLACE PROCEDURE today2_is ( fecha DATE ) IS
BEGIN
  DBMS_OUTPUT.PUT_LINE( 'Hoy es ' || TO_CHAR(fecha, ' DD/MM/YYYY') );
END;
/

DECLARE 

BEGIN
  today2_is(sysdate);  
END;
/

/*Crear una función nombreEstudiante, que dado un
código de estudiante, devuelva su nombre y apellidos. Tener en cuenta que el código no exista.*/
CREATE OR REPLACE FUNCTION nombreEstudiante(cod Estudiantes.codigo%Type) return varchar2 is
    v_est estudiantes%ROWTYPE;
BEGIN
    select * into v_est from estudiantes where codigo = cod;
    return (v_est.nombre || ', '|| v_est.apellidos);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN('No existe el estudiante con código: ' || cod);
END nombreEstudiante;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE(nombreEstudiante(10));
END;
/

/*Crear una función totalEstudiantes, que devuelva el número total de estudiantes.*/
CREATE OR REPLACE FUNCTION totalEstudiantes return int is
    v_num int;
BEGIN
    select count(*) into v_num from estudiantes;
    return (v_num);   
END totalEstudiantes;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE('El número total de estudiantes es: ' || totalEstudiantes);
END;
/

--act bloque básico
1. 
Crea una función llamada borrarEmpleado que reciba por parámetro un código empno y que si, existe dicho código en la base de datos (tabla emp), borre dicho registro. Debe devolver "Registro borrado correctamente" si lo puede realizar, y si no, "No existe dicho código".

2. 
Crea un bloque de código anónimo que pida por teclado un código empno, llame a la función borrarEmpleado con dicho valor como parámetro, y finalmente muestre por la salida el mensaje recibido por dicha función.

3. 
Realiza una función llamada actualizaNombreEmpleado que reciba por parámetros el código empno del empleado a modificar, y el nuevo nombre que sustituye a su valor en ename de la tabla emp. Se debe comprobar que existe el empno correspondiente al código pasado por parámetro, y solo si existe, modificarlo. Debe devolver un mensaje indicando si se hizo o no el cambio de nombre.

4. 
Realiza un bloque de código anónimo que llame a la función actualizaNombreEmpleado que pida por teclado un código empno y después un ename, llame a la función actualizaNombreEmpleado con dichos valores como parámetros, y finalmente muestre por la salida el mensaje recibido por dicha función.

5. 
Mejora la función actualizaNombreEmpleado para que compruebe que el nombre pasado por parámetro no coincida con el ename (independientemente de que se escriba en mayúsculas o minúsculas), y si coincide, la función no debe hacer el update y sin embargo debe devolver el mensaje "No se ha actualizado el registro porque ese nombre es el que tenía el empleado".

6. 
Se quiere un procedimiento mostrarAlReves que cuando se le llame desde un bloque de código anónimo con un parámetro, muestre por la salida de consola ese nombre al revés. Ej.: mostrarAlReves('HOLA') debe mostrar ALOH por la salida.

--ACT 1
1.
Se necesita una función llamada compruebaCadena que reciba dos parámetros que sean palabras del tipo varchar tamaño 10. Si la palabra 1 tiene más letras que la palabra 2, la función devolverá concatenadas ambas palabras, siendo primero la palabra 1 y a continuación la palabra 2 (juntas). Si la palabra 2 tiene más letras que la palabra 1, la función devolverá una palabra que sea la unión/concatenación de la palabra 2 junto a la palabra 1 (en ese orden). Si ambas palabras tienen el mismo número de letras, la función debe devolver tantos guiones como letras tengan (ej.: si ambas palabras tienen 4 letras, debe devolver ----).

2.
Realiza un bloque de código anónimo que pida al usuario que meta dos palabras por teclado de menos de diez letras (palabra 1 y palabra 2), y después muestra por pantalla el resultado de llamar a compruebaCadena usando las siguientes cadenas:
2.1. Palabra 1 igual a DECKARD y palabra 2 igual a RICK.
2.2. Palabra 1 igual a ZHORA y palabra 2 igual a BATTY.

## Solución

```
set serveroutput on;
--1
create or replace function compruebaCadena(palabra1 varchar,palabra2 varchar) return varchar
is
    resultado varchar(10) := '';
begin
    if length(palabra1) > length(palabra2) then
        return palabra1 || palabra2;
    elsif length(palabra1) < length(palabra2) then
        return palabra2 || palabra1;
    else
        for i in 1..length(palabra1) loop
            resultado := resultado || '-';
        end loop;
        return resultado;
    end if;
end;
/
--2
declare
    p1 varchar(10) := '&palabra1';
    p2 varchar(10) := '&palabra2';
begin
    dbms_output.put_line(compruebaCadena(p1,p2));
end;
/
```
--act 2 

1.
Se necesita una función llamada insertaEmpleado que reciba por parámetros todos los campos de la tabla emp (empno, ename, job, etc.). Esta función comprobará si existe algún empno en la table emp con el que se le pasa por parámetro y, si no hay ninguno, creará un registro en la tabla emp con todos esos datos pasados por parámetro. Después, devolverá en una variable el mensaje "Registro insertado correctamente". En caso de que ese empno exista en la tabla emp, se debe devolver en una variable el mensaje "No se puede crear, ya existe".

2.
Realiza un bloque de código anónimo que pida al usuario que meta por teclado todos los campos de la tabla emp, guárdalos en sus variables correspondientes, llama a la función insertaEmpleado y muestra por consola el mensaje que devuelve dicha función. Haz un ejemplo con los siguientes datos:
- empno: 7999
- ename: STEVEN
- job: MANAGER
- mgr: 7839
- hiredate: 01/01/23
- sal: 3000
- comm: 0
- deptno: 10

--2
declare
    vempno emp.empno%type := &mete_empno;
    vename emp.ename%type := '&mete_vename';
    vjob emp.job%type := '&mete_job';
    vmgr emp.mgr%type := &mete_mgr;
    vhiredate emp.hiredate%type := '&mete_hiredate';
    vsal emp.sal%type := &mete_sal;
    vcomm emp.comm%type := &mete_comm;
    vdeptno emp.deptno%type := &mete_deptno;
begin
    dbms_output.put_line(insertaEmpleado(vempno,vename,vjob,vmgr,vhiredate,vsal,vcomm,vdeptno));
end;
/
```


## Solución act 3
1.
Crea una función obtenerSalEmpMes que reciba como parámetro de entrada el NÚMERO de un mes (de 1 a 12) y devuelva la suma total de los salarios de los empleados que fueron contratados en ese número de mes pasado como parámetro. Debes crear una excepción personalizada que se llame noDatos y que sea llamada cuando esa suma de salarios no tenga valor (null) porque no hay empleados contratados en ese mes. Esta excepción debe devolver -1. TABLA EMP.

2.
Llama a la función obtenerSalEmpMes con el valor 2.

## Solución act 2

```
set serveroutput on;
--1
create or replace function insertaEmpleado(
    vempno emp.empno%type,
    vename emp.ename%type,
    vjob emp.job%type,
    vmgr emp.mgr%type,
    vhiredate emp.hiredate%type,
    vsal emp.sal%type,
    vcomm emp.comm%type,
    vdeptno emp.deptno%type) return varchar
is
    totalEmp int;
    resultado varchar(100);
begin
    select count(empno) into totalEmp from emp where empno = vempno;
    if totalEmp = 0 then
        insert into emp values (vempno,vename,vjob,vmgr,vhiredate,vsal,vcomm,vdeptno);
        resultado := 'Registro insertado correctamente';
    else 
        resultado := 'No se puede crear, ya existe';
    end if;
    return resultado;
end;
/

```
--1
select sum(sal) from emp where to_char(hiredate,'mm') = 3;
create or replace function obtenerSalEmpMes (numMes int) return emp.sal%type
is
    sumaTotalSalarios emp.sal%type;
    noDatos exception;
begin
    select sum(sal) into sumaTotalSalarios from emp where to_char(hiredate,'mm') = numMes;
    if sumaTotalSalarios is null then
        raise noDatos;
    else
        return sumaTotalSalarios;
    end if;
exception
    when noDatos then
        return -1;
end;
/
--2
begin
    dbms_output.put_line(obtenerSalEmpMes(2));
end;
/
```


