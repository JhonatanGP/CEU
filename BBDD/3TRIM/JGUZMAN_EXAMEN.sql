set serveroutput on;
--1
create or replace procedure borraEquipo(vid equipo.id%type)
is
     existe equipo.id%type;
begin
    select id into existe from equipos where id = vid;
    delete from equipos where id = vid;
    dbms_output.put_line('Equipo borrado correctamente de la tabla equipos');
exception
    when no_data_found then
        dbms_output.put_line('No existe ese equipo para borrar');
end;
/

--2

create or replace procedure introduceEquipos( nombre equipos.nombre%type, estadio equipos.estadio%type, prsupuesto equipos.presupuesto%type)
is
    existe equipos%type;
begin
    select id into existe from equipos where nombre =
    dbms_output.put_line('El equipo ya existe');
exception
    when no_data_found then
        if  presupuesto > 0 then
            insert into equipos values (vid,vnombre,vestadio, vpresupuesto);
            dbms_output.put_line('Futbolista creado correctamente');
        else  presupuesto < 0 then
            dbms_output.put_line('Presupuesto no válido');
       end if;
end;
/
