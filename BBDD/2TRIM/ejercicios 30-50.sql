create table dept(
  deptno number(2,0),
  dname  varchar2(14),
  loc    varchar2(13),
  constraint pk_dept primary key (deptno)
);
 
create table emp(
  empno    number(4,0),
  ename    varchar2(10),
  job      varchar2(9),
  mgr      number(4,0),
  hiredate date,
  sal      number(7,2),
  comm     number(7,2),
  deptno   number(2,0),
  constraint pk_emp primary key (empno),
  constraint fk_deptno foreign key (deptno) references dept (deptno)
);

insert into dept
values(10, 'ACCOUNTING', 'NEW YORK');
insert into dept
values(20, 'RESEARCH', 'DALLAS');
insert into dept
values(30, 'SALES', 'CHICAGO');
insert into dept
values(40, 'OPERATIONS', 'BOSTON');
 
insert into emp
values(
 7839, 'KING', 'PRESIDENT', null,
 to_date('17-11-1981','dd-mm-yyyy'),
 5000, null, 10
);
insert into emp
values(
 7698, 'BLAKE', 'MANAGER', 7839,
 to_date('1-5-1981','dd-mm-yyyy'),
 2850, null, 30
);
insert into emp
values(
 7782, 'CLARK', 'MANAGER', 7839,
 to_date('9-6-1981','dd-mm-yyyy'),
 2450, null, 10
);
insert into emp
values(
 7566, 'JONES', 'MANAGER', 7839,
 to_date('2-4-1981','dd-mm-yyyy'),
 2975, null, 20
);
insert into emp
values(
 7788, 'SCOTT', 'ANALYST', 7566,
 to_date('13-JUL-87','dd-mm-rr') - 85,
 3000, null, 20
);
insert into emp
values(
 7902, 'FORD', 'ANALYST', 7566,
 to_date('3-12-1981','dd-mm-yyyy'),
 3000, null, 20
);
insert into emp
values(
 7369, 'SMITH', 'CLERK', 7902,
 to_date('17-12-1980','dd-mm-yyyy'),
 800, null, 20
);
insert into emp
values(
 7499, 'ALLEN', 'SALESMAN', 7698,
 to_date('20-2-1981','dd-mm-yyyy'),
 1600, 300, 30
);
insert into emp
values(
 7521, 'WARD', 'SALESMAN', 7698,
 to_date('22-2-1981','dd-mm-yyyy'),
 1250, 500, 30
);
insert into emp
values(
 7654, 'MARTIN', 'SALESMAN', 7698,
 to_date('28-9-1981','dd-mm-yyyy'),
 1250, 1400, 30
);
insert into emp
values(
 7844, 'TURNER', 'SALESMAN', 7698,
 to_date('8-9-1981','dd-mm-yyyy'),
 1500, 0, 30
);
insert into emp
values(
 7876, 'ADAMS', 'CLERK', 7788,
 to_date('13-JUL-87', 'dd-mm-rr') - 51,
 1100, null, 20
);
insert into emp
values(
 7900, 'JAMES', 'CLERK', 7698,
 to_date('3-12-1981','dd-mm-yyyy'),
 950, null, 30
);
insert into emp
values(
 7934, 'MILLER', 'CLERK', 7782,
 to_date('23-1-1982','dd-mm-yyyy'),
 1300, null, 10
);
 
 
commit;


--1. Obtener el nombre de todos los departamentos en minúsculas.

select lower(dname) "nombre" from dept;

--2. Seleccionar todos los datos de la tabla empleados (todas las columnas).

select * from emp;

--3. Devuelve ename, job, sal y comm de los empleando usando los siguientes alias de columnas: nombre, puesto, salario y comisión.

select ename "nombre", job "puesto", sal "salario", comm "comisión" from emp;

--4. Calcula cuántas semanas completas (de lunes a domingo) ha trabajado cada empleado, y devuelve dicho valor y el nombre del empleado.

select trunc(months_between(sysdate,hiredate)*4) "semanas trabajadas", ename from emp;

--5. Calcular el sueldo neto de cada empleado, y la retencion iRPF mensual, sabiendo que la retención es del 19% para el sueldo 
--y de un 10% de la comisión, (redondear a 2 decimales). Si el empleado no tiene comisión, se debe mostrar el valor 0.

