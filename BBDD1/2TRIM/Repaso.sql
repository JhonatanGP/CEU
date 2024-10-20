--EXAMEN PRUEBA PAPEL
--1.¿Cuántos productos son del tipo ELECTRICO?
select count(*) from productos where tipo = 'ELECTRICO'; 
select count(CAMPO) from productos where tipo = 'ELECTRICO';
--2.Indica el nombre y el tipo de los productos cuyo precio es entre 100 y 200 euros (utiliza BETWEEN).
select nombre, tipo from productos where precio between 100 and 200;
--3.¿Cuál es el precio medio (AVG) de los productos cuyo nombre acaba en la letra O?
select avg(precio) from productos where nombre like '%O';
--4.Indica solo el nombre (sin el apellido) de los clientes cuyo apellido acaba en EZ.
select substr(nombre,1,instr(nombre,' ')) from clientes where nombre like '%EZ';
--5.¿Cuál es la suma total de las ventas de productos hasta ahora?
select sum(precio) from compras join productos on id = id_pr;
select sum(precio) from productos join compras on id = id_pr;
--6.Indica el nombre del producto más caro del tipo PERCURSION.
select nombre from productos where precio = (select max(precio) from productos where tipo = 'PERCUSION');
 
--REPASO JOIN, SUBCONSULTAS Y VARIOS
-- 1. Mostrar todos los datos de los empleados de aquellos que trabajan en el mismo departamento que SCOTT, ganen más que lo que gana SMITH y tenga el mismo oficio que MILLER.
 select * from emp;--Para ver que datos vamos a tratar
 select * from emp 
    where deptno = (select deptno from emp where ename = 'SCOTT') 
        and sal > (select sal from emp where ename = 'SMITH')
        and job = (select job from emp where ename = 'MILLER');
    
-- 2. Mostrar nombre y el salario de los empleados que trabajan en el mismo departamento que FORD y tengan su mismo sueldo. Ordenar primero por el nombre ascendentemente y luego por el salario descendentemente.
select ename,sal from emp
    where deptno = (select deptno from emp where ename = 'FORD')
    and sal = (select sal from emp where ename = 'FORD')
    order by ename,sal desc;
-- 3. Obtener el nombre del futbolista más mayor que jugó en el equipo de casa el 01/01/20 y el nombre de su equipo.
select futbolistas.nombre,equipos.nombre 
    from partidos join equipos on equipos.id = partidos.id_equipo_casa 
    join futbolistas on futbolistas.id_equipo = equipos.id
    where fecha = '01/01/2020' and fecha_nacimiento = (select min(fecha_nacimiento) 
        from partidos 
            join equipos on equipos.id = partidos.id_equipo_casa 
            join futbolistas on futbolistas.id_equipo = equipos.id
            where fecha = '01/01/20');
-- 4. Obtener los apellidos del futbolista de menor edad que jugó en el equipo de fuera el 08/01/20 y el nombre de su equipo.
select futbolistas.apellidos,equipos.nombre 
    from partidos join equipos on equipos.id = partidos.id_equipo_fuera 
    join futbolistas on futbolistas.id_equipo = equipos.id
    where fecha = '08/01/2020' and fecha_nacimiento = (select max(fecha_nacimiento) 
        from partidos 
            join equipos on equipos.id = partidos.id_equipo_fuera 
            join futbolistas on futbolistas.id_equipo = equipos.id
            where fecha = '08/01/2020');
-- 5. Devuelve el equipo y resultado del partido jugado el 15/01/20 con este formato "EQUIPO A 00-00 EQUIPO B" en una única columna.
SELECT * FROM partidos;
SELECT ecasa.nombre || ' ' || resultado || ' ' || efuera.nombre "Partido disputado" FROM partidos
    JOIN equipos ecasa on id_equipo_casa = ecasa.id
    JOIN equipos efuera on id_equipo_fuera = efuera.id
    WHERE fecha = '15/01/2020';
-- 6. ¿En qué ciudad trabaja el empleado que más cobra de la empresa?
select loc from emp join dept on dept.deptno = emp.deptno where sal = (select max(sal) from emp);
-- 7. ¿Cómo se llama el departamento del empleado que tiene menor salario?
select dname from emp join dept on dept.deptno = emp.deptno where sal = (select min(sal) from emp);
-- 8. ¿Cómo se llama el futbolista de más altura que jugó el día 22/01/20?
select futbolistas.nombre from futbolistas where id_equipo = (select id_equipo_casa from partidos where fecha = '22/01/20') or
    id_equipo = (select id_equipo_fuera from partidos where fecha = '22/01/20')
    and altura = (select max(altura) from futbolistas where id_equipo = (select id_equipo_casa from partidos where fecha = '22/01/20') or
    id_equipo = (select id_equipo_fuera from partidos where fecha = '22/01/20'));
-- 9. Se quiere saber el nombre del departamento y el nombre del empleado que tiene comisión y esta es mayor de 500

--10. Devuelve el nombre del empleado y el nombre del departamento de aquel que haya sido contratado antes en el año 1981.

--11. Devuelve el nombre del empleado junto al nombre de su jefe con este formato en una columna: "El jefe de SMITH es JACOB".

--12. Devuelve el nombre del departamento que tiene más trabajadores junto al número de trabajadores.
