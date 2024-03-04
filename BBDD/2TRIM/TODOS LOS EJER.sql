--1 Obt�n el nombre de todos los futbolistas de la base de datos.
select * from futbolistas;
select nombre from futbolistas;

--1 Ahora queremos saber la posici�n que ocupan estos futbolistas (aunque se repitan los valores).
select posicion from futbolistas;

--2 Se quiere saber las posiciones existentes por lo que se requiere la posici�n de los futbolistas sin que se repitan los valores.
select distinct posicion from futbolistas;

--2 Obt�n todas las posiciones posibles (diferentes) de los futbolistas bajo el encabezado �Demarcaciones�.
select posicion as "Demarcaciones" from futbolistas;

--Obt�n todas las posiciones posibles (diferentes y que no se repitan) de los futbolistas bajo el encabezado �Demarcaciones�.
select distinct posicion as "Demarcaci�n" from futbolistas;

--Muestra todos los datos almacenados de todos los futbolistas.
select * from futbolistas;

--3 Devuelve los apell de los futbolistas que su posici�n DEFENSA. Aplica un alias a apell para que muestre �Futbolista� y asigna el alias F a la tabla futbolistas.
select apellidos from futbolistas where posicion = 'DEFENSA'; --LO QUE QUIERA BUSCAR DEBO PONERLO IGUAL QUE ESA ESCRITO. NO VALE Defensa ni defensa
SELECT F.APELLIDOS as Futbolista FROM FUTBOLISTAS F WHERE POSICION = 'DEFENSA'; 

--4 Devuelve los apellidos de los futbolistas que su posici�n sea DEFENSA ordenador de la Z a la A.
select apellidos from futbolistas where posicion = 'DEFENSA' order by apellidos desc;

--5 Devuelve todos los datos de futbolistas ordenados primero por posici�n y luego por apellidos.
select * from futbolistas order by posicion, apellidos;

--6 Obt�n el nombre de los futbolistas que cobran m�s de 150.000 euros (SALARIO).
select nombre from futbolistas where salario > 150000;

--? Muestra el ID de los futbolistas cuyo apellido sea G�MEZ.
select id from futbolistas where apellidos = 'GOMEZ';

--? Indica los apellidos de los futbolistas que empiezan por G.
SELECT APELLIDOS FROM FUTBOLISTAS WHERE APELLIDOS LIKE 'G%';
--? Devuelve todos los datos de los futbolistas cuya posici�n sea DEFENSA o DELANTERO.
SELECT * FROM FUTBOLISTAS WHERE POSICION = 'DEFENSA' OR POSICION = 'DELANTERO';
SELECT * FROM FUTBOLISTAS WHERE POSICION IN ('DEFENSA','DELANTERO');
--Obt�n el nombre de los futbolistas que cobran entre 100.000 y 200.000 euros (SALARIO).
SELECT NOMBRE FROM FUTBOLISTAS WHERE SALARIO BETWEEN 100000 AND 200000;

--7 Se va a hacer un aumento de sueldo de los PORTEROS. Para ello obt�n el nombre, apellido y el nuevo salario de los PORTEROS si se aumenta un 10% el que 
--tienen actualmente. La lista debe estar ordenada alfab�ticamente por los apellidos.
SELECT NOMBRE, APELLIDOS, SALARIO * 1.10 AS "NUEVO SALARIO" FROM futbolistas WHERE POSICION = 'PORTERO' ORDER BY APELLIDOS;

--8 Devuelve en una �nica columna el nombre del futbolista seguido de la palabra �es� y a continuaci�n la posici�n que ocupa. La columna debe llamarse �Posiciones�.
SELECT NOMBRE ||' ES '|| POSICION AS "POSICIONES" FROM FUTBOLISTAS;

--9 Queremos saber todos los datos de los futbolistas que ganen m�s de 150.000 euros y sean defensas.*/
SELECT * FROM FUTBOLISTAS WHERE SALARIO > 150000 AND POSICION = 'DEFENSA';
SELECT * FROM FUTBOLISTAS WHERE (salario > 150000 AND POSICION = 'DEFENSA');