select ename, (sal*0.81), (comm * 0.90) from emp where;

--6. Hacer un listado de empleados (nombre y salario) con sueldo superior a 1000.

select ename, sal from emp where sal > 1000;

--7. Hacer un listado de empleados (nombre, puesto, sueldo, comision) que tengan puesto igual a CLERK.

select ename, job, sal, comm from emp where job = 'CLERK';

--8. Hacer un listado de empleados (nombre, puesto, sueldo, comision) que tengan puesto distinto a CLERRK.

select ename, job, sal, comm from emp where job != 'CLERK';

--9. Hacer un listado de empleados (nombre, puesto, sueldo, comision) que tengan puesto distinto a CLERK y sueldo superior a 1500.

select ename, job, sal, comm from emp where job != 'CLERK' and sal > 1500;

--10. Hacer un listado de empleados (nombre, puesto, sueldo, comision) que tengan asignada comisión.

select ename, job, sal, comm from emp where comm > 0;

--11. Hacer un listado de empleados (nombre, puesto, sueldo, comision) que NO tengan asignada comisión.

select ename, job, sal, comm from emp where comm is null;


--12. Seleccionar los empleados cuyo nombre empieza por 'A'.

select * from emp where ename like 'A%';


--13. Seleccionar los empleados cuyo nombre tienen una A en cualquier posición.

select * from emp where ename like '%A%';


--14. Seleccionar los empleados cuyo nombre no contiene ninguna 'A'.

select * from emp where instr(ename, 'A') > 0;


--15. Seleccionar los empleados cuyo nombre empieza por una vocal.

select * from emp where ename like 'A%' or ename like 'E%' or ename like 'I%' or ename like '0%' or ename like 'U%';

--16. Seleccionar los empleados con sueldo entre 1000 y 2000 (ambos inclusive).

select * from emp where sal <= 2000 and sal >= 1000;

--17. Seleccionar los empleados con sueldo igual a 1000, 2000, 3000, 4000 o 5000.

select * from emp where sal = 1000 or sal = 2000 or sal = 3000 or sal = 4000 or sal = 5000;

--18. Seleccionar los empleados cuyo nombre comienza por A,B,C,J,K,M.

select * from emp where ename like 'A%' or ename like 'B%' or ename like 'C%' or ename like 'J%' or ename like 'K%' or ename like 'M%';

--19. Seleccionar los empleados cuyo sueldo es la 5000/2 + 500 o 5000-1000.

select * from emp where sal = (5000/2 + 500) or sal = 5000-1000;

--20. Seleccionar los empleados cuyo sueldo es la 5000/2 + 500 ,5000-1000 o el salario máximo de todos los empleados.

select * from emp where sal = (5000/2 + 500) or sal = 5000-1000 or sal = ( select max(sal)from emp);

--21. Seleccionar nombre, sueldo y sueldo formateado (ej.: 1,000.00) de todos los empleados. Se puede usar las máscaras de to_number en to_char.

select ename, sal, to_char(sal,'9999.99') "sueldo formateado" from emp;

--22. Seleccionar nombre, sueldo y sueldo formateado con el simbolo 'Dólar' (ej.: $1,000.00) de todos los empleados. Se puede usar las máscaras de to_number en to_char.

select ename, sal, to_char(sal, '$' || '9999.99') "sueldo formateado" from emp;

