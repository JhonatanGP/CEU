drop table productos cascade constraints;
create table Productos (
    Referencia char(5),
    nombre varchar2(50),
    tipo varchar2(10),
    material varchar2(50),
    color varchar2(25),
    precio number(5,2)
);
alter table productos add id_fabricante int;
alter table productos drop column id_fabricante;
alter table productos rename column id_fabricante to id_fabric;
