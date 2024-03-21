drop table empleados cascade constraints;
create table empleados(
    dni char (9) primary key,
    cp int,
    nombre varchar(100),
    apellidos varchar (100),
    direccion varchar (100),
    localidad varchar (100),
);
alter table empleados add check(regexp_like(cp,'41[0-9][0-9][0-9]'));

drop table carreras cascade constraints;
create table carreras(
    nombre varchar (100),
    edicion varchar (100),
    localidad varchar(100),
    f_inicio_inscrip date,
    f_fin_inscripcion date,
    fecha date,
    horario date
);

drop table corredores cascade constraints;
create table corredores(
    dni char (9) primary key,
    nombre varchar (100),
    apellidos varchar (100),
    f_nacimiento date,
    direccion varchar (100)
);
alter table corredores add check(regexp_like(dni,'[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9] A-Z'));

drop table colaboradores cascade constraints;
create table colaboradores(
    id_colaboradores int,
    NIF_entidades int,
    nombre_carreras varchar (100),
    edicion_carreras  varchar (100),
    es_organizador varchar (100),
    es_promotor varchar (100),
    es_colaborador varchar (100),
);
alter table colaboradores add primary key (id_colaboradores);
alter table colaboradores add constraints fk_dni foreign key (NIF_entidades) references entidades(NIF);
alter table colaboradores add constraints fk_edicion_carreras foreign key (edicion_carreras) references carreras(edicion);
alter table colaboradores add constraints fk_nombre_carreras foreign key (nombre_carreras) references carreras(nombre);

drop table trabajadores cascade constraints;
create table trabajadores(
    id_trabajadores int,
    dni_empleados char(9),
    nombre_carrera varchar (100),
    edicion_carrera  varchar (100),
    es_tecnico varchar (100),
    es_administrativo varchar (100),
    es_voluntario varchar (100),
    anos_exp int check (anos_experiencia>0)
);
alter table trabajadores add primary key (id_trabajadores);
alter table trabajadores add constraints fk_dni foreign key (dni_empleados) references empleados(dni);
alter table trabajadores add constraints fk_edicion_carreras foreign key (edicion_carreras) references carreras(edicion);
alter table trabajadores add constraints fk_nombre_carreras foreign key (nombre_carreras) references carreras(nombre);

drop table participantes cascade constraints;
create table participantes(
    id_participantes int,
    nombre_carreras varchar (100),
    edicion_carreras  varchar (100),
    dni_corredores char(9),
    categoria varchar(100),
    dorsal int
    tiempo_realizado date
);

alter table participantes add primary key (id_participantes);
alter table participantes add constraints fk_dni_corredores foreign key (dni_corredores) references corredores(dni);
alter table participantes add constraints fk_edicion_carreras foreign key (edicion_carreras) references carreras(edicion);
alter table participantes add constraints fk_nombre_carreras foreign key (nombre_carreras) references carreras(nombre);
alter table participantes add check (dorsal>0);
alter table participantes add check (dorsal>=99);
      
    
    
    