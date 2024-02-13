--Tareas de repaso con join
--ESTRUCTURA JOIN siempre JOIN NOMBRETABLA ON CONDICION

--1. Indica el nombre de los futbolistas y el nombre del equipo en el que juegan
select * from equipos;
select * from futbolistas;
select futbolistas.nombre, equipos.nombre from futbolistas join equipos on futbolistas.id_equipo = equipos.id;

--2. �Cu�l es el nombre del equipo donde juega el jugador m�s alto?
select equipos.nombre from futbolistas join equipos on equipos.id = futbolistas.id_equipo where altura = (select max (altura) from futbolistas);

-- �C�mo se llama el jugador m�s alto?
select nombre from futbolistas where altura = (select max (altura) from futbolistas);
-- �Cu�nto mide el jugador m�s alto?
select max (altura) from futbolistas;

--3. Utiliza UNION para mostrar el nombre de los futbolistas del equipo A, y los del equipo B.

--4. �Cu�ntos futbolistas han nacido antes de 1995?

--5. Devuelve una lista agrupada por posici�n y n�mero de jugadores que juegan en dicha posici�n. POSICION NUM_JUGADORES Ej.: MEDIOCENTRO 3 DEFENSA 2 PORTERO 1

--6. �Cu�ntos partidos se han jugado en enero?

--7. Devuelve una lista agrupada con los nombres de los equipos y el salario medio de los futbolistas de dichos equipos.

--8. �Cu�ntos meses han pasado entre el primer partido disputado y el �ltimo partido jugado?

--9. Se quiere el nombre y los apellidos de los futbolistas y tengan un salario superior a 130000. Debe devolverse una �nica columna con este formato: apellidos, nombre (todo en min�sculas)

--10. Devuelve el nombre del estadio, junto al nombre del �rbitro (la primera letra en may�sculas y el resto en min�sculas para ambos campos) de aquellos partidos que se hayan jugado en domingo.

--11. Devuelve el nombre de los �rbitros sin repetir.

--12. Se quiere cambiar el formato de los resultados de los partidos, se quiere que en lugar de ser 01-00, se muestre 1-0.

--13. �Cu�ntos goles en total se han marcado hasta ahora?
 
