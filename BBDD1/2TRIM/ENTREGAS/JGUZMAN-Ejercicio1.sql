--Ejercicio semanal 1

--1. Se quieren saber todos los campos/datos de los partidos que se hayan disputado entre el 01-01-2020 y el 31-01-2020.
SELECT * FROM PARTIDOS WHERE FECHA BETWEEN '01/01/2020' AND '31/01/2020';
--2. Devuelve todos los árbitros de los partidos sin repetir resultados.
SELECT DISTINCT ARBITRO FROM PARTIDOS ;
--3. Se quiere saber el id y resultado de la tabla partidos en los que el resultado haya terminado en -00. Debes usar un alias de tabla para partidos, que sea p, y debes usarlo en tus columnas id y resultado.
SELECT p.id, p.resultado FROM PARTIDOS p where resultado like '%-00' ;
--4. Devuelve el id, árbitro y estadio de los partidos pero ordenado de la siguiente forma: 1º por estadio en orden descendente, luego por árbitro y finalmente por id descendente.
SELECT ID, ARBITRO, ESTADIO FROM PARTIDOS ORDER BY ESTADIO DESC, ARBITRO DESC , ID DESC;
