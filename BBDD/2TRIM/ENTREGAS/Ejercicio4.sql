drop table plantas cascade constraints;
create table plantas(
    referencia char(9) primary key ,
    nombre varchar2(30) ,
    familia varchar2(30),
    flor varchar2(30) ,
    proveedor varchar2(30) ,
    precio int,
    stock int
);
drop table socios cascade constraints;
create table socios(
    numero char(8) primary key ,
    nombre varchar2(30),
    apellidos varchar2(30),
    direccion varchar2(30),
    codigo_postal int,
    localidad varchar2(30),
    provincia varchar2(30),
    telefono number(9),
    email varchar2(70)
);
drop table compras cascade constraints;
create table compras(
    referencia int primary key,
    identificador_cliente char(8),
    identificador_planta char(9),
    fecha_compra date,
    forma_pago varchar2(30),
    socio varchar2(30) 
);
alter table plantas add check (regexp_like(referencia, 'R[0-9][0-9][0-9]-2023'));
alter table plantas add check(regexp_like(flor,'Si')or regexp_like(flor,'No'));
alter table plantas add check(precio>0);
alter table plantas add check(stock>0);
insert into plantas values ('R123-2023', 'planta1', 'familia1', 'Si', 'proveedor1', 10, 100); 
insert into plantas values ('R456-2023', 'planta2', 'familia1', 'Si', 'proveedor2', 10, 100);
insert into plantas values ('R789-2023', 'planta3', 'familia2', 'No', 'proveedor3', 10, 100); 

alter table socios add check(regexp_like(numero, 'SOC[0-9][0-9][0-9][0-9][0-9]'));
insert into socios (numero) values ('SOC00001');
insert into socios (numero) values ('SOC00002');

alter table compras add foreign key(identificador_cliente) references socios(numero);
alter table compras add foreign key(identificador_planta) references plantas(referencia);
insert into compras values (1, 'SOC00001', 'R123-2023', '02-09-2023', 'efectivo', 'socio');
insert into compras values (2, 'SOC00002', 'R456-2023', '10-12-2023', 'efectivo', 'socio');
insert into compras values (3, 'SOC00002', 'R789-2023', '19-02-2023', 'efectivo', 'socio');
insert into compras values (4, null,'R002-2023', '14-08-2023', 'efectivo', 'nosocio');

update plantas set flor='Si' where plantas.referencia='R789-2023';
update socios set email='correo@gmail.com' where socios.numero='SOC00001';
delete from compras where socio='nosocio';
