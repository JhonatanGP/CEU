drop table equipos cascade constraints;
create table equipos(
    nombre varchar2 (50), --pk
    ano_fundacion int,
    patrocinador varchar2 (100),
    num_empleados int
);
drop table estadios cascade constraints;
create table estadios(
    nombre varchar2 (50),
    aforo int,
    fecha_construccion date,
    compartido char (2),
    nombre_equipo varchar2 (50)
);
alter table equipos add primary key (nombre);
alter table estadios add primary key (nombre, fecha_construccion);
alter table estadios add constraint fk_estadios_equipos foreign key (nombre_equipo) references equipos (nombre);
alter table estadios add check (aforo>2000);
alter table estadios add check (aforo<8000);
alter table equipos rename to grupos;
alter table estadios rename constraint fk_estadios_equipos to fk_estadios_grupos;
alter table estadios add ciudad varchar2 (100);
alter table estadios add check (compartido='si');
alter table estadios add check (compartido='no');