--10 El 'LIKE' solo se usa con expresiones regulares( _ , % )
/*En la siguiente consulta:
SELECT APELLIDOS FROM FUTBOLISTAS WHERE APELLIDOS LIKE �A%S%�;
�QU� SE ESTAR�A SELECCIONANDO?
a) Aquellos futbolistas cuyos apellidos contienen la letra A y la S.
b) Aquellos futbolistas cuyos apellidos comienzan por la A y contienen la S. CORRECTA
c) Aquellos futbolistas cuyos apellidos no contienen ni la A ni la S.
d) Todos los apellidos de todos los futbolistas menos los que su apellido comienza por S.*/

--11 Realiza una consulta que te devuelva los campos Nombre, Salario, Salario bruto terminado en la palabra �euros� y llamando a esa columna �Salario bruto�.
SELECT NOMBRE, SALARIO, SALARIO * 1.5 ||' EUROS'  AS "SALARIO BRUTO" FROM FUTBOLISTAS;
SELECT NOMBRE, SALARIO, SALARIO * 1.5 || ' EUROS' "SALARIO BRUTO" FROM FUTBOLISTAS;
-- INITCAP PONE LA PRIMERA LETRA EN MAYUSCULA Y LAS DEMAS EN MINUSCULA.
select initcap (nombre), salario, salario * 1.5 || ' euros' "Salario Bruto" from futbolistas;
-- CAMBIA TODO A MINUS
select lower (nombre), salario, salario * 1.5 || 'euros' "Salario Bruto" from futbolistas ;

--12 Realiza las siguientes operaciones utilizando funciones num�ricas:
--1. Calcula el valor absoluto de -10.
select  ABS(-10) FROM DUAL;
--2. Obt�n el exponente en base e de 4.
SELECT EXP(4) FROM DUAL;
--3. Redondea el n�mero 15,3 a 16.
SELECT CEIL(15.3) FROM DUAL;
--4. Redondea el n�mero anterior (15,3) a 15. 
SELECT FLOOR(15.3) FROM DUAL;
--5. Calcula el resto de 15 entre 3 (15/3).
SELECT MOD(15,3) FROM DUAL;
--6. Eleva 15 al exponente 2 (152).
SELECT POWER(15,2) FROM DUAL;

--13 Realiza las siguientes operaciones utilizando funciones num�ricas:
--1. Redondea 15,789 con un decimal.
SELECT ROUND(15.789,1) FROM DUAL;

--2. Obt�n la ra�z cuadrada de 128.
SELECT SQRT(128) FROM DUAL;

--3. Trunca 15,789 a 1 decimal.
SELECT TRUNC(15.789, 1) FROM DUAL;

--4. Trunca 15,789 para dejarlo sin decimales (15).
SELECT TRUNC(15.789) FROM DUAL;

--5. Trunca 157,89 para dejarlo en 100.
SELECT TRUNC(157.89, -2) FROM DUAL;

--6. Obt�n el signo de -15 (es decir -1) 
SELECT SIGN(-15) FROM DUAL;

--14 
--1. �Cu�l es el car�cter 80 en ASCII?
SELECT CHR(80) FROM DUAL;
--2. Obt�n el valor ASCII de la letra H.
SELECT ASCII('H') FROM DUAL;
--3. Devuelve el nombre y los apell en una �nica columna de los futbolistas cuya posici�n DEFENSA. El nombre en may�sculas y los apellidos en min�sculas.
SELECT UPPER(NOMBRE)||' '|| LOWER(APELLIDOS) FROM FUTBOLISTAS WHERE POSICION = 'DEFENSA';

--4. Obt�n todas las posiciones posibles (no repetidas) con la primera letra en may�sculas y el resto en min�scula) ordenadas alfabet.
SELECT DISTINCT INITCAP(POSICION) FROM FUTBOLISTAS ORDER BY INITCAP(POSICION) ASC;
SELECT DISTINCT INITCAP(POSICION) FROM FUTBOLISTAS ORDER BY 1;

