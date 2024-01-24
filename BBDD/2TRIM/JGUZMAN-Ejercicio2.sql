--EJERCICIO SEMANAL 2

/*1. Devuelve el nombre (solo may�scula la primera letra), el presupuesto reducido en 250000 seguido por un espacio y la palabra euros, el presupuesto
actual seguido por un espacio y la palabra euros, y el presupuesto m�s el 10% del mismo seguido de un espacio y la palabra euros, correspondiente a 
los equipos y ordenados por el presupuesto en orden descendente. Utiliza los siguientes alias de columna en este orden para los presupuestos: "2022-23", "2023-24", "2024-25".*/
SELECT INITCAP(NOMBRE)FROM FUTBOLISTAS;
SELECT PRESUPUESTO - 250000 ||' '|| 'EUROS' "2022-23" FROM EQUIPOS;
SELECT PRESUPUESTO ||' '|| 'EUROS' "2023-24" FROM EQUIPOS;
SELECT PRESUPUESTO * 1.1 ||' '|| 'EUROS' AS "2024-25" FROM EQUIPOS ORDER BY PRESUPUESTO DESC;

/*2. Se quiere el nombre en min�sculas, la fecha de nacimiento y el salario dividido entre 12. Este salario debe redondearse para que tenga solo dos 
decimales, y concatenar usando la funci�n CONCAT con un espacio y la palabra euros. Los resultados deben estar ordenados por orden descendente de 
salario de futbolista.*/
SELECT LOWER (NOMBRE), FECHA_NACIMIENTO, CONCAT(ROUND(SALARIO/12,2), ' EUROS') FROM FUTBOLISTAS ORDER BY SALARIO DESC;

/*3. Devuelve el nombre (con tres caracteres) seguido de un "-" y el apellido de los fubtolistas en una columna que tenga por alias "NOM-APELLIDO" 
(emplea la funci�n CONCAT), y en otra columna el tama�o/n�mero de caracteres del campo apellido de los futbolistas, usando el alias de columna 
"CARACTERES APELLIDO". Debe ordenarse descendentemente por ese tama�o de caracteres de apellido.*/
SELECT CONCAT(SUBSTR(NOMBRE,0,3)||'-',APELLIDOS)"NOM-APELLIDO", LENGTH(APELLIDOS) "CARACTERES APELLIDO" FROM FUTBOLISTAS ORDER BY "CARACTERES APELLIDO" DESC;

/*4. Queremos un listado de los nombres de los futbolistas quitando los segundos nombres (nombres compuestos, por ejemplo, borrar LUIS de PEDRO LUIS,
quedando solo PEDRO) y poner como alias de columna "SOLO NOMBRE".*/
SELECT NVL(SUBSTR(NOMBRE,0,INSTR(NOMBRE,' ')),NOMBRE) "SOLO NOMBRE" FROM FUTBOLISTAS;
/*Otras soluciones
selectnombre from futbolistas;
select instr(nombre,' ',1,instr nombre;