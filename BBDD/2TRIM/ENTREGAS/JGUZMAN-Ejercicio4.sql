--Ejercicio semanal 4

--1. ¿Cuántos partidos ha jugado como local EQUIPO A? Debes usar el campo nombre de equipos.
select count(*) from PARTIDOS where ID_EQUIPO_CASA = (select ID from EQUIPOS where NOMBRE = 'EQUIPO A');

--2. ¿Cuál es el nombre del equipo en el que juega el futbolista de menor peso?
select NOMBRE from EQUIPOS where ID = (select ID_EQUIPO from FUTBOLISTAS where FUTBOLISTAS.PESO = (select min(PESO) from FUTBOLISTAS));

--3. Devuelve en una única columna la fase: El futbolista NOMBRE juega en el equipo NOMBRE, correspondiendo al campo nombre de futbolista y de equipo
select concat(concat('El futbolista ',NOMBRE),concat(' juega en el equipo ',(select NOMBRE from EQUIPOS where ID = ID_EQUIPO))) from FUTBOLISTAS;