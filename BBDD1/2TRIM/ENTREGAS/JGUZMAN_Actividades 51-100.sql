--51. Qué día de la semana se contrató a cada empleado. 
SELECT ENAME, HIREDATE "FECHA CONTRATO" FROM EMP;

--52. Calcular la paga de beneficios que corresponde a cada empleado (3 salarios mensuales incrementados un: 10% para PRESIDENT, 20% para los MANAGER, 30% para el resto).
SELECT ENAME,SAL, CASE 
        WHEN JOB = 'PRESIDENT' THEN (SAL * 1.10)*3 
        WHEN JOB = 'MANAGER' THEN  (SAL * 1.20)*3  
        ELSE (SAL * 1.30)*3 END "SALARIO INCREMENTADO" FROM emp;

--53. Cuantos días han pasado desde el 25 julio de 1992.
SELECT DISTINCT (FLOOR(MONTHS_BETWEEN('13-02-25','25-06-91')))*30||' DIAS' "HAN PASADO" FROM EMP;

--54. Seleccionar el nombre de cada empleado junto al nombre del departamento en el que está.
SELECT * FROM EMP,DEPT;
SELECT EMP.ENAME,DEPT.DNAME FROM EMP JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO;

--55. Seleccionar el nombre y puesto de cada empleado junto al nombre del departamento al que pertenece y la localización del departamento.
SELECT EMP.ENAME,EMP.JOB,DEPT.DNAME,DEPT.LOC FROM EMP JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO;

--56. Seleccionar el nombre de cada empleado, el nombre de departamento al que pertenece, y el codigo de departamento del empleado.
SELECT EMP.ENAME,DEPT.DNAME,DEPT.DEPTNO FROM EMP JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO;

--57. Listar el nombre del empleado y el nombre de su jefe.
SELECT EM.ENAME "EMPLEADO", E.ENAME "JEFE" FROM EMP EM JOIN EMP E ON E.EMPNO = EM.MGR ;

--58. Listar el nombre del empleado y el nombre de su jefe. Incluir empleados que no tengan jefe. 
SELECT EM.ENAME "EMPLEADO", E.ENAME "JEFE" FROM EMP EM JOIN EMP E ON E.EMPNO = EM.MGR;

--59. Seleccionar nombre del empleado, nombre del jefe, fechas contrato del trabajador y del jefe, de forma que la fecha de contrato del empleado sea anterior a la de su jefe.
SELECT EM.ENAME "EMPLEADO", E.ENAME "JEFE", EM.HIREDATE "EMPLEADO", E.HIREDATE "JEFE" FROM EMP EM JOIN EMP E ON E.EMPNO = EM.MGR WHERE  E.HIREDATE > EM.HIREDATE;

--60. Seleccionar nombre del empleado, nombre del jefe, salarios del trabajador y del jefe, de forma que el sueldo del empleado sea inferior a la mitad del salario de su jefe.
SELECT EM.ENAME, E.ENAME, EM.SAL "SAL EMP", E.SAL "SAL JEFE" FROM EMP EM JOIN EMP E ON E.EMPNO = EM.MGR WHERE EM.SAL < E.SAL;

--61. Seleccionar las distintas ubicaciones de los departamentos.
SELECT LOC FROM DEPT;

--62. Seleccionar la ubicación y el nombre empleado. Incluir también las ubicaciones de departamentos sin empleados.
SELECT DEPT.LOC,EMP.ENAME FROM DEPT JOIN EMP ON DEPT.DEPTNO = EMP.DEPTNO (+);

--63. Seleccionar el nombre de los empleados, y el departamento al que pertenecen, para los empleados que ganan menos de 1000$.
SELECT EMP.ENAME,DEPT.DNAME FROM EMP JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO WHERE SAL < 1000;

--64. Seleccionar el nombre del empleado, y el departamento al que pertenecen, para los empleados que ganan más de 1000$.
SELECT EMP.ENAME,DEPT.DNAME FROM EMP JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO WHERE SAL > 1000;

--65. Consultar todos los valores de la tabla emp.
SELECT * FROM EMP;

--66. Listar el nombre, el oficio y sueldo de los empleados.
SELECT ENAME, JOB, SAL FROM EMP;

--67. Calcular el sueldo anual que percibe cada empleado.
SELECT ENAME, SAL * 12 "SALARIO ANUAL" FROM EMP;

--68. Consultar los datos de la tabla DEPT.
SELECT * FROM DEPT;

--69. Listar los diferentes puestos de los empleados sin repetir.
SELECT DISTINCT JOB FROM EMP;

