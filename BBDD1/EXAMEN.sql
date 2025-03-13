drop table platos cascade constraints;
drop table ingredientes cascade constraints;
drop table ingredientes_platos cascade constraints;
drop table clientes cascade constraints;
drop table comandas cascade constraints;
create table platos (
    id int primary key,
    nombre varchar(100) not null,
    precio number(6,2),
    tiempo_preparacion int
);
create table ingredientes(
    id int primary key,
    nombre varchar(100) not null,
    categoria varchar(30) check(categoria in ('CARNE','PESCADO','CONDIMENTO','FRUTA','VERDURA','LACTEO','BEBIDA','LEGUMBRE','OTRO')),
    estado varchar(30) check( estado in ('SOLIDO','LIQUIDO'))
);
create table ingredientes_platos(
    id_ingrediente int,
    id_plato int,
    cantidad int
);
alter table ingredientes_platos
add foreign key (id_ingrediente) references ingredientes(id);
alter table ingredientes_platos
add foreign key (id_plato) references platos(id);
create table clientes(
    id int primary key,
    nombre varchar(100) not null,
    telefono varchar(10),
    localidad varchar(100) not null
);
create table comandas(
    id int primary key,
    mesa int,
    id_cliente int,
    id_plato int,
    estado varchar(30) check( estado in ('COCINA','SERVIDO','COBRADO','DEVUELTO')),
    fecha date,
    hora char(5)
);
alter table comandas
add foreign key (id_cliente) references clientes(id);
alter table comandas
add foreign key (id_plato) references platos(id);

insert into platos values (1,'Plato Arroz caldoso',12.50,25);
insert into platos values (2,'Plato Calamares con patatas',7.50,15);
insert into platos values (3,'Entrante bacalao en aceite',4.50,10);
insert into platos values (4,'Entrante Crema de zanahorias',3,10);
insert into platos values (5,'Tarta de queso',5.50,10);

insert into ingredientes values (1,'Ajo','VERDURA','SOLIDO');
insert into ingredientes values (2,'Aceite de oliva virgen extra','CONDIMENTO','LIQUIDO');
insert into ingredientes values (3,'Cebolla','VERDURA','SOLIDO');
insert into ingredientes values (4,'Calamar','PESCADO','SOLIDO');
insert into ingredientes values (5,'Patata','VERDURA','SOLIDO');
insert into ingredientes values (6,'Pimiento','VERDURA','SOLIDO');
insert into ingredientes values (7,'Vino blanco','BEBIDA','LIQUIDO');
insert into ingredientes values (8,'Sal','CONDIMENTO','SOLIDO');
insert into ingredientes values (9,'Pimienta','CONDIMENTO','SOLIDO');
insert into ingredientes values (10,'Costilla de cerdo','CARNE','SOLIDO');
insert into ingredientes values (11,'Guisante','VERDURA','SOLIDO');
insert into ingredientes values (12,'Tomate','VERDURA','SOLIDO');
insert into ingredientes values (13,'Pimenton dulce','CONDIMENTO','SOLIDO');
insert into ingredientes values (14,'Agua','BEBIDA','LIQUIDO');
insert into ingredientes values (15,'Caldo de ave','BEBIDA','LIQUIDO');
insert into ingredientes values (16,'Arroz','LEGUMBRE','SOLIDO');
insert into ingredientes values (17,'Bacalao','PESCADO','SOLIDO');
insert into ingredientes values (18,'Guindilla','CONDIMENTO','SOLIDO');
insert into ingredientes values (19,'Perejil','CONDIMENTO','SOLIDO');
insert into ingredientes values (20,'Zanahoria','VERDURA','SOLIDO');
insert into ingredientes values (21,'Caldo de verduras','CONDIMENTO','LIQUIDO');
insert into ingredientes values (22,'Nata liquida','LACTEO','LIQUIDO');
insert into ingredientes values (23,'Queso mascarpone','LACTEO','SOLIDO');
insert into ingredientes values (24,'Leche','LACTEO','SOLIDO');
insert into ingredientes values (25,'Esencia vainilla','CONDIMENTO','LIQUIDO');
insert into ingredientes values (26,'Huevo','OTRO','SOLIDO');
insert into ingredientes values (27,'Harina','OTRO','SOLIDO');
insert into ingredientes values (28,'Frutos rojos','FRUTA','SOLIDO');

