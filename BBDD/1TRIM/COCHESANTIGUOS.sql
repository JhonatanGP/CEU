drop table coches cascade constraints;
create table coches(
    id int,
    matricula varchar(10),
    num_cilindros int,
    num_ruedas int,
    nuevocampo varchar2(50),
    id_marca int --spoiler, será fk en el futuro
);
--Hemos decidido que PK sea id
alter table coches
    add constraint idcoche primary key(id);
--Quiero hacer lo mismo de antes pero más rápido, me da igual el nombre de la restricción
drop table coches cascade constraints;
create table coches(
    id int,
    matricula varchar(10),
    num_cilindros int,
    num_ruedas int,
    nuevocampo varchar2(50),
    id_marca int --spoiler, será fk en el futuro
);
alter table coches
    add primary key(id);
drop table coches cascade constraints;
create table coches(
    id int primary key,
    matricula varchar(10),
    num_cilindros int,
    num_ruedas int,
    nuevocampo varchar2(50),
    id_marca int --spoiler, será fk en el futuro
);
drop table coches cascade constraints;
create table coches(
    id int,
    matricula varchar(10),
    num_cilindros int,
    num_ruedas int,
    nuevocampo varchar2(50),
    id_marca int, --spoiler, será fk en el futuro
    primary key(id,matricula)
);
create table marcas(
    referencia int primary key,
    nombre varchar2(100)
);
--¿como se hace una FK?
--1º el campo de FK de una tabla tiene que ser PK en otra
--¿PK? referencia es PK en marcas
--¿FK? id_marca es un FK en coches porque es el mismocampo que referencias en marcas, donde es Pk 
alter table coches 
    add foreign key (id_marca) references marcas (referencias);
alter table coches 
    add constraint nombredefk foreign key  (id_marca) references marcas (referencias);
create table coches(
    id int,
    matricula varchar(10),
    num_cilindros int,
    num_ruedas int,
    nuevocampo varchar2(50),
    id_marca int, --spoiler, será fk en el futuro
    primary key(id,matricula),
    foreign key (id_marca) references marcas (referencia)
);
    rename coches to cochesAntigua;