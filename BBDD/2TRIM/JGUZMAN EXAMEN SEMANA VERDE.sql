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

--correctas: 6,9,11,13,15,19,24,26,27,30
--1 error: 1,3,7,12,16,20
-- mal: 2,4,5,8,10,14,17,18,21,22,23,25,28,29,31,32

--1 BIEN --1 error: 1,3,7,12,16,20
SELECT * FROM COMANDAS;
SELECT HORA FROM COMANDAS WHERE MESA = 2;

--2 REVISAR -- mal: 2,4,5,8,10,14,17,18,21,22,23,25,28,29,31,32
SELECT * FROM CLIENTES;
SELECT * FROM COMANDAS;
SELECT DISTINCT CLIENTES.LOCALIDAD FROM CLIENTES JOIN COMANDAS ON CLIENTES.ID = COMANDAS.ID_CLIENTE;

--3 BIEN --1 error: 1,3,7,12,16,20
SELECT * FROM CLIENTES;
SELECT DISTINCT CLIENTES.TELEFONO FROM CLIENTES JOIN COMANDAS ON CLIENTES.ID = COMANDAS.ID_CLIENTE WHERE HORA = '21:27';

--4 REVISAR -- mal: 2,4,5,8,10,14,17,18,21,22,23,25,28,29,31,32
select * from ingredientes;
SELECT NOMBRE FROM INGREDIENTES ;

--5 REVISAR -- mal: 2,4,5,8,10,14,17,18,21,22,23,25,28,29,31,32
SELECT SUBSTR(NOMBRE,5,7) FROM INGREDIENTES;

--6 BIEN --correctas: 6,9,11,13,15,19,24,26,27,30
SELECT COUNT(*) FROM INGREDIENTES WHERE LENGTH(NOMBRE) > 10;

--7  --1 error: 1,3,7,12,16,20
SELECT * FROM PLATOS;
SELECT LOWER(NOMBRE)"NOMBRE" FROM PLATOS WHERE NOMBRE IN ('%p','%r','%a','%s','%t') AND PRECIO < 10 AND tiempo_preparacion > 7;-- intente este pero no me sale 
SELECT LOWER(NOMBRE)"NOMBRE" FROM PLATOS WHERE NOMBRE not like '%e' AND PRECIO < 10 AND tiempo_preparacion > 7; -- este lo intente pero no se me quita el que empieca la e

--8 BIEN -- mal: 2,4,5,8,10,14,17,18,21,22,23,25,28,29,31,32
SELECT * FROM PLATOS;
SELECT *FROM COMANDAS;
SELECT PLATOS.PRECIO FROM PLATOS JOIN COMANDAS ON PLATOS.ID = COMANDAS.ID_PLATO WHERE FECHA ='010321' AND HORA = '21:10';

--9 BIEN --correctas: 6,9,11,13,15,19,24,26,27,30
SELECT * FROM INGREDIENTES;
SELECT UPPER(NOMBRE) FROM INGREDIENTES WHERE ESTADO = 'LIQUIDO';
SELECT UPPER(REPLACE(NOMBRE,' ')) FROM INGREDIENTES WHERE ESTADO = 'LIQUIDO';

--10 REVISAR TENGO QUE UTILIZAR MÁS DE UN JOIN  COMANDAS.ID_PLATO, COMANDAS.ID_CLIENTE Y  
-- mal: 2,4,5,8,10,14,17,18,21,22,23,25,28,29,31,32
SELECT * FROM CLIENTES,PLATOS,COMANDAS;
SELECT CLIENTES.NOMBRE,PLATOS.NOMBRE FROM CLIENTES JOIN PLATOS ON ;

--11 BIEN --correctas: 6,9,11,13,15,19,24,26,27,30
SELECT * FROM COMANDAS,PLATOS;
SELECT TRUNC(SUM(PLATOS.PRECIO),0) FROM PLATOS JOIN COMANDAS ON PLATOS.ID = COMANDAS.ID_PLATO;

--12 BIEN --1 error: 1,3,7,12,16,20
SELECT * FROM INGREDIENTES;
SELECT  'El ingrediente con más letras es '|| nombre "NOMBRE",LENGTH(NOMBRE) "LETRAS" FROM INGREDIENTES WHERE NOMBRE = (SELECT MAX(NOMBRE) FROM INGREDIENTES);

--13 BIEN HE PUESTO EL DISTINCT PARA QUE NO SE REPITAN LOS PLATOS --correctas: 6,9,11,13,15,19,24,26,27,30
SELECT  DISTINCT PLATOS.NOMBRE FROM INGREDIENTES 
    JOIN INGREDIENTES_PLATOS ON INGREDIENTES.ID = INGREDIENTES_PLATOS.ID_INGREDIENTE
    JOIN PLATOS ON INGREDIENTES_PLATOS.ID_PLATO = PLATOS.ID 
    WHERE INGREDIENTES.CATEGORIA = 'VERDURA';

SELECT PLATOS.NOMBRE FROM PLATOS JOIN INGREDIENTES ON PLATOS.ID = INGREDIENTES.ID WHERE INGREDIENTES.CATEGORIA = 'VERDURA';

--REVISAR CON INDA    
--14 BIEN -- mal: 2,4,5,8,10,14,17,18,21,22,23,25,28,29,31,32
SELECT  UPPER(CLIENTES.NOMBRE)"NOMBRE" FROM CLIENTES JOIN COMANDAS ON CLIENTES.ID = COMANDAS.ID_CLIENTE WHERE FECHA = '010321' AND HORA BETWEEN '21:20' AND '21:40' AND ESTADO = 'COCINA';

