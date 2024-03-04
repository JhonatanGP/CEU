--1 Obtén el nombre de todos los futbolistas de la base de datos.
select * from futbolistas;
select nombre from futbolistas;

--1 Ahora queremos saber la posición que ocupan estos futbolistas (aunque se repitan los valores).
select posicion from futbolistas;

--2 Se quiere saber las posiciones existentes por lo que se requiere la posición de los futbolistas sin que se repitan los valores.
select distinct posicion from futbolistas;

--2 Obtén todas las posiciones posibles (diferentes) de los futbolistas bajo el encabezado “Demarcaciones”.
select posicion as "Demarcaciones" from futbolistas;

--Obtén todas las posiciones posibles (diferentes y que no se repitan) de los futbolistas bajo el encabezado “Demarcaciones”.
select distinct posicion as "Demarcación" from futbolistas;

--Muestra todos los datos almacenados de todos los futbolistas.
select * from futbolistas;

--3 Devuelve los apell de los futbolistas que su posición DEFENSA. Aplica un alias a apell para que muestre “Futbolista” y asigna el alias F a la tabla futbolistas.
select apellidos from futbolistas where posicion = 'DEFENSA'; --LO QUE QUIERA BUSCAR DEBO PONERLO IGUAL QUE ESA ESCRITO. NO VALE Defensa ni defensa
SELECT F.APELLIDOS as Futbolista FROM FUTBOLISTAS F WHERE POSICION = 'DEFENSA'; 

--4 Devuelve los apellidos de los futbolistas que su posición sea DEFENSA ordenador de la Z a la A.
select apellidos from futbolistas where posicion = 'DEFENSA' order by apellidos desc;

--5 Devuelve todos los datos de futbolistas ordenados primero por posición y luego por apellidos.
select * from futbolistas order by posicion, apellidos;

--6 Obtén el nombre de los futbolistas que cobran más de 150.000 euros (SALARIO).
select nombre from futbolistas where salario > 150000;

--? Muestra el ID de los futbolistas cuyo apellido sea GÓMEZ.
select id from futbolistas where apellidos = 'GOMEZ';

--? Indica los apellidos de los futbolistas que empiezan por G.
SELECT APELLIDOS FROM FUTBOLISTAS WHERE APELLIDOS LIKE 'G%';
--? Devuelve todos los datos de los futbolistas cuya posición sea DEFENSA o DELANTERO.
SELECT * FROM FUTBOLISTAS WHERE POSICION = 'DEFENSA' OR POSICION = 'DELANTERO';
SELECT * FROM FUTBOLISTAS WHERE POSICION IN ('DEFENSA','DELANTERO');
--Obtén el nombre de los futbolistas que cobran entre 100.000 y 200.000 euros (SALARIO).
SELECT NOMBRE FROM FUTBOLISTAS WHERE SALARIO BETWEEN 100000 AND 200000;

--7 Se va a hacer un aumento de sueldo de los PORTEROS. Para ello obtén el nombre, apellido y el nuevo salario de los PORTEROS si se aumenta un 10% el que 
--tienen actualmente. La lista debe estar ordenada alfabéticamente por los apellidos.
SELECT NOMBRE, APELLIDOS, SALARIO * 1.10 AS "NUEVO SALARIO" FROM futbolistas WHERE POSICION = 'PORTERO' ORDER BY APELLIDOS;

--8 Devuelve en una única columna el nombre del futbolista seguido de la palabra “es” y a continuación la posición que ocupa. La columna debe llamarse “Posiciones”.
SELECT NOMBRE ||' ES '|| POSICION AS "POSICIONES" FROM FUTBOLISTAS;

--9 Queremos saber todos los datos de los futbolistas que ganen más de 150.000 euros y sean defensas.*/
SELECT * FROM FUTBOLISTAS WHERE SALARIO > 150000 AND POSICION = 'DEFENSA';
SELECT * FROM FUTBOLISTAS WHERE (salario > 150000 AND POSICION = 'DEFENSA');