--70. Listar en una sola columna el nombre y el puesto de cada empleado.
SELECT ENAME ||' '|| JOB "NOMBRE Y PUESTO" FROM EMP;

--71. Listar todas las columnas de la tabla EMP en una única columna, separando cada campo por comas.
SELECT EMPNO||', '||ENAME||', '||JOB||', '||MGR||', '||HIREDATE||', '||SAL||', '||COMM||', '||DEPTNO"TODOS LOS DATOS" FROM EMP;

--72. Listar el nombre y sueldo de los empleados que ganan más de 2000$.
SELECT ENAME,SAL FROM EMP WHERE SAL > 2000;

--73. Listar el nombre y código de departamento del empleado con id=30.
SELECT EMP.ENAME,DEPT.DEPTNO FROM EMP JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO WHERE DEPT.DEPTNO = 30;

--74. Listar el nombre y sueldo de los empleados que NO ganan entre 5000 y 12000 dólares. Muestra el sueldo con el símbolo de $ delante de la cifra.
SELECT ENAME, '$'||SAL FROM EMP WHERE SAL NOT BETWEEN 5000 AND 12000;

--75. Listar el nombre, puesto y fecha contrato de los empleados contratados entre el 20 febrero 1981 y el 1 de mayo de 1981. Ordenar por fecha descendente.
SELECT ENAME, JOB,HIREDATE FROM EMP WHERE HIREDATE BETWEEN '20-02-81' AND '01-05-81' ORDER BY HIREDATE DESC; 

--76. Listar el nombre y el cod departamento de los empleados pertenecientes a los departamentos 20 o 40.
SELECT EMP.ENAME,DEPT.DEPTNO FROM EMP JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO WHERE DEPT.DEPTNO = 20 OR DEPT.DEPTNO = 40;
SELECT ENAME,DEPTNO FROM EMP WHERE DEPTNO = 20 OR DEPTNO = 40;

--77. Listar el nombre (alias: Empleado) y sueldo (alias: Salario mensual) de los empleados pertenecientes a los departamentos 20 o 40, que ganen entre 2000 y 4000 dólares.
SELECT ENAME "EMPLEADO",SAL"SALARIO MENSUAL" FROM EMP WHERE DEPTNO = 20 OR DEPTNO = 40;

--78. Listar el nombre y fecha contrato de empleados contratados el año 1984. NO SALE NADA PORQUE NOY CONTRATACIONES EN EL AÑO 84
SELECT ENAME,HIREDATE FROM EMP WHERE HIREDATE BETWEEN '01-01-84' AND '31-12-84';

--79. Listar el nombre y el puesto de los empleados que no tengan jefe asignado.
SELECT ENAME, JOB, MGR FROM EMP WHERE MGR IS NULL;

--80. Listar el nombre, sueldo y % comisión de los empleados que cobran comisión. Ordenar por salario y comisión, de forma que los más altos salgan primero.
SELECT ENAME,SAL,(COMM/SAL)*100"% COM" FROM EMP WHERE COMM IS NOT null ORDER BY SAL DESC;

--81. Listar el nombre de los empleados que tengan una 'a' en la 3a letra del nombre.
SELECT ENAME FROM EMP WHERE ENAME LIKE '__A%';

--82. Listar el nombre de los empleados que tengan una 'a' y una 'e' en el nombre.
SELECT ENAME FROM EMP WHERE ENAME LIKE '%A%' AND ENAME LIKE '%E%';

--83. Listar el nombre, puesto y sueldo de los empleados 'CLERK' o 'SALESMAN', y con salario distinto de: 2500, 3500 y 7000.
SELECT ENAME,JOB,SAL FROM EMP WHERE JOB = 'SALESMAN' OR JOB = 'CLERK' AND SAL NOT IN (2500,3500,7000);

--84. Listar el nombre (alias: Empleado), sueldo (alias: Salario mensual) y nombre del departamento de todos los empleados cuya comisión sea mayor de 400.
SELECT EMP.ENAME "EMPLEADO", EMP.SAL "SALARIO MENSUAL", DEPT.DNAME FROM EMP JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO WHERE COMM > 400;

--85. Listar el nombre y salario de los empleados, de forma que estén separados por una línea de puntos, y que de extremo a extremo haya 30 caracteres (por ejemplo: "KING......................5000").
SELECT RPAD(ENAME,30,'.')||SAL "SALARIO" FROM EMP;

--86. Listar los nombres de los empleados, reemplazando la letra 'a' por un '1'.
SELECT REPLACE(ENAME,'A','L')"A X L" from EMP; 

