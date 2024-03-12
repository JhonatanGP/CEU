--PDF 3.MULTITABLAS 29/01/24
--1. Realiza una composición interna entre la tabla partidos y la tabla equipos.
select * from partidos,equipos;

--2.Muestra los datos de los nombres de los futbolistas junto al nombre de su equipo.
SELECT * FROM futbolistas,equipos;
select futbolistas.nombre ,equipos.nombre "EQUIPO" from futbolistas join equipos on futbolistas.id_equipo = equipos.id;

--3.Incluye un nuevo equipo en la tabla EQUIPOS. Obtén un listado de los equipos y jugadores que pertenecen a estos 
--(nombre de equipo, nombre de jugador y posición).
select * from equipos;
SELECT * FROM futbolistas;
insert into equipos VALUES (5,'EQUIPO D','ESTADIO D', 150000);
select equipos.nombre "EQUIPO",futbolistas.nombre ||' '||FUTBOLISTAS.APELLIDOS "NOMBRE",FUTBOLISTAS.POSICION
    from futbolistas join equipos on futbolistas.id_equipo = equipos.id (+);

--4.Muestra el nombre de los futbolistas seguido del nombre del equipo en el que juega utilizando CROSS JOIN.
SELECT F.NOMBRE, E.NOMBRE FROM FUTBOLISTAS F CROSS JOIN EQUIPOS E;
SELECT FUTBOLISTAS.NOMBRE,EQUIPOS.NOMBRE "EQUIPO" FROM FUTBOLISTAS JOIN EQUIPOS ON FUTBOLISTAS.ID_EQUIPO = EQUIPOS.ID; --JOIN

--5.Muestra el nombre de los futbolistas seguido del nombre del equipo en el que juega utilizando JOIN … USING.


--6. Muestra el nombre de los futbolistas seguido del nombre del equipo en el que juega utilizando JOIN … ON

------------------------------------------------------EXAMEN A 2 TRIM----------------------------------------------------------------------------

/*1. ¿Cuál es la categoría de ingrediente (carne, pescado, etc.) que se usa en mayor cantidad en los platos del restaurante?*/


/*2. Queremos el primer nombre de todos los clientes que tienen 333 en alguna parte de su teléfono. Debe ir completamente en mayúsculas.
No deben haber espacios en blanco al principio o al final del nombre en el resultado final.*/
select * from clientes;
select substr(nombre,1,5) from clientes where telefono like '%333%';
select upper(substr(nombre,1,5)) from clientes where telefono like '%333%';

select upper(replace(substr(nombre,1,instr(nombre||' ',' ')),' ')) from clientes where telefono like '%333%';--inda

/*3. Se quiere mostrar todos los nombres de los ingredientes que empiecen por una letra consonante, con todas sus letras en mayúsculas, y cuyo
estado sea LIQUIDO.*/
select *from ingredientes;
select upper(nombre)"NOMBRE",ESTADO from ingredientes where SUBSTR(nombre,1,1) not in ('A','E') AND estado = 'LIQUIDO';

select upper(nombre) from ingredientes where lower(substr(nombre,1,1)) not in ('a','e','i','o','u') AND estado = 'LIQUIDO'; --inda

/*4. ¿Cuál es la diferencia de cantidad que hay entre el ingrediente que se usa en mayor cantidad y el que se usa en menos? 
Expresa el valor añadiendo al final "gramos". Añade el alias de columna "Diferencia" al resultado.*/
select max(cantidad) from ingredientes_platos;
select min(cantidad) from ingredientes_platos;
select max(cantidad)- min(cantidad)||' gramos' as "Diferencia" from ingredientes_platos;

/*5. Se quiere mostrar el nombre de los platos pero con un formato distinto. Se quiere quitar las palabras "Plato" y "Entrante", debe estar la 
primera letra en mayúsculas de cada palabra, y se debe incluir un punto y final al terminar de mostrar el nombre del plato. No debe quedar 
ningún espacio ni al principio ni al final del nombre del plato.*/
select initcap(nombre) from platos;
select INITCAP(replace(replace(nombre,'Plato ',''),'Entrante '))||'.' "PLATO" from platos;

