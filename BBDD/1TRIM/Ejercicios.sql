--Ejercicio1
drop table coches cascade constraints;
create table coches(
    id int primary key,
    Modelo varchar(100),
    Marca varchar(50),
    CV int,
    Consumo100 number
);
--Ejercicio2
drop table compras cascade CONSTRAINTS;
create table compras(
    id int primary key,
    cliente varchar(100),
    fechaCompra date,
    idCoche int,
    FOREIGN KEY (idCoche) references
COCHES(id)
);
--Ejercicio3
drop table piezas cascade CONSTRAINTS;
create table piezas(
    codigo int,
    idAlmacen int,
    nombre varchar(50),
    peso number
);
alter table piezas add primary key (codigo,idAlmacen);
--Ejercicio4
drop table coches;
--Ejercicio5
alter table coches drop constraint SYS_C008422;
alter table compras drop constraint SYS_C008424;

