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

--30/01/24
/*LIKE SOLO USARLO PARA EXPRESINOES REGULARES
 = PARA CUALQUIER COMPARACIÓN, IGUALDAD, ETC.
 POSICION = 'DELANTERO', SALARIO = 1500000
 
 IN SE EMPLEA PARA AHORRAR OR
 POSICION IN ('DELANTERO','PORTERO','MEDIOCENTRO','DEFENSA') EN 
*/
--like solo usarlo para expresiones regulares
-- % _
 
--= para cualquier comparación, igualdad, etc.
--posicion = 'DELANTERO', salario = 1500000
 
--in se emplea para ahorrar OR
--posicion in ('DELANTERO','PORTERO','MEDIOCENTRO','DEFENSA') en lugar posicion = 'DELANTERO' OR posicion = 'PORTERO' or etc.

select * from futbolistas;
select * from futbolistas where salario > 1500000;
select * from futbolistas where posicion = 'PORTERO';

select nombre,apellidos from futbolistas; --2024 hay 8 futbolistas
select nombre,apellidos from futbolistas_2023; --2023 hay 7 futbolistas
select nombre, apellidos from futbolistas union 
select nombre,apellidos from futbolistas_2023; -- hay 12 futbolistas
 
select nombre, apellidos from futbolistas intersect
select nombre,apellidos from futbolistas_2023; -- hay 3 futbolistas
 
select nombre, apellidos from futbolistas minus
select nombre,apellidos from futbolistas_2023; -- hay 5 futbolistas

--otro
select nombre,apellidos from futbolistas; --2024 hay 8 futbolistas
--NOMBRE | PEDRO LUIS | LUIS | JESUS | DIEGO | PABLO | ESTEBAN | ENRIQUE
select nombre,apellidos from futbolistas_2023; --2023 hay 7 futbolistas
--PEDRO LUIS | LUIS | JESUS | PABLO | PABLO | PEPE | LUIS ANTONIO
 
select nombre, apellidos from futbolistas union 
select nombre,apellidos from futbolistas_2023; -- hay 12 futbolistas
 
select nombre, apellidos from futbolistas intersect
select nombre,apellidos from futbolistas_2023; -- hay 3 futbolistas
 
select nombre, apellidos from futbolistas minus
select nombre,apellidos from futbolistas_2023; -- hay 5 futbolistas
select nombre, apellidos from futbolistas_2023 minus
select nombre,apellidos from futbolistas; -- hay 4 futbolistas.

--REPASO
--1. Indica el nombre y sueldo de los empleados que pertenezcan al departamento ubicado en Seatle.
 select * from emp;
 select * from dept;
  select * from emp cross join dept;
 select * from emp inner join dept on emp.deptno = dept.deptno;
 --solución
 select emp.ename, emp.sal from emp inner join dept on emp.deptno = dept.deptno where dept.loc = 'DALLAS';
--2. Indica el id, nombre y sueldo de los empleados que estén en departamentos donde haya otros compañeros empleados con una letra 'u' en su nombre, y que además ganen sueldos 
--mayores que la media de los sueldos de la empresa.
select * from emp;
select deptno from emp where ename like '%U%';
select empno,ename,sal from emp where deptno = (select deptno from emp where ename like '%U%') and sal > (select avg(sal) from emp);
--3. Devuelve el id del departamento, nombre y puesto de los empleados que pertenezcan al departamento Executive.
select * from emp join dept on dept.deptno = emp.deptno where dname = 'SALES';
select dept.deptno,emp.ename,emp.job from emp join dept on dept.deptno = emp.deptno where dname = 'SALES';

--4. Muestra el nombre y salario de los empleados que tengan a KING como jefe directo.
select ename, sal from emp where mgr = (select empno from emp where ename = 'KING');
 --4.1
select ename, sal from emp where deptno = (select deptno from emp where ename = 'KING') and mgr is not null;
--5. Devuelve el nombre y sueldo de los empleados que ganen más dinero que la media de la empresa, ordenado por sueldo de mayor a menor.
select emp.ename,emp.sal from emp where sal > (select avg(sal) from emp) order by sal desc;

-- 1. Mostrar los nombres de los empleados que tengan un salario mayor que el de JAMES.
select ename from emp where sal > (select sal from emp where ename = 'JAMES');
-- 2. Mostrar los nombres de los empleados que trabajan en el mismo departamento que SMITH. Ordena el resultado.
select ename from emp where deptno = (select deptno from emp where ename = 'SMITH') and ename != 'SMITH' order by ename desc;
-- 5. Mostrar qué empleados del departamento donde trabaja FORD, ganan más que lo que gana JAMES.
select * from emp where deptno = (select deptno from emp where ename = 'FORD') and sal > (select sal from emp where ename = 'JAMES');
-- 7. ¿Cuántos empleados ganan menos que MILLER?
select count(*) from emp where sal < (select sal from emp where ename = 'MILLER');
--34 Calcular cuanto deberia haber cobrado cada empleado en  su primer año de trabajo( desde la fecha de contrato hasta el 31 Dic de ese año)
select ename,round(months_between (to_date('31/12/' || to_char(hiredate,'yyyy')),hiredate) * sal,2) "Cuantia a cobrar el primer año" from emp;

select ename,round(months_between(to_date('31/12/' || to_char(hiredate,'yyyy')),hiredate)*sal,2) 
    "Cuantía a cobrar el primer año" 
    from emp;



