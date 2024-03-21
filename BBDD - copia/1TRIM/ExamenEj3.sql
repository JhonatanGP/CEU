drop table inmobiliarias cascade constraints;
create table agencias(
    id int,
    direccion varchar2(100),
    telefono char(13),
    nombre varchar2(50),
    num_empleados int
);
drop table empleados cascade constraints;
create table empleados(
    codigo_emp int,
    nombre varchar2(50),
    fecha_nac date,
    id_agencia int
);
alter table agencias add primary key (id);
alter table empleados add primary key (codigo_emp);
alter table empleados add constraint fk_agencias_e foreign key (id_agencia) references agencias (id);
alter table agencias rename to inmobiliarias; 
alter table empleados rename constraint fk_agencias_e to fk_agencias_emp;
alter table empleados add salario number(8,2);
alter table empleados add check (salario>0);
alter table inmobiliarias add check(regexp_like(telefono,'0034[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'));