select initcap(replace(replace(nombre,'Entrante ',''),'Plato ',''))||'.'"PLATO" from platos;--INDA

/*6. ¿Qué nombre de platos se sirvieron (estado SERVIDO en COMANDAS), sin repetir, el 1 de marzo de 2021 entre las 21 y las 21:30 horas?*/
SELECT * FROM PLATOS;
SELECT * FROM COMANDAS;
SELECT DISTINCT PLATOS.NOMBRE,COMANDAS.FECHA,COMANDAS.HORA FROM PLATOS JOIN COMANDAS ON PLATOS.ID = COMANDAS.ID_PLATO 
    WHERE ESTADO = 'SERVIDO' AND FECHA = '010321' AND HORA BETWEEN '21:00' AND '21:30';

/*7. Se quiere una lista con el nombre en minúsculas de todos los ingredientes que sean CONDIMENTO y se encuentren en estado SOLIDO.*/
SELECT * FROM INGREDIENTES ;
SELECT LOWER(NOMBRE)"INGREDIENTES" FROM INGREDIENTES WHERE CATEGORIA = 'CONDIMENTO' AND ESTADO = 'SOLIDO';

/*8. Se quiere saber todas las categorías (CATEGORIA) de ingredientes que haya sin repetir resultado ordenadas en orden de la z a la a.*/
SELECT * FROM ingredientes;
SELECT DISTINCT CATEGORIA FROM INGREDIENTES ORDER BY CATEGORIA DESC;

/*9. Se quiere saber cuántas comandas se realizaron entre las 21:00 y las 21:10 horas (ambas inclusive) el día 01/03/21. cuando aparezca cuantas
se pone count(*)*/ 
SELECT *FROM COMANDAS;
SELECT COUNT(*) FROM COMANDAS WHERE FECHA = '010321' AND HORA BETWEEN '21:00' AND '21:10';

/*10. Muestra el nombre, teléfono y localidad de los clientes que viva en Bormujos y su teléfono no empiece por 1. Debes usar alias para nombrar
las tres columnas, la primera será "Cliente", la segunda "Tfno" y la tercera "Loc".*/
SELECT * FROM clientes;
SELECT NOMBRE "CLIENTE", TELEFONO "TFNO",LOCALIDAD "LOC" FROM CLIENTES WHERE LOCALIDAD = 'Bormujos' AND TELEFONO NOT LIKE '1%';

/*11. Muestra todos los datos de la tabla ingredientes en mayúsculas y que se encuentren en estado SOLIDO.*/
SELECT ID,UPPER(NOMBRE),CATEGORIA, ESTADO FROM INGREDIENTES WHERE ESTADO = 'SOLIDO';

/*12.¿Cuál es el ingrediente cuyo nombre tiene más caracteres? Pon en una única columna el nombre del ingrediente: número de caracteres. 
Ej.: Guisante: 8*/
SELECT * FROM INGREDIENTES;
SELECT NOMBRE ||':'||LENGTH(NOMBRE) FROM INGREDIENTES WHERE LENGTH(NOMBRE) = (SELECT MAX(LENGTH(NOMBRE)) FROM INGREDIENTES);

/*13.¿Cuántas comandas se han hecho el MARTES? Debe dar 11.*/
SELECT* FROM COMANDAS;
SELECT TO_CHAR(FECHA,'DAY') FROM COMANDAS;
SELECT COUNT(*) FROM COMANDAS WHERE TO_CHAR(FECHA,'DAY') = 'MARTES'; --POR QUE EL TRIM?
SELECT COUNT(*) FROM COMANDAS WHERE TRIM(TO_CHAR(FECHA,'DAY')) = 'MARTES' ;

/*14. Se quiere saber cuántos platos se preparan en 10 minutos, cuantos en 15 y cuantos en 25. Muestra una lista agrupada con el tiempo de 
preparación y el número de platos que tardan ese tiempo. EL resultado debe estar ordenado por el tiempo de preparación de menor a mayor.*/
SELECT * FROM PLATOS;
SELECT TIEMPO_PREPARACION,COUNT(*) FROM PLATOS GROUP BY TIEMPO_PREPARACION ORDER BY TIEMPO_PREPARACION ASC;

