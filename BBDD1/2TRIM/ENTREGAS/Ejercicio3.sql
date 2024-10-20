drop table futbolistas cascade constraints;
create table futbolistas(
    id char(6) primary key,
    nombre varchar2(50),
    apellido varchar2(50),
    fecha_nacimiento date,
    posicion int,
    salario int,
    id_equipo char(2)
);
drop table equipos cascade constraints;
create table equipos(
    id char(2) primary key,
    nombre varchar2(50),
    estadio varchar2(50),
    presupuesto int
);
drop table partidos cascade constraints;
create table partidos(
    id char(6) primary key,
    id_equipo char(2),
    arbitro varchar2(50),
    estadio varchar2(50),
    resultado varchar2(50),
    fecha date
);
alter table futbolistas add foreign key (id_equipo) references equipos (id);
alter table futbolistas add check (posicion in ('PORTERO', 'DEFENSA', 'MEDIOCENTRO', 'DELANTERO'));
alter table futbolistas add check (regexp_like(id,'F[0-9][0-9][0-9]23'));
alter table futbolistas add check (salario>50000);
alter table futbolistas add check (fecha_nacimiento between date '1978-01-01' and date '2023-01-01'); 

alter table partidos add foreign key (id_equipo) references equipos (id);
alter table partidos add check(regexp_like(resultado, '[0-99]-[0-99]'));

insert into equipos (id, nombre) values (1, 'equipo1');
insert into equipos (id, nombre) values (2, 'equipo2');
insert into equipos (id, nombre) values (3, 'equipo3');

insert into partidos values ('000001', 1, 'arbitro1', 'estadio1', '0-2', '10-03-2023'); 
insert into partidos values ('000002', 2, 'arbitro1', 'estadio1', '4-2', '11-03-2023'); 
insert into partidos values ('000003', 3, 'arbitro1', 'estadio2', '2-0', '12-03-2023'); 
insert into partidos values ('000004', 1, 'arbitro1', 'estadio2', '1-5', '13-03-2023');  

insert into futbolistas (id, nombre, id_equipo) values ('F00123', 'futbolista1', 1); 
insert into futbolistas (id, nombre, id_equipo) values ('F00223', 'futbolista2', 1);
insert into futbolistas (id, nombre, id_equipo) values ('F00323', 'futbolista3', 1); 
insert into futbolistas (id, nombre, id_equipo) values ('F00423', 'futbolista4', 2); 
insert into futbolistas (id, nombre, id_equipo) values ('F00523', 'futbolista5', 2);
insert into futbolistas (id, nombre, id_equipo) values ('F00623', 'futbolista6', 2); 
insert into futbolistas (id, nombre, id_equipo) values ('F00723', 'futbolista7', 3); 
insert into futbolistas (id, nombre, id_equipo) values ('F00823', 'futbolista8', 3);
insert into futbolistas (id, nombre, id_equipo) values ('F00923', 'futbolista9', 3); 

update futbolistas set id_equipo=2 where futbolistas.id='F00323';
update futbolistas set id_equipo=3 where futbolistas.id='F00623';
update futbolistas set id_equipo=1 where futbolistas.id='F00723';

delete from futbolistas where futbolistas.id='F00923';
delete from futbolistas where futbolistas.id='F00123';