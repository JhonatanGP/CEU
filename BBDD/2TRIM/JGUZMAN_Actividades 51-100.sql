--51. Qué día de la semana se contrató a cada empleado.
select ename, hiredate as "Fecha de contratacion" from emp;

--52. Calcular la paga de beneficios que corresponde a cada empleado (3 salarios mensuales incrementados un: 10% para PRESIDENT, 20% para los MANAGER, 30% para el resto).
SELECT ename,sal,  CASE 
        WHEN job = 'PRESIDENT' THEN sal * 1.10 -- 10% incremento
        WHEN job = 'MANAGER' THEN sal * 1.20   -- 20% incremento
        ELSE sal * 1.30                           -- 30% incremento para el resto
    END AS paga_beneficios
FROM emp;
--53. Cuantos días han pasado desde el 25 julio de 1992.

--54. Seleccionar el nombre de cada empleado junto al nombre del departamento en el que está.

--55. Seleccionar el nombre y puesto de cada empleado junto al nombre del departamento al que pertenece y la localización del departamento.

--56. Seleccionar el nombre de cada empleado, el nombre de! departamento al que pertenece, y el codigo de departamento del empleado.
select em.ename, e.ename, em.hiredate "Empleado", e.hiredate "Jefe" from emp em join emp e on e.empno = em.mgr where e.hiredate > em.hiredate;
--57. Listar el nombre del empleado y el nombre de su jefe.
select em.ename, e.ename from emp em join emp e on e.empno = em.mgr;
--58. Listar el nombre del empleado y el nombre de su jefe. Incluir empleados que no tengan jefe.

--59. Seleccionar nombre del empleado, nombre del jefe, fechas contrato del trabajador y del jefe, de forma que la fecha de contrato del empleado sea anterior a la de su jefe.

--60. Seleccionar nombre del empleado, nombre del jefe, salarios del trabajador y del jefe, de forma que el sueldo del empleado sea inferior a la mitad del salario de su jefe.
SELECT e.ENAME ,
d.DNAME,
e.EMPNO
FROM
EMP e 
JOIN DEPT d ON d.DEPTNO = e.DEPTNO WHERE emp.sal < e.ename.sal;
--61. Seleccionar las distintas ubicaciones de los departamentos.

--62. Seleccionar la ubicación y el nombre empleado. Incluir también las ubicaciones de departamentos sin empleados.

--63. Seleccionar el nombre de los empleados, y el departamento al que pertenecen, para los empleados que ganan menos de 1000$.

--64. Seleccionar el nombre del empleado, y el departamento al que pertenecen, para los empleados que ganan más de 1000$.

--65. Consultar todos los valores de la tabla emp.

--66. Listar el nombre, el oficio y sueldo de los empleados.

--67. Calcular el sueldo anual que percibe cada empleado.

--68. Consultar los datos de la tabla DEPTS.

--69. Listar los diferentes puestos de los empleados sin repetir.

--70. Listar en una sola columna el nombre y el puesto de cada empleado.

--71. Listar todas las columnas de la tabla EMP en una única columna, separando cada campo por comas.

--72. Listar el nombre y sueldo de los empleados que ganan más de 2000$.

--73. Listar el nombre y código de de departamento del empleado con id=30.

--74. Listar el nombre y sueldo de los empleados que NO ganan entre 5000 y 12000 dólares. Muestra el sueldo con el símbolo de $ delante de la cifra.

--75. Listar el nombre, puesto y fecha contrato de los empleados contratados entre el 20 febrero 1981 y el 1 de mayo de 1981. Ordenar por fecha descendente.

--76. Listar el nombre y el cod departamento de los empleados pertenecientes a los departamentos 20 o 40.

--77. Listar el nombre (alias: Empleado) y sueldo (alias: Salario mensual) de los empleados pertenecientes a los departamentos 20 o 40, que ganen entre 2000 y 4000 dólares.

--78. Listar el nombre y fecha contrato de empleados contratados el año 1984.

--79. Listar el nombre y el puesto de los empleados que no tengan jefe asignado.

