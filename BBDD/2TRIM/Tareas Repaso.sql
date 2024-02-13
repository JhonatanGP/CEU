--Tareas de repaso con join
--ESTRUCTURA JOIN siempre JOIN NOMBRETABLA ON CONDICION

--1. Indica el nombre de los futbolistas y el nombre del equipo en el que juegan
select * from equipos;
select * from futbolistas;
select futbolistas.nombre, equipos.nombre from futbolistas join equipos on futbolistas.id_equipo = equipos.id;

--2. ¿Cuál es el nombre del equipo donde juega el jugador más alto?
select equipos.nombre from futbolistas join equipos on equipos.id = futbolistas.id_equipo where altura = (select max (altura) from futbolistas);

-- ¿Cómo se llama el jugador más alto?
select nombre from futbolistas where altura = (select max (altura) from futbolistas);
-- ¿Cuánto mide el jugador más alto?
select max (altura) from futbolistas;

--3. Utiliza UNION para mostrar el nombre de los futbolistas del equipo A, y los del equipo B.

--4. ¿Cuántos futbolistas han nacido antes de 1995?

--5. Devuelve una lista agrupada por posición y número de jugadores que juegan en dicha posición. POSICION NUM_JUGADORES Ej.: MEDIOCENTRO 3 DEFENSA 2 PORTERO 1

--6. ¿Cuántos partidos se han jugado en enero?

--7. Devuelve una lista agrupada con los nombres de los equipos y el salario medio de los futbolistas de dichos equipos.

--8. ¿Cuántos meses han pasado entre el primer partido disputado y el último partido jugado?

--9. Se quiere el nombre y los apellidos de los futbolistas y tengan un salario superior a 130000. Debe devolverse una única columna con este formato: apellidos, nombre (todo en minúsculas)

--10. Devuelve el nombre del estadio, junto al nombre del árbitro (la primera letra en mayúsculas y el resto en minúsculas para ambos campos) de aquellos partidos que se hayan jugado en domingo.

--11. Devuelve el nombre de los árbitros sin repetir.

--12. Se quiere cambiar el formato de los resultados de los partidos, se quiere que en lugar de ser 01-00, se muestre 1-0.

--13. ¿Cuántos goles en total se han marcado hasta ahora?
 