--15 BIEN --correctas: 6,9,11,13,15,19,24,26,27,30
SELECT * FROM PLATOS;
SELECT INITCAP(NOMBRE)"NOMBRE" FROM PLATOS WHERE PRECIO BETWEEN 5 AND 8;

--16 BIEN --1 error: 1,3,7,12,16,20
SELECT DISTINCT INGREDIENTES.CATEGORIA FROM INGREDIENTES 
    JOIN INGREDIENTES_PLATOS ON INGREDIENTES.ID = INGREDIENTES_PLATOS.ID_INGREDIENTE
    JOIN PLATOS ON INGREDIENTES_PLATOS.ID_PLATO = PLATOS.ID 
    WHERE PLATOS.ID = 2;
    
--17 REVISAR  -- mal: 2,4,5,8,10,14,17,18,21,22,23,25,28,29,31,32
SELECT * FROM COMANDAS;
SELECT LOWER(ESTADO) FROM COMANDAS ORDER BY ESTADO DESC;-- FALTA QUE NO SE REPITA
SELECT DISTINCT(ESTADO) FROM COMANDAS ORDER BY ESTADO DESC;-- ME FALTA PONERLO EN MINUS
SELECT DISTINCT(LOWER(ESTADO)) FROM COMANDAS ORDER BY ESTADO DESC;--NO

--18 -- mal: 2,4,5,8,10,14,17,18,21,22,23,25,28,29,31,32
SELECT NOMBRE FROM INGREDIENTES WHERE NOMBRE IN ('G%','P%'); -- NO ME SALE, ME FALTA ALGO
SELECT NOMBRE FROM INGREDIENTES WHERE NOMBRE LIKE 'P%';

--19 --correctas: 6,9,11,13,15,19,24,26,27,30
SELECT COUNT (*) FROM INGREDIENTES WHERE CATEGORIA = 'VERDURA' AND NOMBRE LIKE 'P%';

--20  --1 error: 1,3,7,12,16,20 revisar?
SELECT * FROM INGREDIENTES_PLATOS;
SELECT  platos.nombre "Plato",ingredientes_platos.cantidad "Cant" FROM INGREDIENTES 
    JOIN INGREDIENTES_PLATOS ON INGREDIENTES.ID = INGREDIENTES_PLATOS.ID_INGREDIENTE
    JOIN PLATOS ON INGREDIENTES_PLATOS.ID_PLATO = PLATOS.ID 
    WHERE INGREDIENTES.NOMBRE = 'Cebolla' AND INGREDIENTES_PLATOS.ID_INGREDIENTE = 3; 

--REVISAR CON INDA    
--21 -- mal: 2,4,5,8,10,14,17,18,21,22,23,25,28,29,31,32
SELECT COUNT(*) FROM COMANDAS WHERE HORA BETWEEN '21:00' AND '21:10' AND FECHA = '010321';

--REVISAR CON INDA
--22 -- mal: 2,4,5,8,10,14,17,18,21,22,23,25,28,29,31,32
SELECT MAX(PLATOS.PRECIO) FROM PLATOS JOIN COMANDAS ON PLATOS.ID = COMANDAS.ID_PLATO WHERE ESTADO = 'SERVIDO' AND FECHA = '010321';

--23 -- mal: 2,4,5,8,10,14,17,18,21,22,23,25,28,29,31,32


--24 --correctas: 6,9,11,13,15,19,24,26,27,30
SELECT ROUND(AVG(CANTIDAD),3) FROM INGREDIENTES_PLATOS;

--REVISAR CON INDA
--25 -- mal: 2,4,5,8,10,14,17,18,21,22,23,25,28,29,31,32 
SELECT PLATOS.NOMBRE FROM PLATOS JOIN COMANDAS ON PLATOS.ID = COMANDAS.ID_PLATO WHERE COMANDAS.ESTADO = 'SERVIDO' AND FECHA = '010321' AND HORA = '21:25';

--26 --correctas: 6,9,11,13,15,19,24,26,27,30
SELECT TIEMPO_PREPARACION FROM PLATOS WHERE PRECIO = (SELECT MIN(PRECIO) FROM PLATOS);

--27 --correctas: 6,9,11,13,15,19,24,26,27,30
SELECT NOMBRE, LOCALIDAD FROM CLIENTES WHERE NOMBRE LIKE '%n';

--28 -- mal: 2,4,5,8,10,14,17,18,21,22,23,25,28,29,31,32
SELECT ;

--29 -- mal: 2,4,5,8,10,14,17,18,21,22,23,25,28,29,31,32
SELECT * FROM PLATOS;
SELECT * FROM INGREDIENTES_PLATOS;

SELECT  INGREDIENTES.nombre FROM INGREDIENTES 
    JOIN INGREDIENTES_PLATOS ON INGREDIENTES.ID = INGREDIENTES_PLATOS.ID_INGREDIENTE
    JOIN PLATOS ON INGREDIENTES_PLATOS.ID_PLATO = PLATOS.ID 
    WHERE PLATOS.ID = 3 ; --ME FALTA LA CANTIDAD

--30 --correctas: 6,9,11,13,15,19,24,26,27,30
SELECT COUNT(*)  FROM CLIENTES JOIN COMANDAS ON CLIENTES.ID = COMANDAS.ID_CLIENTE WHERE NOMBRE = 'Jose Miguel';

--31 -- mal: 2,4,5,8,10,14,17,18,21,22,23,25,28,29,31,32
SELECT NOMBRE FROM INGREDIENTES WHERE CATEGORIA = 'CONDIMENTO';
