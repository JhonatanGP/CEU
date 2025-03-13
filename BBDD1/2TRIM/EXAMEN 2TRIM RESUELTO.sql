/*1. ¿Cuál es la categoría de ingrediente (carne, pescado, etc.) que se usa en mayor cantidad en los platos del restaurante?*/
 SELECT * FROM INGREDIENTES;
 SELECT * FROM PLATOS;
 SELECT * FROM INGREDIENTES_PLATOS;
 
 select categoria, sum(cantidad) from ingredientes_platos 
    join ingredientes on ingredientes.id = ingredientes_platos.id_ingrediente
    group by categoria   having sum(cantidad);
--ahora tengo que hacer la subconculta, copiando lo mismo al final e igualando, esto lo pego al final.
select max(sum(cantidad)) from ingredientes_platos 
    join ingredientes on ingredientes.id = ingredientes_platos.id_ingrediente   group by categoria; 
    
select categoria, sum(cantidad) from ingredientes_platos 
    join ingredientes on ingredientes.id = ingredientes_platos.id_ingrediente
    group by categoria
    having sum(cantidad)=(select max(sum(cantidad)) from ingredientes_platos 
    join ingredientes on ingredientes.id = ingredientes_platos.id_ingrediente
    group by categoria);
 
/*2. Queremos el primer nombre de todos los clientes que tienen 333 en alguna parte de su teléfono. Debe ir completamente en mayúsculas.
No deben haber espacios en blanco al principio o al final del nombre en el resultado final.*/
select substr(nombre,1,instr(nombre||' ',' ')) from clientes;-- estaria mal
select upper(replace(substr(nombre,1,instr(nombre||' ',' ')),' ')) from clientes where telefono like '%333%';
 
/*3. Se quiere mostrar todos los nombres de los ingredientes que empiecen por una letra consonante, con todas sus letras en mayúsculas, y cuyo estado sea LIQUIDO.*/
select upper(nombre) from ingredientes where lower(substr(nombre,1,1)) not in ('a','e','i','o','u') AND estado = 'LIQUIDO';
 
/*4. ¿Cuál es la diferencia de cantidad que hay entre el ingrediente que se usa en mayor cantidad y el que se usa en menos? 
Expresa el valor añadiendo al final "gramos". Añade el alias de columna "Diferencia" al resultado.*/
SELECT max(cantidad) from ingredientes_platos;
SELECT min(cantidad) from ingredientes_platos;
SELECT max(cantidad) - min(cantidad) ||' gramos' "Diferencia" from ingredientes_platos;

/*5. Se quiere mostrar el nombre de los platos pero con un formato distinto. Se quiere quitar las palabras "Plato" y "Entrante", debe estar la primera letra 
en mayúsculas de cada palabra, y se debe incluir un punto y final al terminar de mostrar el nombre del plato. No debe quedar ningún espacio ni al principio 
ni al final del nombre del plato.*/
select initcap(replace(replace(nombre,'Entrante ',''),'Plato ',''))||'.' from platos;
select initcap(trim(replace(replace(nombre,'Entrante ',''),'Plato ',''))||'.') from platos;

/*6. ¿Qué nombre de platos se sirvieron (estado SERVIDO en COMANDAS), sin repetir, el 1 de marzo de 2021 entre las 21 y las 21:30 horas?*/
 select distinct nombre from comandas join platos on platos.id = comandas.id_plato where estado = 'SERVIDO' and fecha = '01-03-2021' and hora between '21:00' and '21:30';
 
/*7. Se quiere una lista con el nombre en minúsculas de todos los ingredientes que sean CONDIMENTO y se encuentren en estado SOLIDO.*/
select lower(nombre) from ingredientes where categoria = 'CONDIMENTO' and estado ='SOLIDO';
 
/*8. Se quiere saber todas las categorías (CATEGORIA) de ingredientes que haya sin repetir resultado ordenadas en orden de la z a la a.*/
select distinct categoria from ingredientes order by categoria desc;
 
/*9. Se quiere saber cuántas comandas se realizaron entre las 21:00 y las 21:10 horas (ambas inclusive) el día 01/03/21. cuando apaarezca cuantas se pone count(*)*/ 
select count(*) from comandas where hora between '21:00' and '21:10' and fecha = '01-03-2021';