--80. Listar el nombre, sueldo y % comisión de los empleados que cobran comisión. Ordenar por salario y comisión, de forma que los más altos salgan primero.

--81. Listar el nombre de los empleados que tengan una 'a' en la 3a letra del nombre.

--82. Listar el nombre de los empleados que tengan una 'a' y una 'e' en el nombre.

--83. Listar el nombre, puesto y sueldo de los empleados 'CLERK' o 'SALESMAN', y con salario distinto de: 2500, 3500 y 7000.

--84. Listar el nombre (alias: Empleado), sueldo (alias: Salario mensual) y nombre del departamento de todos los empleados cuya comisión sea mayor de 400.

--85. Listar el nombre y salario de los empleados, de forma que estén separados por una línea de puntos, y que de extremo a extremo haya 30 caracteres (por ejemplo: "KING......................5000").

--86. Listar los nombres de los empleados, reemplazando la letra 'a' por un '1'.

--87. Obtener la fecha del sistema (hoy) con alias: Fecha en el formato por defecto (sin tocar nada).

--88. Listar el id, nombre, salario de los empleados, y además otra columna con el salario incrementado un 15% su valor y redondeado (alias: Nuevo salario).
SELECT empno, ename,SAL ,round(sal *1.15) "Salario redondeado" FROM emp;

--89. Listar el id, nombre, salario de los empleados, el salario incrementado un 15% redondeado (alias: Nuevo salario) y además otra columna con la cuantía del incremento (alias: Incremento).
SELECT empno, ename,SAL ,round(sal *0.15) "Salario redondeado" FROM emp;

--90. Listar el nombre y longitud del nombre de los empleados que empiecen por A, o M. (Los nombres tendrán la inicial en mayúscula y el resto en minúsculas).
SELECT initcap (ename),LENGTH  FROM EMP WHERE ename LIKE 'A%' OR ename LIKE 'M%';
--91. Listar el nombre y número de meses trabajados, redondeando al entero superior. Ordenar por número de meses trabajados, de menor a mayor.

--92. Componer una frase con el nombre, salario actual y el triple del salario de los empleados. Por ejemplo: "KING gana 5000 mensuales, pero querría ganar 15000" (alias: Sueldos soñados).

--93. Listar el nombre y salario de los empleados, rellenando por la izquierda hasta 15 caracteres con el símbolo "$".
select ename, sal lpad $ from emp;
SELECT ename, sal,LPAD(ename,15,'$') FROM EMP;
--94. Listar nombre, fecha contrato y fecha revisión contrato de los empleados, sabiendo que la revisión será el lunes siguiente a la fecha que cumple 6 meses de trabajo en la empresa. Formatear esta fecha de acuerdo con el ejemplo: 'Lunes, 12th de noviembre de 2005'.

--95. Listar nombre, fecha contrato y día de la semana en que fueron contratados los empleados, ordenando por día de la semana, de forma que queden ordenados por lunes, martes, miércoles, jueves, viernes, sábado y domingo.

--96. Listar nombre y comisión de los empleados. En el caso de que no gane comisión, sacar la frase "Sin comisión".

--97. Listar nombre de los empleados, y una tira de asteriscos, de forma que haya un asterisco por cada 1000$ (redondeada) que gana el empleado. Titula la columna 'Empleado y su salario'. Ordenar esta
--columna de forma que los que más ganan aparezcan primero. Los nombres deben quedar ajustados a la longitud del nombre más largo. Ej.: "KING..:  *****"

--98. Listar los distintos nombres de puestos de los empleados, de forma que : PRESIDENT se traduzca por A, MANAGER por B, ANALYST por C, CLERK por D y el resto por E.
SELECT DISTINCT job , DECODE('PRESIDENT','A','MANAGER','B','ANALISTA','C','CLERK','D') FROM EMP;
--99. Listar todos los campos de la tabla DEPT.
select DEPTMO, DNAME, LOC from DEPT;
--100. Seleccionar el nombre de departamento, y el nombre de la ciudad donde está.

SELECT ENAME 'empleado', sal 'salario mensual',dname FROM emp WHERE comm >400;