insert into ingredientes_platos values (1,1,3);
insert into ingredientes_platos values (2,1,30);
insert into ingredientes_platos values (10,1,300);
insert into ingredientes_platos values (11,1,60);
insert into ingredientes_platos values (12,1,40);
insert into ingredientes_platos values (13,1,5);
insert into ingredientes_platos values (14,1,250);
insert into ingredientes_platos values (15,1,400);
insert into ingredientes_platos values (6,1,80);
insert into ingredientes_platos values (8,1,10);
insert into ingredientes_platos values (16,1,150);
insert into ingredientes_platos values (4,2,400);
insert into ingredientes_platos values (2,2,40);
insert into ingredientes_platos values (3,2,100);
insert into ingredientes_platos values (1,2,10);
insert into ingredientes_platos values (5,2,120);
insert into ingredientes_platos values (6,2,80);
insert into ingredientes_platos values (7,2,120);
insert into ingredientes_platos values (8,2,12);
insert into ingredientes_platos values (9,2,8);
insert into ingredientes_platos values (17,3,125);
insert into ingredientes_platos values (1,3,5);
insert into ingredientes_platos values (18,3,2);
insert into ingredientes_platos values (2,3,20);
insert into ingredientes_platos values (19,3,2);
insert into ingredientes_platos values (3,4,25);
insert into ingredientes_platos values (20,4,60);
insert into ingredientes_platos values (21,4,250);
insert into ingredientes_platos values (22,4,50);
insert into ingredientes_platos values (8,4,5);
insert into ingredientes_platos values (9,4,5);
insert into ingredientes_platos values (2,4,15);
insert into ingredientes_platos values (2,5,3);
insert into ingredientes_platos values (23,5,60);
insert into ingredientes_platos values (24,5,20);
insert into ingredientes_platos values (25,5,1);
insert into ingredientes_platos values (26,5,10);
insert into ingredientes_platos values (27,5,10);
insert into ingredientes_platos values (28,5,20);

insert into clientes values (1,'Pedro Juan','111222333','Bormujos');
insert into clientes values (2,'Jose Miguel','222333444','Bormujos');
insert into clientes values (3,'Maria','333444555','Gines');

insert into comandas values (1,1,1,3,'COCINA','01-03-2021','21:00');
insert into comandas values (2,1,1,1,'COCINA','01-03-2021','21:00');
insert into comandas values (3,2,2,3,'COCINA','01-03-2021','21:05');
insert into comandas values (4,2,2,4,'COCINA','01-03-2021','21:05');
insert into comandas values (5,1,1,3,'SERVIDO','01-03-2021','21:10');
insert into comandas values (6,2,2,3,'SERVIDO','01-03-2021','21:15');
insert into comandas values (7,2,2,4,'SERVIDO','01-03-2021','21:16');
insert into comandas values (8,2,2,2,'COCINA','01-03-2021','21:16');
insert into comandas values (9,1,1,1,'SERVIDO','01-03-2021','21:25');
insert into comandas values (10,1,1,5,'COCINA','01-03-2021','21:25');
insert into comandas values (11,2,2,5,'COCINA','01-03-2021','21:26');
insert into comandas values (12,2,2,2,'SERVIDO','01-03-2021','21:35');
insert into comandas values (13,1,1,5,'SERVIDO','01-03-2021','21:37');
insert into comandas values (14,2,2,5,'SERVIDO','01-03-2021','21:38');
insert into comandas values (15,1,1,3,'COBRADO','01-03-2021','21:50');
insert into comandas values (16,1,1,1,'COBRADO','01-03-2021','21:50');
insert into comandas values (17,1,1,5,'COBRADO','01-03-2021','21:50');
insert into comandas values (18,1,2,3,'COBRADO','01-03-2021','21:50');
insert into comandas values (19,1,2,4,'COBRADO','01-03-2021','21:50');
insert into comandas values (20,1,2,2,'COBRADO','01-03-2021','21:50');
insert into comandas values (21,1,2,5,'COBRADO','01-03-2021','21:50');
insert into comandas values (22,1,3,3,'COCINA','02-03-2021','21:05');
insert into comandas values (23,1,3,1,'COCINA','02-03-2021','21:10');
insert into comandas values (24,1,3,2,'COCINA','02-03-2021','21:12');
insert into comandas values (25,1,3,1,'DEVUELTO','02-03-2021','21:12');
insert into comandas values (26,1,3,3,'SERVIDO','02-03-2021','21:15');
insert into comandas values (27,1,3,2,'SERVIDO','02-03-2021','21:27');
insert into comandas values (28,1,3,5,'COCINA','02-03-2021','21:27');
insert into comandas values (29,1,3,5,'SERVIDO','02-03-2021','21:37');
insert into comandas values (30,1,3,3,'COBRADO','02-03-2021','21:55');
insert into comandas values (31,1,3,2,'COBRADO','02-03-2021','21:55');
insert into comandas values (32,1,3,5,'COBRADO','02-03-2021','21:55');


