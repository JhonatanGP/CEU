--101. Listar (select) las diferentes ciudades de la tabla sin repetición explícitamente (aunque no haya datos que se repitan).
select distinct loc from dept;

--102. Listar el nombre de departamento y nombre de ciudad para los departamentos ubicados en  en New York y Dallas.
select dname, loc from dept where loc = 'NEW YORK' or loc = 'DALLAS'; -- o select dname, loc from dept where loc in ('NEW YORK', 'DALLAS');  

--103. Seleccionar el nombre de los empleados y el nombre de la ciudad donde está el departamento al que pertenecen. (cuando son dos tablas join on)
select * from emp;
select * from dept;
SELECT EMP.ENAME, DEPT.LOC FROM DEPT JOIN EMP ON DEPT.DEPTNO = EMP.DEPTNO;

--104. Listar el nombre de los trabajadores, puesto, nombre del departamento y ciudad del departamento de aquellos que no son MANAGER.
select * from emp;
select * from dept;
SELECT ENAME,JOB,DEPT.DNAME,DEPT.LOC FROM EMP JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO WHERE JOB != 'MANAGER'; 

--105. Listar el nombre de los trabajadores, puesto, nombre del departamento y ciudad del departamento de aquellos que no son ni ANALYST ni CLERK.
SELECT ENAME,JOB, DEPT.DNAME,DEPT.LOC FROM EMP JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO WHERE JOB != 'ANALYST' AND JOB != 'CLERK';

--106. Seleccionar el nombre del empleado, código y nombre del departamento al que pertenecen los empleados.
select * from emp;
select * from dept;
SELECT ENAME,DEPT.DEPTNO,DEPT.DNAME FROM EMP JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO;

--107. Seleccionar el nombre de los empleados que trabajan en el departamento cuyo código es el más bajo de todos los existentes (utiliza subconsultas).
select * from emp;
select * from dept;
SELECT ENAME FROM EMP WHERE DEPTNO = (SELECT MIN(DEPTNO) FROM DEPT);

--108. Seleccionar nombre de empleado, nombre de departamento y ubicación del departamento para los empleados que tienen comisión.
select * from emp;
select * from dept;
SELECT ENAME, DEPT.DNAME, DEPT.LOC FROM EMP JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO WHERE COMM IS NOT NULL;

--109. Seleccionar nombre de empleado, nombre de departamento y localización, para los empleados que no tienen comisión (o esta vale cero).
SELECT ENAME, DEPT.DNAME, DEPT.LOC, COMM FROM EMP JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO WHERE COMM IS NULL OR COMM = 0;

--110. Seleccionar nombre de empleado y nombre de departamento para los empleados que tengan una 'a' en su nombre.
SELECT ENAME, DEPT.DNAME FROM EMP JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO WHERE ENAME LIKE '%A%';

--111. Seleccionar nombre de empleado y nombre departamento para los empleados que tengan una vocal al menos (a, e, i, o, u) en su nombre.
SELECT ENAME, DEPT.DNAME FROM EMP JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO WHERE ENAME LIKE '%A%' or ename like '%E%'or ename like '%I%' or ename like '%O%'or ename like '%U%';

--112. Seleccionar nombre y puesto de empleado, código de departamento y nombre de departamento de los empleados cuyo departamento está ubicado en 'Chicago'. Todos los valores deben devolverse en minúsculas.
SELECT LOWER(ENAME)"nombre",LOWER(JOB)"trabajo",LOWER(DEPT.DEPTNO)"cod dept",LOWER(DEPT.DNAME)"nombre dept" FROM EMP JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO WHERE LOC = 'CHICAGO';

--113. Seleccionar nombre, código de empleado, nombre de su jefe y código de empleado de su jefe para todos los empleados (no se deben mostrar los que no tienen jefe).
SELECT *FROM DEPT;
SELECT *FROM EMP;
SELECT A.ENAME,A.EMPNO,B.ENAME,B.EMPNO FROM EMP A, EMP B WHERE A.MGR = B.EMPNO;
--114. Seleccionar nombre, código de empleado, nombre de su jefe y código de empleado de su jefe para todos los empleados (se deben mostrar TODOS, incluso los que no tienen jefe).
SELECT A.ENAME,A.EMPNO,NVL(B.ENAME,0),NVL(B.EMPNO,0) FROM EMP A, EMP B WHERE A.MGR = B.EMPNO;

--115. Seleccionar código departamento, nombre de empleado y nombre de jefe de cada empleado del departamento que está en Boston.
SELECT A.DEPTNO,A.ENAME,B.ENAME FROM EMP A, EMP B JOIN DEPT B ON EMP.DEPTNO = DEPT.DEPTNO WHERE A.MGR = B.EMPNO AND B.DEPT.LOC = 'BOSTON';
--NO ME SALE
select dept.deptno, e.ename, e2.ename , loc from emp e join dept on e.deptno = dept.deptno join emp e2 on e.mgr = e2.empno where dept.loc = 'BOSTON';

--116. Seleccionar nombre y fecha contrato de los empleados contratados posteriormente al empleado 'WARD'.
SELECT ENAME,HIREDATE FROM EMP WHERE HIREDATE < (SELECT HIREDATE FROM EMP WHERE ENAME = 'WARD');

--117. Seleccionar nombre y fecha de contrato de los empleados, además del nombre y fecha de contrato de su jefe, siempre y cuando la fecha del contrato del empleado fuera anterior a la fecha de contrato de su jefe.
SELECT A.ENAME, A.HIREDATE,B.ENAME, B.HIREDATE FROM EMP A, EMP B WHERE A.MGR=B.EMPNO AND A.HIREDATE < B.HIREDATE;

--118. Listar todos los nombres cuya longitud sea menor que la media de todas las longitudes de nombres de empleados redondeado al entero superior.
SELECT ENAME FROM EMP WHERE LENGTH(ENAME)<(SELECT AVG(LENGTH(ENAME))FROM EMP);

--119. Seleccionar el nombre de los empleados y el nombre del departamento al que pertenecen, siempre y cuando el nombre del departamento comience por la letra 'S'.
SELECT EMP.ENAME, DEPT.DNAME FROM EMP JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO WHERE DEPT.DNAME LIKE 'S%';