/*10. Muestra el nombre, teléfono y localidad de los clientes que viva en Bormujos y su teléfono no empiece por 1. Debes usar alias para nombrar las tres columnas, 
la primera será "Cliente", la segunda "Tfno" y la tercera "Loc".*/
select nombre "Cliente",telefono "Tfno",localidad "Loc" from clientes where localidad = 'Bormujos' and telefono not like '1%';
 
/*11. Muestra todos los datos de la tabla ingredientes en mayúsculas y que se encuentren en estado SOLIDO.*/
select id,upper(nombre), upper(categoria), upper(estado) from ingredientes where estado = 'SOLIDO';
 
/*12.¿Cuál es el ingrediente cuyo nombre tiene más caracteres? Pon en una única columna el nombre del ingrediente: número de caracteres. Ej.: Guisante: 8*/
select nombre || ': ' || length(nombre) from ingredientes where length(nombre) = (select max(length(nombre)) from ingredientes);
 
/*13.¿Cuántas comandas se han hecho en MARTES? Debe dar 11.*/
select count(*) from comandas where trim(to_char(fecha,'DAY')) = 'MARTES';
 
/*14. Se quiere saber cuántos platos se preparan en 10 minutos, cuantos en 15 y cuantos en 25. Muestra una lista agrupada con el tiempo de preparación 
y el número de platos que tardan ese tiempo. EL resultado debe estar ordenado por el tiempo de preparación de menor a mayor. nos esta diciendo una lista agrupada*/
select tiempo_preparacion,count(*) from platos group by tiempo_preparacion order by tiempo_preparacion;
 
/*15. Necesitamos una lista con el NOMBRE y la LOCALIDAD de los clientes, pero el NOMBRE debe tener todas las letras en mayúsculas y que no haya ningún 
espacio entre nombres compuestos. Ej.: PEDROJUAN.*/
select upper(replace(nombre,' ')),localidad from clientes;
 
/*16. Indica el valor medio del PRECIO de los platos con REDONDEO de dos decimales.*/
select round(avg(precio),2) from platos;
 
/*17. Indica el NOMBRE del plato más caro.es uno de subconsulta clasico*/
select nombre from platos where precio = (select max(precio) from platos);
 
/*18. Indica la lista de ingredientes (NOMBRE y CANTIDAD en 2 columnas diferentes) del plato "Entrante bacalao en aceite".*/
select ingredientes.nombre,cantidad from ingredientes_platos 
    join ingredientes on ingredientes.id = ingredientes_platos.id_ingrediente
    join platos on platos.id = ingredientes_platos.id_plato
    where platos.nombre = 'Entrante bacalao en aceite';
 
/*19. Indica la lista de ingredientes (NOMBRE) del plato "Tarta de queso".*/
select ingredientes.nombre from ingredientes_platos 
    join ingredientes on ingredientes.id = ingredientes_platos.id_ingrediente
    join platos on platos.id = ingredientes_platos.id_plato
    where platos.nombre = 'Tarta de queso';
 
/*20. Devuelve el NOMBRE y la CATEGORIA de los ingredientes que empiezan por "Pi".*/
select nombre,categoria from ingredientes where nombre like 'Pi%';
 
/*21. ¿Cuántos ingredientes pertenecen a la CATEGORIA de LACTEO? Indica tan solo el número.*/
 select count(*) from ingredientes where categoria = 'LACTEO';
 
/*22. ¿Cuánto dinero se ha obtenido del plato de ID = 5? Indica solo una columna con el importe con dos decimales. Recuerda que para obtener dinero de un plato, 
los comensales han debido de pagar la comanda, es decir, tener un estado COBRADO.*/
select * from comandas;
select * from platos;
select sum(precio) from comandas
    join platos on platos.id = comandas.id_plato
    where estado = 'COBRADO' and id_plato = 5;
 
/*23. ¿Cuál es el NOMBRE del ingrediente que se usa en más platos?*/
select * from ingredientes_platos;
select id_ingrediente,count(*) from ingredientes_platos group by id_ingrediente;

