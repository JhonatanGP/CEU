--101. Listar (select) las diferentes ciudades de la tabla sin repetición explícitamente (aunque no haya datos que se repitan).
select * from dept;
select distinct loc from dept;

--102. Listar el nombre de departamento y nombre de ciudad para los departamentos ubicados en  en New York y Dallas.
select * from dept;
select dname, loc from dept where loc = 'NEW YORK' or loc = 'DALLAS'; -- o select dname, loc from dept where loc in ('NEW YORK', 'DALLAS');  

--103. Seleccionar el nombre de los empleados y el nombre de la ciudad donde está el departamento al que pertenecen. (cuando son dos tablas join on)
select * from emp;
select * from dept;
select ename, loc from dept join emp emp.ename on dept.loc = emp.ename;

--104. Listar el nombre de los trabajadores, puesto, nombre del departamento y ciudad del departamento de aquellos que no son MANAGER.
select * from emp;
select * from dept;
select emp.ename, emp.job from emp join dept on dept.dname, dept.loc dept.dname = emp. where job <> 'MANAGER'; --me falta igualar
--105. Listar el nombre de los trabajadores, puesto, nombre del departamento y ciudad del departamento de aquellos que no son ni ANALYST ni CLERK.
select emp.ename, emp.job from emp join dept on dept.dname, dept.loc dept. = emp. where job <> 'ANALIST' and 'CLERK';

--106. Seleccionar el nombre del empleado, código y nombre del departamento al que pertenecen los empleados.
select * from emp;
select * from dept;
select emp.ename,emp.empno,dept.dname from emp join dept on emp.deptno = dept.deptno;
--107. Seleccionar el nombre de los empleados que trabajan en el departamento cuyo código es el más bajo de todos los existentes (utiliza subconsultas).
select * from emp;
select * from dept;
select ename from emp where deptno = (select min(deptno) from dept);
--108. Seleccionar nombre de empleado, nombre de departamento y ubicación del departamento para los empleados que tienen comisión.
select * from emp;
select * from dept;
select emp.ename,dept.dname, dept.loc from emp join dept on emp.deptno = dept.deptno where emp.comm is not null;
--109. Seleccionar nombre de empleado, nombre de departamento y localización, para los empleados que no tienen comisión (o esta vale cero).

--110. Seleccionar nombre de empleado y nombre de departamento para los empleados que tengan una 'a' en su nombre.

--111. Seleccionar nombre de empleado y nombre departamento para los empleados que tengan una vocal al menos (a, e, i, o, u) en su nombre.

--112. Seleccionar nombre y puesto de empleado, código de departamento y nombre de departamento de los empleados cuyo departamento está ubicado en 'Chicago'. Todos los valores deben devolverse en minúsculas.

--113. Seleccionar nombre, código de empleado, nombre de su jefe y código de empleado de su jefe para todos los empleados (no se deben mostrar los que no tienen jefe).

--114. Seleccionar nombre, código de empleado, nombre de su jefe y código de empleado de su jefe para todos los empleados (se deben mostrar TODOS, incluso los que no tienen jefe).

--115. Seleccionar código departamento, nombre de empleado y nombre de jefe de cada empleado del departamento que está en Boston.

--116. Seleccionar nombre y fecha contrato de los empleados contratados posteriormente al empleado 'WARD'.

--118. Seleccionar nombre y fecha de contrato de los empleados, además del nombre y fecha de contrato de su jefe, siempre y cuando la fecha del contrato del empleado fuera anterior a la fecha de contrato de su jefe.

--119. Listar todos los nombres cuya longitud sea menor que la media de todas las longitudes de nombres de empleados redondeado al entero superior.

--120. Seleccionar el nombre de los empleados y el nombre del departamento al que pertenecen, siempre y cuando el nombre del departamento comience por la letra 'S'.