/*15. Necesitamos una lista con el NOMBRE y la LOCALIDAD de los clientes, pero el NOMBRE debe tener todas las letras en mayúsculas y que no haya 
ningún espacio entre nombres compuestos. Ej.: PEDROJUAN.*/
SELECT * FROM CLIENTES;
SELECT REPLACE(NOMBRE,' ') FROM CLIENTES;
SELECT UPPER(REPLACE(NOMBRE,' ')) "NOMBRE",LOCALIDAD FROM CLIENTES;

/*16. Indica el valor medio del PRECIO de los platos con REDONDEO de dos decimales.*/

 
/*17. Indica el NOMBRE del plato más caro.es uno de subconsulta clasico*/

 
/*18. Indica la lista de ingredientes (NOMBRE y CANTIDAD en 2 columnas diferentes) del plato "Entrante bacalao en aceite".*/


/*19. Indica la lista de ingredientes (NOMBRE) del plato "Tarta de queso".*/

 
/*20. Devuelve el NOMBRE y la CATEGORIA de los ingredientes que empiezan por "Pi".*/

 
/*21. ¿Cuántos ingredientes pertenecen a la CATEGORIA de LACTEO? Indica tan solo el número.*/

 
/*22. ¿Cuánto dinero se ha obtenido del plato de ID = 5? Indica solo una columna con el importe con dos decimales. Recuerda que para obtener 
dinero de un plato, los comensales han debido de pagar la comanda, es decir, tener un estado COBRADO.*/

/*23. ¿Cuál es el NOMBRE del ingrediente que se usa en más platos?*/


/*24. ¿En el NOMBRE de qué platos se usa el ingrediente "Aceite de oliva virgen extra"?*/

 
/*25. ¿Cuál es el nombre del plato que entró por comanda en COCINA el 01/03/21 a las 21:16?*/
select platos.nombre from comandas 
    join platos on platos.id = comandas.id_plato
    where estado = 'COCINA' and fecha '01/03/2021' and hora = '21:26';-- foto no me sale
 
/*26. ¿Cuántas comandas, independientemente del estado de la comanda, hay registradas hasta ahora del plato "Entrante Crema de zanahorias"?*/

 
/*27. Indica el nombre de los platos cuyo precio sea superior a 4 euros pero se tarde menos de 15 minutos en prepararse.*/

 
/*28. Indica el nombre de cliente que ha DEVUELTO una comanda.*/

 
/*29. ¿Cuántas comandas se han SERVIDO a la mesa 1 entre las 21:20 y las 21:50?*/

 
/*30. Indica la CATEGORIA del ingrediente Perejil. Debes mostrar dicha categoría con el tamaño/número de caracteres que sea el tamaño de la 
categoría que tenga menos letras. En este caso, es OTRO, que tiene 4 caracteres, pero no puedes usar el número 4, debes calcular en tu query 
ese tamaño mínimo.*/



/*31. Se quiere saber el nombre del cliente, el tiempo de preparación del plato que pidió, el nombre del ingrediente que se usa en mayor cantidad
en dicho plato que pidió y la categoría de dicho ingrediente, para aquella comanda realizada en la mesa 1 que fue DEVUELTO.*/

 
/*32. Se quiere mostrar una lista con todos los ingredientes en una columna, y en otra columna la suma de la cantidad empleada por cada 
ingrediente en los distintos platos.*/
SELECT SUM(CANTIDAD) FROM INGREDIENTES_PLATOS;
SELECT NOMBRE,SUM(CANTIDAD) FROM INGREDIENTES_PLATOS
    JOIN INGREDIENTES ON INGREDIENTES.ID = ingredientes_platos.id_ingrediente
    GROUP BY NOMBRE;

select nombre,sum(cantidad) 
    from ingredientes_platos
    join ingredientes on ingredientes.id = ingredientes_platos.id_ingrediente
    group by nombre;