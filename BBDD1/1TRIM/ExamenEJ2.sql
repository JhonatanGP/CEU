drop table  equipos cascade constraints;
create table equipos(
    nombre varchar2(100),
    direccion varchar2(100),
    telefono int,
    f_incorp date
);
drop table  empleados cascade constraints;
create table empleados(
    dni char(9),
    nombre_c varchar2(100),
    fecha_n date
);
drop table  pabellones cascade constraints;
create table pabellones(    
    id_pab int,
    direccion varchar2(100),
    telefono int,
    capacidad int
);
drop table  partidos cascade constraints;
create table partidos( 
    id_partido int,
    resultado int,
    tiros_lib_a int check(tiros>=0),
    tiros_lib_l int check(tiros>=0),
    reb_a int check(reb>=0),
    reb_d int check(reb>=0),
    faltas_c int check(faltas<=5),
    min_jug int check(minutos<=40)
);
alter table equipos add primary key (nombre);
alter table empleados add primary key (dni);
alter table pabellones add primary key (id_pab);
alter table partidos add primary key (id_partido);
alter table empleados add check(regexp_like(dni,'[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][A-Z]'));