--10 El 'LIKE' solo se usa con expresiones regulares( _ , % )
/*En la siguiente consulta:
SELECT APELLIDOS FROM FUTBOLISTAS WHERE APELLIDOS LIKE ‘A%S%’;
¿QUÉ SE ESTARÍA SELECCIONANDO?
a) Aquellos futbolistas cuyos apellidos contienen la letra A y la S.
b) Aquellos futbolistas cuyos apellidos comienzan por la A y contienen la S. CORRECTA
c) Aquellos futbolistas cuyos apellidos no contienen ni la A ni la S.
d) Todos los apellidos de todos los futbolistas menos los que su apellido comienza por S.*/

--11 Realiza una consulta que te devuelva los campos Nombre, Salario, Salario bruto terminado en la palabra “euros” y llamando a esa columna “Salario bruto”.
SELECT NOMBRE, SALARIO, SALARIO * 1.5 ||' EUROS'  AS "SALARIO BRUTO" FROM FUTBOLISTAS;
SELECT NOMBRE, SALARIO, SALARIO * 1.5 || ' EUROS' "SALARIO BRUTO" FROM FUTBOLISTAS;
-- INITCAP PONE LA PRIMERA LETRA EN MAYUSCULA Y LAS DEMAS EN MINUSCULA.
select initcap (nombre), salario, salario * 1.5 || ' euros' "Salario Bruto" from futbolistas;
-- CAMBIA TODO A MINUS
select lower (nombre), salario, salario * 1.5 || 'euros' "Salario Bruto" from futbolistas ;

--12 Realiza las siguientes operaciones utilizando funciones numéricas:
--1. Calcula el valor absoluto de -10.
select  ABS(-10) FROM DUAL;
--2. Obtén el exponente en base e de 4.
SELECT EXP(4) FROM DUAL;
--3. Redondea el número 15,3 a 16.
SELECT CEIL(15.3) FROM DUAL;
--4. Redondea el número anterior (15,3) a 15. 
SELECT FLOOR(15.3) FROM DUAL;
--5. Calcula el resto de 15 entre 3 (15/3).
SELECT MOD(15,3) FROM DUAL;
--6. Eleva 15 al exponente 2 (152).
SELECT POWER(15,2) FROM DUAL;

--13 Realiza las siguientes operaciones utilizando funciones numéricas:
--1. Redondea 15,789 con un decimal.
SELECT ROUND(15.789,1) FROM DUAL;

--2. Obtén la raíz cuadrada de 128.
SELECT SQRT(128) FROM DUAL;

--3. Trunca 15,789 a 1 decimal.
SELECT TRUNC(15.789, 1) FROM DUAL;

--4. Trunca 15,789 para dejarlo sin decimales (15).
SELECT TRUNC(15.789) FROM DUAL;

--5. Trunca 157,89 para dejarlo en 100.
SELECT TRUNC(157.89, -2) FROM DUAL;

--6. Obtén el signo de -15 (es decir -1) 
SELECT SIGN(-15) FROM DUAL;

--14 
--1. ¿Cuál es el carácter 80 en ASCII?
SELECT CHR(80) FROM DUAL;
--2. Obtén el valor ASCII de la letra H.
SELECT ASCII('H') FROM DUAL;
--3. Devuelve el nombre y los apell en una única columna de los futbolistas cuya posición DEFENSA. El nombre en mayúsculas y los apellidos en minúsculas.
SELECT UPPER(NOMBRE)||' '|| LOWER(APELLIDOS) FROM FUTBOLISTAS WHERE POSICION = 'DEFENSA';

--4. Obtén todas las posiciones posibles (no repetidas) con la primera letra en mayúsculas y el resto en minúscula) ordenadas alfabet.
SELECT DISTINCT INITCAP(POSICION) FROM FUTBOLISTAS ORDER BY INITCAP(POSICION) ASC;
SELECT DISTINCT INITCAP(POSICION) FROM FUTBOLISTAS ORDER BY 1;

