--31. Calcular el último dia del mes (fecha) del mes actual. 
select last_day(sysdate) "Último día del mes" from dual;

--32. Calcular el último dia del mes (fecha) del mes actual, con horas, minutos y segundos.
select to_char(last_day(sysdate),'dd/mm/yyyy HH:mi:ss') from dual;

--33. Calcular en qué MES (cifras) se ha contratado cada empleado.
select ename, to_char(hiredate, 'mm') "Mes contratado" from emp;

--34. Calcular cuanto debería haber cobrado cada empleado en su primer año de trabajo (desde la fecha de contrato hasta el 31 de diciembre de ese año).
select ename ;

--35. Cuantos oficios distintos hay en la tabla de empleados.
select distinct job from emp;
--36. Calcular el IRPF de cada empleado, teniendo en cuenta que para los 'CLERK' se les retiene un 15%, y a los 'ANALYST" un 20%. Al resto se les retiene un 19%.

--37. Efectuar una propuesta de aumento salarial: Para los empleados del Dept. 10 un 5%, Dept. 20 un 7%, Dept 30 un 8% y al resto un 3% del salario.

--38. Listar los nombres de los empleados, identificando como 'Vendedor' si cobra comisión, y 'No vendedor' si no la cobra.

--39. Calcular cuánto se paga mensualmente a todos los empleados.

--40. Calcular cuantos empleados hay.
select count (*) from emp;
--41. Calcular el sueldo medio de todos los empleados.

--42. Calcular la comisión media de todos los empleados (teniendo en cuenta aquellos que no tienen comisión).

--43. Calcular la comisión media de los empleados que sí tienen comisión.

--44. Calcular la suma de los sueldos de los empleados del Departamento 20.

--45. Calcular el sueldo medio de los empleados que pertenezcan al Dept 10 o 30.

--46. Calcular la suma de sueldos que se pagan en cada uno de los departamentos 10 y 30 (por separado).

--47. Calcular cuantos empleados se han contratado cada año.

--48. Calcular el sueldo máximo y mínimo de cada departamento.

--49. Calcular cuanto se gana de media por cada oficio. Redondear a 2 decimales.

--50. Cuántos dias de vacaciones correspondieron a cada empleado el primer año de trabajo (contando 1 día por semana entera trabajada).
select ename, sal * months_between(to_date('31-12-' || extract(year from hiredate),'dd-mm-yyyy'), hiredate) "Salario 1er año" from emp;