--23. Seleccionar nombre, sueldo y sueldo formateado con el simbolo 'Euro' (ej.: 1,000.00€ de todos los empleados. Se puede usar las máscaras de
--to_number en to_char.

select ename, sal, to_number(sal, '9999.99L') "sueldo formateado" from emp;

--24. Seleccionar la fecha del sistema (día, mes, año, horas (24):minutos:segundos).

select sysdate from dual;

--25. Seleccionar la fecha del sistema (nombre del día, día, nombre del mes, año, horas (24):minutos:segundos). No debe haber espacios sobrantes en el nombre del día o del mes.

select
    trim(to_char(sysdate, 'DAY')), 
    to_char(sysdate, 'DD'), 
    replace(to_char(sysdate, 'MONTH'), ' ') , 
    to_char(sysdate, 'YYYY'), 
    to_char(sysdate, 'hh24:mm:ss') 
    from dual; 
--26. Seleccionar la fecha del día 1 de enero de 2005, medíante una tira de caracteres y su máscara de formato (ej.: 01012021).

select to_date('01012005') from dual;


--27. Calcular el número de días vividos hasta hoy por una persona nacida el día 3 de julio de 1970.

select trunc(sysdate - to_date('03-07-1970','dd,mm,yyyy')) "dias vividos" from dual;

--28. Calcular el número de segundos transcurridos desde la última medianoche (máscara 'sssss' en to_char).

select to_char(sysdate, 'sssss') "segundos" from dual;

--29. Calcular el número horas completas transcurridas desde la última medianoche.

select to_char(sysdate, 'hh24') "horas desde ult. mdeia noche" from dual;

--30. Calcular el número de meses transcurridos entre la fecha de contratación de cada empleado y hoy.

select months_between(sysdate,hiredate) from emp;


--31. Calcular el último dia del mes (fecha) del mes actual.

select last_day(sysdate) from dual;

--32. Calcular el último dia del mes (fecha) del mes actual, con horas, minutos y segundos.

select last_day(sysdate) from dual;

--33. Calcular en qué MES (cifras) se ha contratado cada empleado.

select ename, to_char(hiredate, 'mm') "mes contratado" from emp;

--34. Calcular cuanto debería haber cobrado cada empleado en su primer año de trabajo (desde la fecha de contrato hasta el 31 de diciembre de ese año).

select ename, sal * months_between(to_date('31-12-' || extract(year from hiredate),'dd-mm-yyyy'), hiredate) "salario primer año"
from emp;

--35. Cuantos oficios distintos hay en la tabla de empleados.

select count(distinct job) from emp;

--36. Calcular el IRPF de cada empleado, teniendo en cuenta que para los 'CLERK' se les retiene un 15%, y a los 'ANALYST" un 20%. Al resto se les retiene un 19%.

select ename, decode(job,
'CLERK', sal*0.15,
'ANALYST', sal*0.20,
sal*0.19) 
from emp;


--37. Efectuar una propuesta de aumento salarial: Para los empleados del Dept. 10 un 5%, Dept. 20 un 7%, Dept 30 un 8% y al resto un 3% del salario.

select ename, decode(sal,
'10', sal*1.05,
'20', sal*1.07,
'30', sal*1.08,
sal*1.03) from emp;

--38. Listar los nombres de los empleados, identificando como 'Vendedor' si cobra comisión, y 'No vendedor' si no la cobra.

select ename nvl(comm, 'no vendedor', 'vendedor') form emp;

--39. Calcular cuánto se paga mensualmente a todos los empleados.

select sum(sal) from emp; 

--40. Calcular cuantos empleados hay.

select count(ename) from emp;

--41. Calcular el sueldo medio de todos los empleados.

select round(avg(sal),2) from emp;

--42. Calcular la comisión media de todos los empleados (teniendo en cuenta aquellos que no tienen comisión).

select round((sum(comm)/count(ename)),2) from emp;

--43. Calcular la comisión media de los empleados que sí tienen comisión.

select round(avg(comm),2) from emp;

--44. Calcular la suma de los sueldos de los empleados del Departamento 20.

select sum(sal) from emp where deptno = 20;

--45. Calcular el sueldo medio de los empleados que pertenezcan al Dept 10 o 30.

select round(avg(sal),2) from emp where deptno = 10 or deptno = 30;

--46. Calcular la suma de sueldos que se pagan en cada uno de los departamentos 10 y 30 (por separado).

select sum(sal) "salario dept 10 y 30" from emp where deptno in (10, 30) group by deptno;
--47. Calcular cuantos empleados se han contratado cada año.

select extract(year form hiredate), count(ename) from emp;

--48. Calcular el sueldo máximo y mínimo de cada departamento.

 select min(sal), max(sal) from emp group by deptno;

--49. Calcular cuanto se gana de media por cada oficio. Redondear a 2 decimales.

select round(avg(sal), 2), job from emp group by job;

--50. Cuántos dias de vacaciones correspondieron a cada empleado el primer año de trabajo (contando 1 día por semana entera trabajada).

select floor( (to_date('31-12-' || to_char(hiredate, 'yyyy')) - hiredate) / 7) from emp;




























