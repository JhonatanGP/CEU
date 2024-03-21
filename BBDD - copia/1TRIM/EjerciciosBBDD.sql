--Ejercicio1
drop table categorias cascade constraints;
create table categorias(
    cod_categorias varchar2(50),
    descripcion varchar2(50)
);
alter table categorias add primary key (cod_categorias);

drop table productos cascade constraints;
create table productos(
    id_productos int,
    nombre varchar2(50),
    precio number(5,5)
);
alter table productos add primary key (id_productos);
--Ejercicio2
drop table productos cascade constraints;
create table cuentas_bancarias(
    numero int primary key,
    saldo number(5,5)
);
drop table transacciones cascade constraints;
create table transacciones(
    cod_transacciones int primary key,
    tipo varchar2(50),
    cantidad number(5,5),
    numero number(5,5)
);
--Ejercicio3
drop table aulas cascade constraints;
create table aulas(
    numero int,           --PK
    planta varchar2(50),  --PK
    situacion number(5,5)
);
alter table aulas add primary key (numero, planta);

drop table estudiantes cascade constraints;
create table estudiantes(
    num_matricula int primary key , --PK
    Nombre varchar2(50),  
    direccion varchar2(50)
);
drop table asignaturas cascade constraints;
create table asignaturas(
    denominacion varchar2(50),      --PK
    ciclo int                       --PK
);
alter table asignaturas add primary key (denominacion, ciclo);

drop table estudios cascade constraints;
create table estudios(
    numero int,                     --PK
    planta varchar2(50),            --PK
    num_matricula int,              --PK
    denominacion varchar2(50),      --PK
    ciclo int,                      --PK
    hora int
);
alter table estudios add foreign key (numero,planta) references aulas(numero,planta);
alter table estudios add foreign key (num_matricula) references estudiantes(num_matricula);
alter table estudios add foreign key (denominacion, ciclo) references asignaturas(denominacion, ciclo);

--Ejercicio4
drop table aulas1 cascade constraints;
create table aulas1(
    numero int,           --PK
    planta varchar2(50),  --PK
    situacion number(5,5)
);
alter table aulas1 add primary key (numero, planta);

drop table estudiantes1 cascade constraints;
create table estudiantes1(
    num_matricula int primary key , --PK
    Nombre varchar2(50),  
    direccion varchar2(50)
);
drop table asignaturas1 cascade constraints;
create table asignaturas1(
    denominacion varchar2(50),      --PK
    ciclo int                       --PK
);
alter table asignaturas1 add primary key (denominacion, ciclo);

drop table estudios1 cascade constraints;
create table estudios1(
    id_estudios int primary key,                --PK
    numero int,                     --FK
    planta varchar2(50),            --FK
    num_matricula int,              --FK
    denominacion varchar2(50),      --FK
    ciclo int,                      --FK
    hora int
);
alter table estudios1 add foreign key (numero,planta) references aulas1(numero,planta);
alter table estudios1 add foreign key (num_matricula) references estudiantes1(num_matricula);
alter table estudios1 add foreign key (denominacion, ciclo) references asignaturas1(denominacion, ciclo);

--Ejercicio5
drop table representantes cascade constraints;
create table representantes(
    id_licencia int primary key , --PK
    Nombre varchar2(50)  
);
drop table actores cascade constraints;
create table actores(
    id_carne int primary key , --PK
    nombreA varchar2(50),
    nombreB varchar2(50),
    id_licencia_repre int,     --FK
    contrato varchar2(50)
);
alter table actores add foreign key (id_licencia_repre) references representantes(id_licencia);
--Ejercicio6
drop table empleados cascade constraints;
create table empleados(
    dni int primary key , --PK
    nombre varchar2(50),
    dni_superv  int       --FK
);
create table ser_jefe(
    dni_superv int primary key
);
alter table empleados add foreign key (dni_superv) references ser_jefe(dni_superv);

