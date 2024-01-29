--PDF 3.MULTITABLAS 29/01/24
--1. Realiza una composición interna entre la tabla partidos y la tabla equipos.
SELECT * FROM EQUIPOS,PARTIDOS;
SELECT * FROM EQUIPOS,PARTIDOS WHERE ID_EQUIPO_CASA = EQUIPOS.ID;

--2.Muestra los datos de los nombres de los futbolistas junto al nombre de su equipo.
SELECT * FROM FUTBOLISTAS;
SELECT * FROM EQUIPOS;
SELECT FUTBOLISTAS.NOMBRE "FUTBOLISTA",EQUIPOS.NOMBRE "EQUIPO" FROM FUTBOLISTAS, EQUIPOS WHERE FUTBOLISTAS.ID_EQUIPO = EQUIPOS.ID;

--3Incluye un nuevo equipo en la tabla EQUIPOS. Obtén un listado de los equipos y jugadores que pertenecen a estos (nombre de equipo, nombre de jugador y posición).

--4.Muestra el nombre de los futbolistas seguido del nombre del equipo en el que juega utilizando CROSS JOIN.
SELECT * FROM FUTBOLISTAS CROSS JOIN EQUIPOS;
--5.Muestra el nombre de los futbolistas seguido del nombre del equipo en el que juega utilizando JOIN … USING.
SELECT * FROM EMP NATURAL JOIN DEPT;
--6. Muestra el nombre de los futbolistas seguido del nombre del equipo en el que juega utilizando JOIN … ON
SELECT FUTBOLISTAS.NOMBRE, EQUIPOS.NOMBRE FROM ;
-- MI PRIMER JOIN
INSERT INTO futbolistas VALUES ('F11120','NOMBRE','APELL',null,'PORTERO',3000000,null,180,83);
INSERT INTO equipos VALUES (4,'REAL BETIS BALOMPIE','BENITO VILLAMARIN',80000000);
SELECT * FROM FUTBOLISTAS;
SELECT * FROM EQUIPOS;

SELECT * 
        FROM FUTBOLISTAS
        LEFT JOIN EQUIPOS
        ON FUTBOLISTAS.ID_EQUIPO = EQUIPOS.ID;
        

SELECT * 
        FROM FUTBOLISTAS
        RIGHT JOIN EQUIPOS
        ON FUTBOLISTAS.ID_EQUIPO = EQUIPOS.ID;

SELECT * 
        FROM EQUIPOS
        FULL OUTER JOIN FUTBOLISTAS
        ON FUTBOLISTAS.ID_EQUIPO = EQUIPOS.ID;

--EJERCICIO 8 Obtén el nombre, apellidos y nombre del equipo de los futbolistas que sean defensas.
select f.nombre,f.apellidos,e.nombre from futbolistas f join equipos e on f.id_equipo = e.id where f.posicion = 'DEFENSA';
select futbolistas.nombre,futbolistas.apellidos,equipos.nombre from futbolistas join equipos on futbolistas.id_equipo = equipos.id where futbolistas.posicion = 'DEFENSA';