select * from platos;
select * from ingredientes;
select * from ingredientes_platos;
select * from clientes;
select * from comandas;

--1. ¿Cuál es la categoría de ingrediente (carne, pescado, etc.) que se usa en mayor cantidad en los platos del restaurante?
select categoria,sum(cantidad) from ingredientes join ingredientes_platos on ingredientes.id = ingredientes_platos.id_ingrediente group by categoria
    having sum(cantidad) = (select max(sum(cantidad)) from ingredientes_platos join ingredientes on ingredientes_platos.id_ingrediente = ingredientes.id
    group by categoria);
    
SELECT CATEGORIA, SUM(CANTIDAD) FROM ingredientes 
    JOIN ingredientes_platos ON INGREDIENTES.ID = INGREDIENTES_PLATOS.ID_INGREDIENTE GROUP BY CATEGORIA 
    having sum(cantidad) = (SELECT MAX(SUM(CANTIDAD)) FROM ingredientes_platos 
    JOIN ingredientes ON INGREDIENTES.ID = INGREDIENTES_PLATOS.ID_INGREDIENTE GROUP BY CATEGORIA);
    
/*2. Queremos el primer nombre de todos los clientes que tienen 333 en alguna parte de su teléfono. Debe ir completamente en mayúsculas. 
No deben haber espacios en blanco al principio o al final del nombre en el resultado final.*/
select upper(trim(substr(nombre,1,instr(nombre||' ',' ')))) from clientes where telefono like '%333%';
select upper(trim(substr(nombre,instr(nombre,' ')))) from clientes where telefono like '%333%';
select upper(replace(substr(nombre,1,instr(nombre||' ',' ')),' ')) from clientes where telefono like '%333%';

/*3. Se quiere mostrar todos los nombres de los ingredientes que empiecen por una letra consonante, con todas sus letras en mayúsculas, 
y cuyo estado sea LIQUIDO.*/
select upper(nombre) from ingredientes where substr(nombre,1,1) not in ('A','E','I','O','U') and estado = 'LIQUIDO';

/*4. ¿Cuál es la diferencia de cantidad que hay entre el ingrediente que se usa en mayor cantidad y el que se usa en menos? 
Expresa el valor añadiendo al final "gramos". Añade el alias de columna "Diferencia" al resultado.*/
select max(cantidad)-min(cantidad)||' gramos' "Diferencia" from ingredientes_platos;


/*5. Se quiere mostrar el nombre de los platos pero con un formato distinto. Se quiere quitar las palabras "Plato" y "Entrante", debe estar la 
primera letra en mayúsculas de cada palabra, y se debe incluir un punto y final al terminar de mostrar el nombre del plato. No debe quedar ningún
espacio ni al principio ni al final del nombre del plato.*/
select initcap(trim(replace(replace(nombre,'Plato',''),'Entrante','')))||'.' "Nombre" from platos;

--6. ¿Qué nombre de platos se sirvieron (estado SERVIDO en COMANDAS), sin repetir, el 1 de marzo de 2021 entre las 21 y las 21:30 horas?
select distinct(nombre),estado,fecha,hora from platos join comandas on platos.id = comandas.id_plato 
    where estado = 'SERVIDO' and fecha = '01-03-2021' and hora between '21:00' and '21:30';
    
--7. Se quiere una lista con el nombre en minúsculas de todos los ingredientes que sean CONDIMENTO y se encuentren en estado SOLIDO.
select lower(nombre),categoria,estado from ingredientes where categoria= 'CONDIMENTO' and estado = 'SOLIDO';

--8. Se quiere saber todas las categorías (CATEGORIA) de ingredientes que haya sin repetir resultado ordenadas en orden de la z a la a.
select distinct(categoria) from ingredientes order by categoria desc;

--9. Se quiere saber cuántas comandas se realizaron entre las 21:00 y las 21:10 horas (ambas inclusive) el día 01/03/21.
select count(*) from comandas where hora between '21:00' and '21:10' and fecha = '01-03-21';

/*10. Muestra el nombre, teléfono y localidad de los clientes que viva en Bormujos y su teléfono no empiece por 1. Debes usar alias para nombrar 
las tres columnas, la primera será "Cliente", la segunda "Tfno" y la tercera "Loc".*/

select nombre"Cliente",telefono"Tfno",localidad"Loc" from clientes where localidad = 'Bormujos' and telefono not like '1%';

--11. Muestra todos los datos de la tabla ingredientes en mayúsculas y que se encuentren en estado SOLIDO.
select upper(id),upper(nombre),upper(categoria),upper(estado) from ingredientes where estado = 'SOLIDO';

