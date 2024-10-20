drop table productos cascade constraints;
drop table clientes cascade constraints;
drop table pedidos cascade constraints;
drop table provincias cascade constraints;
--1
create table productos(
    id int,
    nombre varchar2(100),
    tipo varchar2(50)
);
--2
create table clientes(
    codigo int,
    nombre varchar2(50),
    fecha_nacimiento date
);
--3
create table pedidos(
    id_producto int,
    id_cliente int,
    fecha_compra date
);
--4
alter table productos add primary key(id);
alter table clientes add primary key(codigo);
alter table pedidos add primary key(id_producto,id_cliente);
--5
alter table pedidos add constraint fk_pedidos_productos foreign key(id_producto) references productos(id);
--6
alter table pedidos add constraint fk_pedidos_clientes foreign key(id_cliente) references clientes(codigo);
--7
alter table pedidos drop constraint fk_pedidos_productos;
rename productos to products;
alter table pedidos add constraint fk_pedidos_productos foreign key(id_producto) references products(id);
--8
alter table pedidos rename constraint fk_pedidos_clientes to fk_ped_cli;
--9
alter table clientes add provincia varchar(50);
--10
alter table clientes rename column provincia to id_provincia;
alter table clientes modify id_provincia int;
--11
create table provincias(
    id int,
    nombre varchar2(50)
);
--12
alter table provincias add constraint pk_provincias primary key(id);
--13
alter table clientes add foreign key(id_provincia) references provincias(id);
--14
alter table products add check (tipo in ('NUEVO','SEGUNDAMANO','RESTAURADO','DETERIORADO'));
--15
alter table pedidos add importe number(6,2) check(importe>=0);
--16
alter table clientes add referencia_socio char(5) check(regexp_like(referencia_socio,'CO-[0-9][0-9]'));

