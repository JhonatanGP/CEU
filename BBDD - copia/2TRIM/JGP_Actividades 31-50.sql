--31. Calcular el último dia del mes (fecha) del mes actual. 
select last_day(sysdate) "Último día del mes" from dual;

--32. Calcular el último dia del mes (fecha) del mes actual, con horas, minutos y segundos.
select to_char(last_day(sysdate),'dd/mm/yyyy HH:mi:ss') from dual;

--33. Calcular en qué MES (cifras) se ha contratado cada empleado.
select ename, to_char(hiredate, 'mm') "Mes contratado" from emp;

--34. Calcular cuanto debería haber cobrado cada empleado en su primer año de trabajo (desde la fecha de contrato hasta el 31 de diciembre de ese año).


--35. Cuantos oficios distintos hay en la tabla de empleados.
select distinct job from emp;

--36. Calcular el IRPF de cada empleado, teniendo en cuenta que para los 'CLERK' se les retiene un 15%, y a los 'ANALYST" un 20%. Al resto se les retiene un 19%.
select ename, decode(job,'CLERK', sal*0.15,'ANALYST', sal*0.20,sal*0.19) from emp;

--37. Efectuar una propuesta de aumento salarial: Para los empleados del Dept. 10 un 5%, Dept. 20 un 7%, Dept 30 un 8% y al resto un 3% del salario.
select ename, decode(sal,'10', sal*1.05,'20', sal*1.07,'30', sal*1.08,sal*1.03) from emp;

--38. Listar los nombres de los empleados, identificando como 'Vendedor' si cobra comisión, y 'No vendedor' si no la cobra.

--39. Calcular cuánto se paga mensualmente a todos los empleados.
select sum(sal) from emp; 

--40. Calcular cuantos empleados hay.
select count (*) from emp;

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
select sum(sal) from emp where deptno in (10, 30) group by deptno;

--47. Calcular cuantos empleados se han contratado cada año.


--48. Calcular el sueldo máximo y mínimo de cada departamento.
 select min(sal), max(sal) from emp group by deptno;

--49. Calcular cuanto se gana de media por cada oficio. Redondear a 2 decimales.
select round(avg(sal),2),job from emp;

--50. Cuántos dias de vacaciones correspondieron a cada empleado el primer año de trabajo (contando 1 día por semana entera trabajada).