--5. Devuelve los nombres de los futbolistas del EQUIPO A con el siguiente formato: --AAA, siendo AAA las tres primeras letras del nombre. Ej.: --PED, --LUI, etc.
SELECT LPAD(NOMBRE, 3, '--') FROM FUTBOLISTAS;
SELECT SUBSTR(NOMBRE, 1, 3) FROM FUTBOLISTAS;
SELECT LPAD(SUBSTR( NOMBRE, 1, 3), 5, '--') FROM FUTBOLISTAS;

--6. Devuelve los nombres de los futbolistas del EQUIPO A con el siguiente formato: AAA--, siendo AAA las tres primeras letras del nombre. Ej.: PED--, LUI--, etc.
SELECT RPAD(SUBSTR( NOMBRE, 1, 3), 5, '--') FROM FUTBOLISTAS;

--7. Devuelve el nombre de los futbolistas sustituyendo �LUIS� por �L.�.
SELECT REPLACE(NOMBRE,'LUIS','L.') FROM FUTBOLISTAS;

--8. Queremos los apellidos de los futbolistas con tan solo 3 caracteres.
SELECT SUBSTR(APELLIDOS, 1, 3) FROM FUTBOLISTAS;

--9. Devuelve el nombre de los futbolistas sustituyendo �LUIS� por �L.� y en otra columna el tama�o de los apellidos (longitud de caract.).
SELECT REPLACE(NOMBRE,'LUIS','L.'),LENGTH(APELLIDOS) FROM FUTBOLISTAS;

--15
--1. Obt�n en tres columnas independientes, el d�a, el mes y A�O.
SELECT EXTRACT(DAY FROM SYSDATE)AS "DIA", EXTRACT(MONTH FROM SYSDATE)AS "MES",EXTRACT(YEAR FROM SYSDATE)AS "A�O" FROM DUAL;
--OBTEN LA FECHA DE HOY
SELECT SYSDATE FROM DUAL;

--2. Muestra por pantalla la fecha que ser� dentro de 6 meses utilizando ADD_MONTHS.
SELECT ADD_MONTHS(SYSDATE, 6) FROM DUAL;

--3. Muestra el n�mero de meses que hay entre hoy y la fecha de nacimiento de todos los futbolistas.
SELECT FLOOR(MONTHS_BETWEEN(SYSDATE,FECHA_NACIMIENTO)) AS "MESES" FROM FUTBOLISTAS;

--4. �Cu�l es el �ltimo d�a de este mes? Mu�stralo.
SELECT LAST_DAY(SYSDATE) FROM DUAL;

--5. �Qu� d�a ser� el pr�ximo lunes? Ponlo por pantalla mediante una petici�n.
SELECT NEXT_DAY(SYSDATE,'LUNES') FROM DUAL;
--6. Muestra el d�a que era hace 4 d�as. �Y el d�a de ma�ana?
SELECT SYSDATE -4 FROM DUAL;
SELECT SYSDATE +1 FROM DUAL;

select add_months('25/06/24',6) from dual; --PARA A�ADIR A LOS MESES
select to_date('25/06/24') + 1 from dual;--CONVIERTE DE TEXTO A FECHA Y LE SUMA 1

--16
--1. Convierte �1000.45� a un n�mero.

--2. Convierte �1000.45�� a un n�mero.

--3. Convierte �-$1000.45� a un n�mero.

--4. Muestra el d�a de hoy con los siguientes formatos:  12/02/2021, 12/02/21, 12-feb-2021, 12 de febrero de 2021

--5. Convierte el ID de la tabla FUTBOLISTAS en un n�mero de tres cifras.

--6. Muestra todos los a�os de nacimiento de los futbolistas (solo el a�o, ej.: 1990, 1991, etc.). Ord�nalos de menor a mayor a�o.