--12. Ingrediente cuyo nombre tiene más caracteres? Pon en una única columna el nombre del ingrediente: número de caracteres. Ej.: Guisante: 8
select nombre||': '|| length(nombre) from ingredientes where length(nombre) = (select max(length(nombre)) from ingredientes);

--13. ¿Cuántas comandas se han hecho en MARTES? Debe dar 11.
select count(*) from comandas where trim(to_char(fecha,'DAY')) = 'MARTES';

/*14. Cuántos platos se preparan en 10 minutos, cuantos en 15 y cuantos en 25. Muestra una lista agrupada con el tiempo de preparación 
y el número de platos que tardan ese tiempo. EL resultado debe estar ordenado por el tiempo de preparación de menor a mayor.*/
select tiempo_preparacion,count(tiempo_preparacion) from platos group by tiempo_preparacion order by tiempo_preparacion asc;

/*15. Lista con el NOMBRE y la LOCALIDAD de los clientes, pero el NOMBRE debe tener todas las letras en mayúsculas y que no haya ningún 
espacio entre nombres compuestos. Ej.: PEDROJUAN.*/
select upper(replace(nombre,' ','')), localidad from clientes;

--16. Indica el valor medio del PRECIO de los platos con REDONDEO de dos decimales.
select to_char(round(avg(precio),2),'9.00L')"PRECIO" from platos;
SELECT TRIM(TO_CHAR(ROUND(AVG(PRECIO),2),'9.00L'))"PRECIO" FROM PLATOS;

--17. Indica el NOMBRE del plato más caro.
select nombre,to_char(precio,'99.00L')"PRECIO" from platos where precio = (select max(precio) from platos);

--18. Indica la lista de ingredientes (NOMBRE y CANTIDAD en 2 columnas diferentes) del plato "Entrante bacalao en aceite".
select ingredientes.nombre, ingredientes_platos.cantidad from ingredientes 
    join ingredientes_platos on ingredientes.id = ingredientes_platos.id_ingrediente
    join platos on ingredientes_platos.id_plato = platos.id where platos.nombre = 'Entrante bacalao en aceite';

--19. Indica la lista de ingredientes (NOMBRE) del plato "Tarta de queso".
select ingredientes.nombre from ingredientes 
    join ingredientes_platos on ingredientes.id = ingredientes_platos.id_ingrediente
    join platos on ingredientes_platos.id_plato = platos.id where platos.nombre = 'Tarta de queso';

--20. Devuelve el NOMBRE y la CATEGORIA de los ingredientes que empiezan por "Pi".

select nombre,categoria from ingredientes where nombre like 'Pi%';

--21. ¿Cuántos ingredientes pertenecen a la CATEGORIA de LACTEO? Indica tan solo el número.
select count(*) from ingredientes where categoria = 'LACTEO';

/*22. ¿Cuánto dinero se ha obtenido del plato de ID = 5? Indica solo una columna con el importe con dos decimales. Recuerda que para 
obtener dinero de un plato, los comensales han debido de pagar la comanda, es decir, tener un estado COBRADO.*/
select * from ingredientes_platos;
select * from  platos;
select sum(precio) from platos join comandas on platos.id = comandas.id_plato where id_plato = 5 and estado = 'COBRADO';

--23. ¿Cuál es el NOMBRE del ingrediente que se usa en más platos?

--24. ¿En el NOMBRE de qué platos se usa el ingrediente "Aceite de oliva virgen extra"?

--25. ¿Cuál es el nombre del plato que entró por comanda en COCINA el 01/03/21 a las 21:16?

--26. ¿Cuántas comandas, independientemente del estado de la comanda, hay registradas hasta ahora del plato "Entrante Crema de zanahorias"?

--27. Indica el nombre de los platos cuyo precio sea superior a 4 euros pero se tarde menos de 15 minutos en prepararse.

--28. Indica el nombre de cliente que ha DEVUELTO una comanda.

--29. ¿Cuántas comandas se han SERVIDO a la mesa 1 entre las 21:20 y las 21:50?

/*30. Indica la CATEGORIA del ingrediente Perejil. Debes mostrar dicha categoría con el tamaño/número de caracteres que sea el tamaño de la 
categoría que tenga menos letras. En este caso, es OTRO, que tiene 4 caracteres, pero no puedes usar el número 4, debes calcular en tu query 
ese tamaño mínimo.*/

/*31. Se quiere saber el nombre del cliente, el tiempo de preparación del plato que pidió, el nombre del ingrediente que se usa en mayor 
cantidad en dicho plato que pidió y la categoría de dicho ingrediente, para aquella comanda realizada en la mesa 1 que fue DEVUELTO.*/

/*32. Se quiere mostrar una lista con todos los ingredientes en una columna, y en otra columna la suma de la cantidad empleada por cada
ingrediente en los distintos platos.*/