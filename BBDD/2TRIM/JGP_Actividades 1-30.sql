select * from emp;
--1. Obtener el nombre de todos los departamentos en min�sculas.
select lower(DNAME)from DEPT;
--2. Seleccionar todos los datos de la tabla empleados (todas las columnas).
select 
--3. Devuelve ename, job, sal y comm de los empleando usando los siguientes alias de columnas: nombre, puesto, salario y comisi�n.

--4. Calcula cu�ntas semanas completas (de lunes a domingo) ha trabajado cada empleado, y devuelve dicho valor y el nombre del empleado. Que no tenga decimales
select (sysdate-hiredate)/7,ename from emp; --o 
select floor((sysdate-hiredate)/7) "semanas completas trabajadas",ename from emp;-- best option

--5. Calcular el sueldo neto de cada empleado, y la retencion iRPF mensual, sabiendo que la retenci�n es del 19% para el sueldo y de un 10% de la comisi�n, (redondear a 2 decimales). 
--Si el empleado no tiene comisi�n, se debe mostrar el valor 0.

--6. Hacer un listado de empleados (nombre y salario) con sueldo superior a 1000.

--7. Hacer un listado de empleados (nombre, puesto, sueldo, comision) que tengan puesto igual a CLERK.

--8. Hacer un listado de empleados (nombre, puesto, sueldo, comision) que tengan puesto distinto a CLERK.

--9. Hacer un listado de empleados (nombre, puesto, sueldo, comision) que tengan puesto distinto a CLERK y sueldo superior a 1500.

--10. Hacer un listado de empleados (nombre, puesto, sueldo, comision) que tengan asignada comisi�n.

--11. Hacer un listado de empleados (nombre, puesto, sueldo, comision) que NO tengan asignada comisi�n.

--12. Seleccionar los empleados cuyo nombre empieza por 'A'.

--13. Seleccionar los empleados cuyo nombre tienen una A en cualquier posici�n.

--14. Seleccionar los empleados cuyo nombre no contiene ninguna 'A'.

--15. Seleccionar los empleados cuyo nombre empieza por una vocal.

--16. Seleccionar los empleados con sueldo entre 1000 y 2000 (ambos inclusive).

--17. Seleccionar los empleados con sueldo igual a 1000, 2000, 3000, 4000 o 5000.

--18. Seleccionar los empleados cuyo nombre comienza por A,B,C,J,K,M.

--19. Seleccionar los empleados cuyo sueldo es la 5000/2 + 500 o 5000-1000.

--20. Seleccionar los empleados cuyo sueldo es la 5000/2 + 500 ,5000-1000 o el salario m�ximo de todos los empleados.

--21. Seleccionar nombre, sueldo y sueldo formateado (ej.: 1,000.00) de todos los empleados. Se puede usar las m�scaras de to_number en to_char.

--22. Seleccionar nombre, sueldo y sueldo formateado con el simbolo 'D�lar' (ej.: $1,000.00) de todos los empleados. Se puede usar las m�scaras de to_number en to_char.

--23. Seleccionar nombre, sueldo y sueldo formateado con el simbolo 'Euro' (ej.: 1,000.00� de todos los empleados. Se puede usar las m�scaras de to_number en to_char.

--24. Seleccionar la fecha del sistema (d�a, mes, a�o, horas (24):minutos:segundos).

--25. Seleccionar la fecha del sistema (nombre del d�a, d�a, nombre del mes, a�o, horas (24):minutos:segundos). No debe haber espacios sobrantes en el nombre del d�a o del mes.

--26. Seleccionar la fecha del d�a 1 de enero de 2005, med�ante una tira de caracteres y su m�scara de formato (ej.: 01012021 ser�a el 1 de enero de 2021).

--27. Calcular el n�mero de d�as vividos hasta hoy por una persona nacida el d�a 3 de julio de 1970.

--28. Calcular el n�mero de segundos transcurridos desde la �ltima medianoche (m�scara 'sssss' en to_char).

--29. Calcular el n�mero horas completas transcurridas desde la �ltima medianoche.

--30. Calcular el n�mero de meses transcurridos entre la fecha de contrataci�n de cada empleado y hoy.