select nombre,count(*) from ingredientes_platos
    join ingredientes on ingredientes_platos.id_ingrediente
    group by nombre
    having count(*) = (select max(count(*)) from ingredientes_platos group by id_ingrediente;-- no me va abajo inda
    
select nombre,count(*) from ingredientes_platos 
    join ingredientes on ingredientes_platos.id_ingrediente 
    group by nombre
    having count(*) = (select max(count(*)) from ingredientes_platos group by id_ingrediente);

/*24. ¿En el NOMBRE de qué platos se usa el ingrediente "Aceite de oliva virgen extra"?*/
select platos.nombre from ingredientes_platos 
    join platos on platos.id = ingredientes_platos.id_plato
    join ingredientes on ingredientes.id = ingredientes_platos.id_ingrediente
    where ingredientes.nombre = 'Aceite de oliva virgen extra';
 
/*25. ¿Cuál es el nombre del plato que entró por comanda en COCINA el 01/03/21 a las 21:16?*/
-- foto no me sale
 
/*26. ¿Cuántas comandas, independientemente del estado de la comanda, hay registradas hasta ahora del plato "Entrante Crema de zanahorias"?*/
select * from comandas;
--Primera forma: join
select count(*)
    from comandas
    join platos on platos.id = comandas.id_plato
    where platos.nombre = 'Entrante Crema de zanahorias';
--Segunda forma: subconsulta
select count(*)
    from comandas
    where id_plato = (
        select id from platos where nombre = 'Entrante Crema de zanahorias');
 
/*27. Indica el nombre de los platos cuyo precio sea superior a 4 euros pero se tarde menos de 15 minutos en prepararse.*/
select nombre from platos where precio > 4 and tiempo_preparacion < 15;
 
/*28. Indica el nombre de cliente que ha DEVUELTO una comanda.*/
select clientes.nombre from comandas
    join clientes on clientes.id = comandas.id_cliente 
    where estado = 'DEVUELTO';
 
/*29. ¿Cuántas comandas se han SERVIDO a la mesa 1 entre las 21:20 y las 21:50?*/
select count(*) from comandas where estado = 'SERVIDO' and mesa = 1 and hora between '21:20' and '21:50';
 
/*30. Indica la CATEGORIA del ingrediente Perejil. Debes mostrar dicha categoría con el tamaño/número de caracteres que sea el tamaño de la categoría que tenga menos letras.
En este caso, es OTRO, que tiene 4 caracteres, pero no puedes usar el número 4, debes calcular en tu query ese tamaño mínimo.*/
select categoria from ingredientes where nombre='Perejil';
select min(length(categoria)) from ingredientes;

select substr(categoria,1,(select min(length(categoria)) from ingredientes)) 
    from ingredientes where nombre='Perejil';

/*31. Se quiere saber el nombre del cliente, el tiempo de preparación del plato que pidió, el nombre del ingrediente que se usa en mayor cantidad en dicho plato que pidió 
y la categoría de dicho ingrediente, para aquella comanda realizada en la mesa 1 que fue DEVUELTO.*/
select *from comandas;
select *from comandas
    join clientes on clientes.id = comandas.id_cliente
    join platos on platos.id = comandas.id_plato
    join ingredientes_platos on ingredientes_platos.id_plato = comandas.id_plato
    join ingredientes on ingredientes.id = ingredientes_platos.id_ingrediente
    where mesa = 1 and comandas.estado = 'DEVUELTO' and cantidad = (
        select max(cantidad) from comandas
        join ingredientes_platos on ingredientes_platos.id_plato = comandas.id_plato
        where mesa = 1 and comandas.estado = 'DEVUELTO'); --MAL
        
select clientes.nombre,platos.tiempo_preparacion,ingredientes.nombre,ingredientes.categoria from comandas
    join clientes on clientes.id = comandas.id_cliente
    join platos on platos.id = comandas.id_plato
    join ingredientes_platos on ingredientes_Platos.id_plato = comandas.id_plato
    join ingredientes on ingredientes.id = ingredientes_platos.id_ingrediente
    where mesa = 1 and comandas.estado = 'DEVUELTO' and cantidad = (
        select max(cantidad) from comandas
        join ingredientes_platos on ingredientes_Platos.id_plato = comandas.id_plato
        where mesa = 1 and comandas.estado = 'DEVUELTO');--INDA
 
/*32. Se quiere mostrar una lista con todos los ingredientes en una columna, y en otra columna la suma de la cantidad empleada por cada ingrediente en los distintos platos.*/
SELECT SUM(CANTIDAD) FROM INGREDIENTES_PLATOS;
SELECT NOMBRE,SUM(CANTIDAD) FROM INGREDIENTES_PLATOS
    JOIN INGREDIENTES ON INGREDIENTES.ID = ingredientes_platos.id_ingrediente
    GROUP BY NOMBRE;

select nombre,sum(cantidad) 
    from ingredientes_platos
    join ingredientes on ingredientes.id = ingredientes_platos.id_ingrediente
    group by nombre;