--87. Obtener la fecha del sistema (hoy) con alias: Fecha en el formato por defecto (sin tocar nada).
SELECT SYSDATE"FECHA EN EL FORMATO POR DEFECTO" FROM DUAL;

--88. Listar el id, nombre, salario de los empleados, y además otra columna con el salario incrementado un 15% su valor y redondeado (alias: Nuevo salario).
SELECT EMPNO,ENAME,SAL,ROUND(SAL*1.15) "NUEVO SALARIO" FROM EMP;

--89. Listar el id, nombre, salario de los empleados, el salario incrementado un 15% redondeado (alias: Nuevo salario) y además otra columna con la cuantía del incremento (alias: Incremento).
SELECT EMPNO,ENAME,SAL,ROUND(SAL*1.15) "NUEVO SALARIO",((SAL*1.15)/SAL)"INCREMENTO" FROM EMP;

--90. Listar el nombre y longitud del nombre de los empleados que empiecen por A, o M. (Los nombres tendrán la inicial en mayúscula y el resto en minúsculas).
SELECT INITCAP(ENAME),LENGTH(ENAME) FROM EMP WHERE ENAME LIKE 'A%' OR ENAME LIKE 'M%';

--91. Listar el nombre y número de meses trabajados, redondeando al entero superior. Ordenar por número de meses trabajados, de menor a mayor.
SELECT ENAME,(CEIL(MONTHS_BETWEEN('19-02-25',HIREDATE)))"MESES TRABAJADOS" FROM EMP;

--92. Componer una frase con el nombre, salario actual y el triple del salario de los empleados. Por ejemplo: "KING gana 5000 mensuales, pero querría ganar 15000" (alias: Sueldos soñados).
SELECT ENAME||' GANA '||SAL||' MENSUALES, PERO LE GUSTARÍA GANAR '||SAL*3 "SUELDOS SOÑADOS" FROM EMP;

--93. Listar el nombre y salario de los empleados, rellenando por la izquierda hasta 15 caracteres con el símbolo "$".
SELECT ENAME,LPAD(SAL,15,'$') FROM EMP;

/*94. Listar nombre, fecha contrato y fecha revisión contrato de los empleados, sabiendo que la revisión será el lunes siguiente a la fecha que cumple 6 meses de 
trabajo en la empresa. Formatear esta fecha de acuerdo con el ejemplo: 'Lunes, 12th de noviembre de 2005'.*/
SELECT ENAME,HIREDATE,NEXT_DAY(ADD_MONTHS(HIREDATE,6),'LUNES')"REVISION" FROM EMP;

SELECT REPLACE(TO_CHAR(HIREDATE,'DAY'),' ',' ') || TO_CHAR(HIREDATE,'dd') || 'th de ' || REPLACE(TO_CHAR(HIREDATE,'month'),' ','') || ' de ' || TO_CHAR(HIREDATE,'yyyy') FROM EMP;

--95. Listar nombre, fecha contrato y día de la semana en que fueron contratados los empleados, ordenando por día de la semana, de forma que queden ordenados por lunes, martes, miércoles, jueves, viernes, sábado y domingo.
SELECT ENAME,HIREDATE,TO_CHAR(HIREDATE,'DAY') FROM EMP ORDER BY TO_CHAR(HIREDATE,'DAY') ASC;

--96. Listar nombre y comisión de los empleados. En el caso de que no gane comisión, sacar la frase "Sin comisión".
SELECT ENAME,NVL(NULL,'SIN COMISION') FROM EMP ;

/*97. Listar nombre de los empleados, y una tira de asteriscos, de forma que haya un asterisco por cada 1000$ (redondeada) que gana el empleado.
Titula la columna 'Empleado y su salario'. Ordenar esta columna de forma que los que más ganan aparezcan primero. Los nombres deben quedar 
ajustados a la longitud del nombre más largo. Ej.: "KING..:  *****" */
SELECT ENAME, DECODE(SAL,SAL,'***') "SALARIO" FROM EMP;

--98. Listar los distintos nombres de puestos de los empleados, de forma que : PRESIDENT se traduzca por A, MANAGER por B, ANALYST por C, CLERK por D y el resto por E.
SELECT  JOB , DECODE(JOB,'PRESIDENT','A','MANAGER','B','ANALYST','C','CLERK','D','SALESMAN','E') FROM EMP;

--99. Listar todos los campos de la tabla DEPT.
SELECT * FROM DEPT;

--100. Seleccionar el nombre de departamento, y el nombre de la ciudad donde está.
SELECT DNAME, LOC FROM DEPT;
