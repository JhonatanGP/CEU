select * from dept;
select * from emp;
--1.Obtener el nombre de todos los departamentos en min�sculas.
select lower(DNAME)from DEPT;

--2.Seleccionar todos los datos de la tabla empleados (todas las columnas).
select * from emp;

--3.Devuelve ename, job, sal y comm de los empleando usando los siguientes alias de columnas: nombre, puesto, salario y comisi�n.
select ename"Nombre", job "Puesto",sal"Salario",comm"Comision" from emp;

--4.Calcula cu�ntas semanas completas(lunes-domingo)ha trabajado cada empleado,y devuelve dicho valor y el nombre del empleado.Que no tenga decimales
select floor((sysdate-hiredate)/7) "Semanas completas trabajadas",ename from emp;
--5.Calcular el sueldo neto de cada empleado, y la retencion iRPF mensual, sabiendo que la retenci�n es del 19% para el sueldo y de un 10% de la 
--comisi�n.(redondear a 2 decimales). Si el empleado no tiene comisi�n, se debe mostrar el valor 0.
select round (decode(comm,null,0,(sal*0.90))||(sal*0.81),2) from emp;

--6.Hacer un listado de empleados (nombre y salario) con sueldo superior a 1000.
select ename,sal from emp where sal>1000;

--7.Hacer un listado de empleados (nombre, puesto, sueldo, comision) que tengan puesto igual a CLERK.
select ename,job,sal,comm from emp where job = 'CLERK';

--8.Hacer un listado de empleados (nombre, puesto, sueldo, comision) que tengan puesto distinto a CLERK.
select ename,job,sal,comm from emp where job != 'CLERK';

--9.Hacer un listado de empleados (nombre, puesto, sueldo, comision) que tengan puesto distinto a CLERK y sueldo superior a 1500.
select ename,job,sal,comm from emp where job != 'CLERK' and sal > 1500;

--10.Hacer un listado de empleados (nombre, puesto, sueldo, comision) que tengan asignada comisi�n.
select ename,job,sal,comm from emp where comm > 0;

--11.Hacer un listado de empleados (nombre, puesto, sueldo, comision) que NO tengan asignada comisi�n.
select ename,job,sal,comm from emp where comm is null;

--12.Seleccionar los empleados cuyo nombre empieza por 'A'.
select ename from emp where ename like 'A%';

--13.Seleccionar los empleados cuyo nombre tienen una A en cualquier posici�n.
select ename from emp where ename like '%A%';

--14.Seleccionar los empleados cuyo nombre no contiene ninguna 'A'.
select ename from emp where INSTR(ename, 'A') = 0;

--15.Seleccionar los empleados cuyo nombre empieza por una vocal.
select * from emp where ename like 'A%' or ename like 'E%' or ename like 'I%' or ename like '0%' or ename like 'U%';

--16.Seleccionar los empleados con sueldo entre 1000 y 2000 (ambos inclusive).
select * from emp where sal >= 1000 and sal <= 2000;

--17.Seleccionar los empleados con sueldo igual a 1000, 2000, 3000, 4000 o 5000.
select * from emp where sal = 1000 or sal = 2000 or sal = 3000 or sal = 4000 or sal = 5000;

--18.Seleccionar los empleados cuyo nombre comienza por A,B,C,J,K,M.
select * from emp where ename like 'A%' or ename like 'B%' or ename like 'C%' or ename like 'J%' or ename like 'K%' or ename like 'M%';

--19.Seleccionar los empleados cuyo sueldo es la 5000/2 + 500 o 5000-1000.
select * from emp where sal = (5000/2 + 500) or sal = 5000-1000;

--20.Seleccionar los empleados cuyo sueldo es la 5000/2 + 500 ,5000-1000 o el salario m�ximo de todos los empleados.
select * from emp where sal = (5000/2 + 500) or sal = 5000-1000 or sal = ( select max(sal)from emp);

--21.Seleccionar nombre, sueldo y sueldo formateado (ej.: 1,000.00) de todos los empleados. Se puede usar las m�scaras de to_number en to_char.
select ename, sal, to_char(sal,'9999.99') "sueldo formateado" from emp;

--22.Seleccionar nombre, sueldo y sueldo formateado con el simbolo 'D�lar' (ej.: $1,000.00) de todos los empleados. Se puede usar las m�scaras de 
--to_number en to_char.
select ename, sal, to_char(sal, '$' || '9999.99') "sueldo formateado" from emp;

--23.Seleccionar nombre, sueldo y sueldo formateado con el simbolo 'Euro' (ej.: 1,000.00� de todos los empleados. Se puede usar las m�scaras de 
--to_number en to_char.
select ename, sal, to_char(sal, '9999.99L') "sueldo formateado" from emp;

--24.Seleccionar la fecha del sistema (d�a, mes, a�o, horas (24):minutos:segundos).
select sysdate from dual;

--25.Seleccionar la fecha del sistema (nombre del d�a, d�a, nombre del mes, a�o, horas (24):minutos:segundos). No debe haber espacios sobrantes en
select trim(to_char(sysdate,'DAY')), to_char(sysdate,'DD'),replace(to_char(sysdate,'MONTH'),' ') , to_char(sysdate,'YYYY'), to_char(sysdate,'hh24:mm:ss') from dual; 

--26.Seleccionar la fecha del d�a 1 de enero de 2005,med�ante una tira de caracteres y su m�scara de formato(ej: 01012021 ser�a el 1 de enero de 2021)
select to_date('01012005') from dual;

--27.Calcular el n�mero de d�as vividos hasta hoy por una persona nacida el d�a 3 de julio de 1970.
select trunc(sysdate - to_date('03-07-1970','dd,mm,yyyy')) "dias vividos" from dual;

--28.Calcular el n�mero de segundos transcurridos desde la �ltima medianoche (m�scara 'sssss' en to_char).
select to_char(sysdate, 'sssss') "segundos" from dual;

--29.Calcular el n�mero horas completas transcurridas desde la �ltima medianoche.
select to_char(sysdate, 'hh24') "horas desde ult. mdeia noche" from dual;

--30.Calcular el n�mero de meses transcurridos entre la fecha de contrataci�n de cada empleado y hoy.
select months_between(sysdate,hiredate) from emp;
