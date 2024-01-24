--Ejercicio 1
--futbolista m�s alto
select * from futbolistas;
select * from futbolistas order by altura;
select nombre from futbolistas where altura = 189;
select max (altura) from futbolistas;
select nombre from futbolistas where altura = (select max (altura) from futbolistas); --subconsulta --infinito

--Indica los apellidos del futbolista m�s delgado.
select min(peso) from futbolistas; -- Peso: 60kg y debes usar concat()
select concat('peso: ',concat(min(peso),' kg')) from futbolistas;
select apellidos from futbolistas where peso = (select min(peso) from futbolistas);
--�Cuantos  futbolistas miden entre 1,75 y 1,82?
select count (*) from futbolistas where altura between 175 and 182;
--sin between
select count (*) from futbolistas where altura >= 175 and altura <= 182;
--�Cu�l es la media de altura de los futbolistas con dos decimales?
select round(avg(altura),2) from futbolistas;
--�Cu�l es la media de peso de los futbolistas con un decimal?
select round(avg(peso),1) from futbolistas;

--Ejercicio 2
--�Cu�l es el futbolista que cobra m�s dinero?
select nombre from futbolistas where salario = (select max(salario) from futbolistas);
--�En qu� a�o naci� el futbolista que cobra menos dinero?
--�En qu� a�o naci� el futbolista que cobra menos dinero?
select to_char(fecha_nacimiento,'yyyy') from futbolistas where salario = (select min(salario) from futbolistas);
select extract(year from fecha_nacimiento) from futbolistas where salario = (select min(salario) from futbolistas);

--Ejercicio 3
--Calcula la media del sueldo de los futbolistas (con dos decimales) agrupado por la posici�n que ocupan.
select posicion, trunc(avg(salario),2) from futbolistas group by posicion;
--Obt�n el n�mero de futbolistas en cada equipo.
select id_equipo equipo,count(*) "total de futbolistas" from futbolistas group by id_equipo;
--Obt�n ahora el n�mero de futbolistas de cada equipo cuyo ID sea 1 o 2.
select id_equipo,count(*) from futbolistas group by id_equipo having id_equipo = 1 or id_equipo = 2; --in...

