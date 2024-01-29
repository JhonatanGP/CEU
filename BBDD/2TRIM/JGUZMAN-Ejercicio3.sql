--EJERCICIO SEMANAL 3

--1. Devuelve el nombre del futbolista cuyo salario es el más bajo posible de todos los futbolistas nacidos entre 1985 y 1990.
SELECT NOMBRE FROM FUTBOLISTAS WHERE SALARIO = (SELECT MIN (SALARIO) FROM FUTBOLISTAS) AND FECHA_NACIMIENTO BETWEEN '01-01-1985' AND '31-12-1990';

--2. Indica cuántos futbolistas que no juegan de portero tienen un apellido que termina en ez.
SELECT COUNT (*) FROM FUTBOLISTAS WHERE POSICION NOT LIKE 'PORTERO' AND SUBSTR (APELLIDOS, LENGTH(APELLIDOS)-1, LENGTH(APELLIDOS)) LIKE 'EZ';

/*3. Devuelve el id del equipo con alias "id equipo", el número de futbolistas con alias "Número de futbolistas" y el salario medio redondeado a 2 
decimales con alias "Salario medio" de los futbolistas agrupado por el equipo en el que juegan.*/
SELECT COUNT (*), ID_EQUIPO "NUMERO DE FUTBOLISTAS" FROM FUTBOLISTAS GROUP BY ID_EQUIPO;
SELECT ROUND (AVG(SALARIO),2) "SALARIO MEDIO" FROM FUTBOLISTAS GROUP BY ID_EQUIPO;
--1 corregido
select * from futbolistas;
select min(salario) from futbolistas;
select nombre 
    from futbolistas 
    where to_char(fecha_nacimiento,'yyyy') between 1985 and 1990
        and salario = (
            select min(salario) 
                from futbolistas 
                where to_char(fecha_nacimiento,'yyyy') between 1985 and 1990);