--5. Devuelve los nombres de los futbolistas del EQUIPO A con el siguiente formato: --AAA, siendo AAA las tres primeras letras del nombre. Ej.: --PED, --LUI, etc.
SELECT LPAD(NOMBRE, 3, '--') FROM FUTBOLISTAS;
SELECT SUBSTR(NOMBRE, 1, 3) FROM FUTBOLISTAS;
SELECT LPAD(SUBSTR( NOMBRE, 1, 3), 5, '--') FROM FUTBOLISTAS;

--6. Devuelve los nombres de los futbolistas del EQUIPO A con el siguiente formato: AAA--, siendo AAA las tres primeras letras del nombre. Ej.: PED--, LUI--, etc.
SELECT RPAD(SUBSTR( NOMBRE, 1, 3), 5, '--') FROM FUTBOLISTAS;

--7. Devuelve el nombre de los futbolistas sustituyendo “LUIS” por “L.”.
SELECT REPLACE(NOMBRE,'LUIS','L.') FROM FUTBOLISTAS;

--8. Queremos los apellidos de los futbolistas con tan solo 3 caracteres.
SELECT SUBSTR(APELLIDOS, 1, 3) FROM FUTBOLISTAS;

--9. Devuelve el nombre de los futbolistas sustituyendo “LUIS” por “L.” y en otra columna el tamaño de los apellidos (longitud de caract.).
SELECT REPLACE(NOMBRE,'LUIS','L.'),LENGTH(APELLIDOS) FROM FUTBOLISTAS;

--15
--1. Obtén en tres columnas independientes, el día, el mes y AÑO.
SELECT EXTRACT(DAY FROM SYSDATE)AS "DIA", EXTRACT(MONTH FROM SYSDATE)AS "MES",EXTRACT(YEAR FROM SYSDATE)AS "AÑO" FROM DUAL;
--OBTEN LA FECHA DE HOY
SELECT SYSDATE FROM DUAL;

--2. Muestra por pantalla la fecha que será dentro de 6 meses utilizando ADD_MONTHS.
SELECT ADD_MONTHS(SYSDATE, 6) FROM DUAL;

--3. Muestra el número de meses que hay entre hoy y la fecha de nacimiento de todos los futbolistas.
SELECT FLOOR(MONTHS_BETWEEN(SYSDATE,FECHA_NACIMIENTO)) AS "MESES" FROM FUTBOLISTAS;

--4. ¿Cuál es el último día de este mes? Muéstralo.
SELECT LAST_DAY(SYSDATE) FROM DUAL;

--5. ¿Qué día será el próximo lunes? Ponlo por pantalla mediante una petición.
SELECT NEXT_DAY(SYSDATE,'LUNES') FROM DUAL;
--6. Muestra el día que era hace 4 días. ¿Y el día de mañana?
SELECT SYSDATE -4 FROM DUAL;
SELECT SYSDATE +1 FROM DUAL;

select add_months('25/06/24',6) from dual; --PARA AÑADIR A LOS MESES
select to_date('25/06/24') + 1 from dual;--CONVIERTE DE TEXTO A FECHA Y LE SUMA 1

--16
--1. Convierte ‘1000.45’ a un número.

--2. Convierte ‘1000.45€’ a un número.

--3. Convierte ‘-$1000.45’ a un número.

--4. Muestra el día de hoy con los siguientes formatos:  12/02/2021, 12/02/21, 12-feb-2021, 12 de febrero de 2021

--5. Convierte el ID de la tabla FUTBOLISTAS en un número de tres cifras.

--6. Muestra todos los años de nacimiento de los futbolistas (solo el año, ej.: 1990, 1991, etc.). Ordénalos de menor a mayor año.
