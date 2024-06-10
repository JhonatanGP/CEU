/*# Opción A # La opción B solo cambia el nombre de las funciones, procedimientos, paquete y orden de ejercicios

# Ejercicio 1 6p

Se va trabajar sobre la tabla FUTBOLISTAS y EQUIPOS. Se quiere hacer un CRUD completo por lo que necesitamos crear distintas funciones y procedimientos 
para poder crear, editar, consultar o borrar registros de esta tabla. Además, todas estas funciones y procedimientos deberán estar dentro de un paquete 
llamado funcFutbolistas. Se pide:

1.1. Crea una función insertarFutbolista que tenga como parámetros todos los campos de la tabla FUTBOLISTAS. No hace falta que compruebas que estos datos
se introducen bien o no, pero sí debes COMPROBAR que el ID introducido no existe previamente en la base de datos, y además es válido (recuerda que ese 
campo ID es PK con la restricción de que sea F seguido de 3 números y luego el número 20. Si tienes dudas mira la restricción en la tabla). 
Si el ID introducido como parámetro no es válido, muestra en la salida el mensaje "ID no válido" y devuelve -1. Si el ID no existe y el ID es válido, 
inserta en la base de datos a ese nuevo futbolista, muestra por la salida el mensaje "Futbolista creado correctamente" y devuelve 1. Si el ID ya existía 
en la base de datos, muestra por la salida el mensaje "Ese ID ya existe" y devuelve 0.

1.2. Crea una función actualizaFutbolista que tenga como parámetros todos los campos de la tabla FUTBOLISTAS. Como en el caso anterior, no vamos a comprobar
todas las restricciones de todos los campos, asumimos que están bien, salvo el ID. En este caso no será necesario comprobar nada más que el ID existe ya que
es el único caso en que se editará el futbolista. Si no existe, mostrar por la salida el mensaje "No existe ese ID", no hace falta indicar si es válido o no,
y devolver -1. Si el ID existe, modificar los valores de los campos del futbolista, TODOS menos el ID, con los valores pasados por parámetros a la función. 
Mostrar por la salida el mensaje "Futbolista editado correctamente" y devolver 1.

1.3. Crear un procedimiento llamado borrarFutbolista que tenga como parámetro de entrada un ID de futbolista. Si existe ese ID en la tabla futbolistas, 
borrar toda la fila de ese ID y mostrar por la salida el mensaje "Futbolista borrado correctamente". Si ese ID no existe, utilizar una EXCEPCIÓN y mostrar
por la salida el mensaje "No existe ese ID".

1.4. Se quiere obtener un informe con los futbolistas que juegan en un determinado equipo. Para ello crea un procedimiento mostrarFutbolistasEquipo que tenga
como parámetro de entrada el NOMBRE de un equipo (campo NOMBRE de la tabla EQUIPOS) y muestre por la salida de consola todos los futbolistas que juegan en
ese equipo (tabla FUTBOLISTAS, campos NOMBRE y APELLIDOS).

1.5. Debes introducir todas las funciones y procedimientos anteriores dentro de un paquete llamado funcFutbolistas.

1.6. Crea un programa que realice lo siguiente:
    1. Llamada a la función insertarFutbolista del paquete funcFutbolistas para introducir un nuevo futbolista. Pásale los valores que quieras pero debe 
    crear un nuevo futbolista en la tabla (NO lo pidas por teclado, NO).
    2. Cambia el nombre del futbolista PABLO por PABLO JESUS usando la función actualizaFutbolista.
    3. Borra al futbolista de ID F00320 usando borrarFutbolista.
    4. Termina ejecutando el procedimiento mostrarFutbolistasEquipo para el EQUIPO B.


### Ejercicio 2 2p

Se quiere crear un programa que muestre por la salida de la consola el nombre, apellidos y años que tienen los futbolistas que, A DÍA DE HOY YA HAYAN CUMPLIDO
AÑOS, es decir, que en lo que va de año hasta HOY ya fue su cumpleaños. No muestres los futbolistas que no han cumplido años todavía.

### Ejercicio 3 2p

1. Crea una función llamada obtenerFutbolistasPorAnyo que reciba como parámetros dos años con cuatro dígitos (ej.: 2021 y 2019). Debes mostrar por la salida
el nombre del futbolista y el nombre del equipo en el que juega de aquellos futbolistas nacidos entre esos dos años pasados por parámetro (ambos inclusives). 
NOTA: los años deben poder meterse con cualquier orden, da igual que el primero sea mayor que el segundo, al revés, o que ambos sean iguales, debe funcionar 
indistintamente. Se devolverá un número con el total de futbolistas mostrados. Debe devolver 1 si lo hace correctamente, es decir, hay futbolistas, y -1 si 
no los hay.

2. Crea un programa que llame a obtenerFutbolistasPorAnyo con estos tres supuestos (respeta el orden de los parámetros):
    2.1. 1990 y 1985.
    2.2. 2000 y 2000.
    2.3. 2005 y 2007.

--RESUELTO
/*Se va trabajar sobre la tabla FUTBOLISTAS. Se quiere hacer un CRUD completo por lo que necesitamos crear distintas funciones y procedimientos 
para poder crear, editar, consultar o borrar registros de esta tabla. Además, todas estas funciones y procedimientos deberán estar dentro de
un paquete llamado funcFutbolistas. Se pide:

1.1. Crea una función insertarFutbolista que tenga como parámetros todos los campos de la tabla FUTBOLISTAS. No hace falta que compruebas que 
estos datos se introducen bien o no, pero sí debes COMPROBAR que el ID introducido no existe previamente en la base de datos, y además es 
válido (recuerda que ese campo ID es PK con la restricción de que sea F seguido de 3 números y luego el número 20. Si tienes dudas mira la 
restricción en la tabla). Si el ID introducido como parámetro no es válido, muestra en la salida el mensaje "ID no válido" y devuelve -1. 
Si el ID no existe y el ID es válido, inserta en la base de datos a ese nuevo futbolista, muestra por la salida el mensaje
"Futbolista creado correctamente" y devuelve 1. Si el ID ya existía en la base de datos, muestra por la salida el mensaje "Ese ID ya existe" 
y devuelve 0.*/
set serveroutput on;

create or replace function insertarFutbolista(
    vid futbolistas.id%type,
    vnombre futbolistas.nombre%type,
    vapellidos futbolistas.apellidos%type,
    vfecha_nacimiento futbolistas.fecha_nacimiento%type,
    vposicion futbolistas.posicion%type,
    vsalario futbolistas.salario%type,
    vid_equipo futbolistas.id_equipo%type,
    valtura futbolistas.altura%type,
    vpeso futbolistas.peso%type) return int
is
    existe futbolistas.id%type;
begin
    select id into existe from futbolistas where id = vid;
    dbms_output.put_line('Ese ID ya existe');
    return 0;
exception
    when no_data_found then
        if length(vid) = 6 and substr(vid,1,1) = 'F' and (to_number(substr(vid,2,3)) between 0 and 999) and (to_number(substr(vid,5,2)) = 20) then
            insert into futbolistas values (vid,vnombre,vapellidos,vfecha_nacimiento,vposicion,vsalario,vid_equipo,valtura,vpeso);
            dbms_output.put_line('Futbolista creado correctamente');
            return 1;
        else
            dbms_output.put_line('ID no válido');
            return -1;
        end if;
end;
/
/*
1.2. Crea una función actualizaFutbolista que tenga como parámetros todos los campos de la tabla FUTBOLISTAS. Como en el caso anterior, 
no vamos a comprobar todas las restricciones de todos los campos, asumimos que están bien, salvo el ID. En este caso no será necesario 
comprobar nada más que el ID existe ya que es el único caso en que se editará el futbolista. Si no existe, mostrar por la salida el mensaje 
"No existe ese ID", no hace falta indicar si es válido o no, y devolver -1. Si el ID existe, modificar los valores de los campos del futbolista,
TODOS menos el ID, con los valores pasados por parámetros a la función. Mostrar por la salida el mensaje "Futbolista editado correctamente"
y devolver 1.
*/
create or replace function actualizaFutbolista(
    vid futbolistas.id%type,
    vnombre futbolistas.nombre%type,
    vapellidos futbolistas.apellidos%type,
    vfecha_nacimiento futbolistas.fecha_nacimiento%type,
    vposicion futbolistas.posicion%type,
    vsalario futbolistas.salario%type,
    vid_equipo futbolistas.id_equipo%type,
    valtura futbolistas.altura%type,
    vpeso futbolistas.peso%type) return int
is
    existe futbolistas.id%type;
begin
    select id into existe from futbolistas where id = vid;
    update futbolistas set nombre=vnombre,apellidos=vapellidos,fecha_nacimiento=vfecha_nacimiento,posicion=vposicion,salario=vsalario,id_equipo=vid_equipo,altura=valtura,peso=vpeso where id = vid;
    dbms_output.put_line('Futbolista editado correctamente');
    return 1;
exception
    when no_data_found then
        dbms_output.put_line('No existe ese ID');
        return -1;
end;
/

/*
1.3. Crear un procedimiento llamado borrarFutbolista que tenga como parámetro de entrada un ID de futbolista. Si existe ese ID en la tabla 
futbolistas, borrar toda la fila de ese ID y mostrar por la salida el mensaje "Futbolista borrado correctamente". Si ese ID no existe, 
utilizar una EXCEPCIÓN y mostrar por la salida el mensaje "No existe ese ID".
*/
create or replace procedure borrarFutbolista(vid futbolistas.id%type)
is
     existe futbolistas.id%type;
begin
    select id into existe from futbolistas where id = vid;
    delete from futbolistas where id = vid;
    dbms_output.put_line('Futbolista borrado correctamente');
exception
    when no_data_found then
        dbms_output.put_line('No existe ese ID');
end;
/
/*
1.4. Se quiere obtener un informe con los futbolistas que juegan en un determinado equipo. Para ello crea un procedimiento 
mostrarFutbolistasEquipo que tenga como parámetro de entrada el NOMBRE de un equipo (campo NOMBRE de la tabla EQUIPOS) y muestre por la 
salida de consola todos los futbolistas que juegan en ese equipo (tabla FUTBOLISTAS, campos NOMBRE y APELLIDOS).
*/
create or replace procedure mostrarFutbolistasEquipo(nombreEquipo equipos.nombre%type)
is
     cursor datos is select futbolistas.nombre,apellidos from futbolistas join equipos on equipos.id = futbolistas.id_equipo where equipos.nombre = nombreEquipo;
begin
    for fila in datos loop
        dbms_output.put_line(fila.nombre || ' ' || fila.apellidos);
    end loop;
end;
/
/*
1.5. Debes introducir todas las funciones y procedimientos anteriores dentro de un paquete llamado funcFutbolistas.
*/
create or replace package funcFutbolistas 
is
    function insertarFutbolista(
    vid futbolistas.id%type,
    vnombre futbolistas.nombre%type,
    vapellidos futbolistas.apellidos%type,
    vfecha_nacimiento futbolistas.fecha_nacimiento%type,
    vposicion futbolistas.posicion%type,
    vsalario futbolistas.salario%type,
    vid_equipo futbolistas.id_equipo%type,
    valtura futbolistas.altura%type,
    vpeso futbolistas.peso%type) return int;
    function actualizaFutbolista(
    vid futbolistas.id%type,
    vnombre futbolistas.nombre%type,
    vapellidos futbolistas.apellidos%type,
    vfecha_nacimiento futbolistas.fecha_nacimiento%type,
    vposicion futbolistas.posicion%type,
    vsalario futbolistas.salario%type,
    vid_equipo futbolistas.id_equipo%type,
    valtura futbolistas.altura%type,
    vpeso futbolistas.peso%type) return int;
    procedure borrarFutbolista(vid futbolistas.id%type);
    procedure mostrarFutbolistasEquipo(nombreEquipo equipos.nombre%type);
end;
/
create or replace package body funcFutbolistas
is
    function insertarFutbolista(
        vid futbolistas.id%type,
        vnombre futbolistas.nombre%type,
        vapellidos futbolistas.apellidos%type,
        vfecha_nacimiento futbolistas.fecha_nacimiento%type,
        vposicion futbolistas.posicion%type,
        vsalario futbolistas.salario%type,
        vid_equipo futbolistas.id_equipo%type,
        valtura futbolistas.altura%type,
        vpeso futbolistas.peso%type) return int
    is
        existe futbolistas.id%type;
    begin
        select id into existe from futbolistas where id = vid;
        dbms_output.put_line('Ese ID ya existe');
        return 0;
    exception
        when no_data_found then
            if length(vid) = 6 and substr(vid,1,1) = 'F' and (to_number(substr(vid,2,3)) between 0 and 999) and (to_number(substr(vid,5,2)) = 20) then
                insert into futbolistas values (vid,vnombre,vapellidos,vfecha_nacimiento,vposicion,vsalario,vid_equipo,valtura,vpeso);
                dbms_output.put_line('Futbolista creado correctamente');
                return 1;
            else
                dbms_output.put_line('ID no válido');
                return -1;
            end if;
    end;
    
    function actualizaFutbolista(
        vid futbolistas.id%type,
        vnombre futbolistas.nombre%type,
        vapellidos futbolistas.apellidos%type,
        vfecha_nacimiento futbolistas.fecha_nacimiento%type,
        vposicion futbolistas.posicion%type,
        vsalario futbolistas.salario%type,
        vid_equipo futbolistas.id_equipo%type,
        valtura futbolistas.altura%type,
        vpeso futbolistas.peso%type) return int
    is
        existe futbolistas.id%type;
    begin
        select id into existe from futbolistas where id = vid;
        update futbolistas set nombre=vnombre,apellidos=vapellidos,fecha_nacimiento=vfecha_nacimiento,posicion=vposicion,salario=vsalario,id_equipo=vid_equipo,altura=valtura,peso=vpeso where id = vid;
        dbms_output.put_line('Futbolista editado correctamente');
        return 1;
    exception
        when no_data_found then
            dbms_output.put_line('No existe ese ID');
            return -1;
    end;
    
    procedure borrarFutbolista(vid futbolistas.id%type)
    is
         existe futbolistas.id%type;
    begin
        select id into existe from futbolistas where id = vid;
        delete from futbolistas where id = vid;
        dbms_output.put_line('Futbolista borrado correctamente');
    exception
        when no_data_found then
            dbms_output.put_line('No existe ese ID');
    end;
    
    procedure mostrarFutbolistasEquipo(nombreEquipo equipos.nombre%type)
    is
         cursor datos is select futbolistas.nombre,apellidos from futbolistas join equipos on equipos.id = futbolistas.id_equipo where equipos.nombre = nombreEquipo;
    begin
        for fila in datos loop
            dbms_output.put_line(fila.nombre || ' ' || fila.apellidos);
        end loop;
    end;
end;
/
/*
1.6. Crea un programa que realice lo siguiente:
1. Llamada a la función insertarFutbolista del paquete funcFutbolistas para introducir un nuevo futbolista. Pásale los valores que quieras 
pero debe crear un nuevo futbolista en la tabla (NO lo pidas por teclado, NO).
2. Cambia el nombre del futbolista PABLO por PABLO JESUS usando la función actualizaFutbolista.
3. Borra al futbolista de ID F00320 usando borrarFutbolista.
4. Termina ejecutando el procedimiento mostrarFutbolistasEquipo para el EQUIPO B.
*/
begin
    dbms_output.put_line(funcFutbolistas.insertarFutbolista('F01120','prueba','pr','01/01/2001','DELANTERO',100000,1,190,80));
    dbms_output.put_line(funcFutbolistas.actualizaFutbolista('F00720','PABLO JESUS','CARO','27/01/88','DEFENSA',200000,1,183,84));
    funcFutbolistas.borrarFutbolista('F00320');
    funcFutbolistas.mostrarFutbolistasEquipo('EQUIPO B');
end;
/
select id from futbolistas where id = 'FA1120';
insert into futbolistas values ('A11120','prueba','pr','01/01/2001','DELANTERO',100000,1,190,80);

/*
### Ejercicio 2

Se quiere crear un programa que muestre por la salida de la consola el nombre, apellidos y años que tienen los futbolistas que, A DÍA DE HOY 
YA HAYAN CUMPLIDO AÑOS, es decir, que en lo que va de año hasta HOY ya fue su cumpleaños. No muestres los futbolistas que no han cumplido 
años todavía.
*/
declare
    cursor datos is select nombre,apellidos,fecha_nacimiento from futbolistas where to_date(to_char(fecha_nacimiento,'dd')||'/'||to_char(fecha_nacimiento,'mm')||'/'||to_char(sysdate,'YYYY')) < sysdate;
    edad int;
begin
    for fila in datos loop
        edad := to_char(sysdate,'yyyy') - to_char(fila.fecha_nacimiento,'yyyy');
        dbms_output.put_line(fila.nombre || ' ' || fila.apellidos || ' - ' || edad || ' años');
    end loop;
end;
/

/*
### Ejercicio 3

1. Crea una función llamada obtenerFutbolistasPorAnyo que reciba como parámetros dos años con cuatro dígitos (ej.: 2021 y 2019). Debes mostrar 
por la salida el nombre del futbolista y el nombre del equipo en el que juega de aquellos futbolistas nacidos entre esos dos años pasados por 
parámetro (ambos inclusives). NOTA: los años deben poder meterse con cualquier orden, da igual que el primero sea mayor que el segundo, 
al revés, o que ambos sean iguales, debe funcionar indistintamente. Se devolverá un número con el total de futbolistas mostrados. Debe devolver 1 
si lo hace correctamente, es decir, hay futbolistas, y -1 si no los hay.

2. Crea un programa que llame a obtenerFutbolistasPorAnyo con estos tres supuestos (respeta el orden de los parámetros):
2.1. 1990 y 1985.
2.2. 2000 y 2000.
2.3. 2005 y 2007.
*/
create or replace function obtenerFutbolistasPorAnyo(anyo1 int, anyo2 int) return int
is
    cursor datos is select futbolistas.nombre as nombreFut, equipos.nombre as nombreEqu, fecha_nacimiento from futbolistas join equipos on equipos.id = futbolistas.id_equipo;
    contador int := 0;
begin
    for fila in datos loop
        if anyo1 > anyo2 then
            if to_number(to_char(fila.fecha_nacimiento,'yyyy')) between anyo2 and anyo1 then
                dbms_output.put_line(fila.nombreFut || ' ' || fila.nombreEqu);
                contador := contador + 1;
            end if;
        elsif anyo1 < anyo2 then
            if to_number(to_char(fila.fecha_nacimiento,'yyyy')) between anyo1 and anyo2 then
                dbms_output.put_line(fila.nombreFut || ' ' || fila.nombreEqu);
                contador := contador + 1;
            end if;
        else
            if to_number(to_char(fila.fecha_nacimiento,'yyyy')) = anyo1 then
                dbms_output.put_line(fila.nombreFut || ' ' || fila.nombreEqu);
                contador := contador + 1;
            end if;
        end if;
    end loop;
    if contador = 0 then
        return -1;
    else
        return 1;
    end if;
end;
/
begin
    dbms_output.put_line(obtenerFutbolistasPorAnyo(1990,1985));
    dbms_output.put_line(obtenerFutbolistasPorAnyo(2000,2000));
    dbms_output.put_line(obtenerFutbolistasPorAnyo(2005,2007));
end;
/
```

/*## Opción B

BASE DE DATOS: bbdd-FUTBOLISTAS-ALTURAPESO.sql

### Ejercicio 1 2p

1. Crea una función llamada obtenerFutbolistasPorAnosDos que reciba como parámetros dos años con cuatro dígitos (ej.: 2015 y 2011). Debes mostrar por la salida el nombre del futbolista y el nombre del equipo en el que juega de aquellos futbolistas nacidos entre esos dos años pasados por parámetro (ambos inclusives). NOTA: los años deben poder meterse con cualquier orden, da igual que el primero sea mayor que el segundo, al revés, o que ambos sean iguales, debe funcionar indistintamente. Se devolverá un número con el total de futbolistas mostrados. Debe devolver 1 si lo hace correctamente, es decir, hay futbolistas, y -1 si no los hay.

2. Crea un programa que llame a obtenerFutbolistasPorAnosDos con estos tres supuestos (respeta el orden de los parámetros):
2.1. 1989 y 1984.
2.2. 2001 y 2001.
2.3. 2015 y 2017.


### Ejercicio 2 6p

Se va trabajar sobre la tabla FUTBOLISTAS y EQUIPOS. Se quiere hacer un CRUD completo por lo que necesitamos crear distintas funciones y procedimientos para poder crear, editar, consultar o borrar registros de esta tabla. Además, todas estas funciones y procedimientos deberán estar dentro de un paquete llamado paqFutbolistas. Se pide:

1.1. Crea una función meterFutbolista que tenga como parámetros todos los campos de la tabla FUTBOLISTAS. No hace falta que compruebas que estos datos se introducen bien o no, pero sí debes COMPROBAR que el ID introducido no existe previamente en la base de datos, y además es válido (recuerda que ese campo ID es PK con la restricción de que sea F seguido de 3 números y luego el número 20. Si tienes dudas mira la restricción en la tabla). Si el ID introducido como parámetro no es válido, muestra en la salida el mensaje "ID no válido" y devuelve -1. Si el ID no existe y el ID es válido, inserta en la base de datos a ese nuevo futbolista, muestra por la salida el mensaje "Futbolista creado correctamente" y devuelve 1. Si el ID ya existía en la base de datos, muestra por la salida el mensaje "Ese ID ya existe" y devuelve 0.

1.2. Crea una función editarFutbolista que tenga como parámetros todos los campos de la tabla FUTBOLISTAS. Como en el caso anterior, no vamos a comprobar todas las restricciones de todos los campos, asumimos que están bien, salvo el ID. En este caso no será necesario comprobar nada más que el ID existe ya que es el único caso en que se editará el futbolista. Si no existe, mostrar por la salida el mensaje "No existe ese ID", no hace falta indicar si es válido o no, y devolver -1. Si el ID existe, modificar los valores de los campos del futbolista, TODOS menos el ID, con los valores pasados por parámetros a la función. Mostrar por la salida el mensaje "Futbolista editado correctamente" y devolver 1.

1.3. Crear un procedimiento llamado eliminarFutbolista que tenga como parámetro de entrada un ID de futbolista. Si existe ese ID en la tabla futbolistas, borrar toda la fila de ese ID y mostrar por la salida el mensaje "Futbolista borrado correctamente". Si ese ID no existe, utilizar una EXCEPCIÓN y mostrar por la salida el mensaje "No existe ese ID".

1.4. Se quiere obtener un informe con los futbolistas que juegan en un determinado equipo. Para ello crea un procedimiento mostrarFutbolistasEquipo que tenga como parámetro de entrada el NOMBRE de un equipo (campo NOMBRE de la tabla EQUIPOS) y muestre por la salida de consola todos los futbolistas que juegan en ese equipo (tabla FUTBOLISTAS, campos NOMBRE y APELLIDOS).

1.5. Debes introducir todas las funciones y procedimientos anteriores dentro de un paquete llamado paqFutbolistas.

1.6. Crea un programa que realice lo siguiente:
1. Llamada a la función meterFutbolista del paquete paqFutbolistas para introducir un nuevo futbolista. Pásale los valores que quieras pero debe crear un nuevo futbolista en la tabla (NO lo pidas por teclado, NO).
2. Cambia el nombre del futbolista ESTEBAN por PABLO ESTEBAN usando la función editarFutbolista.
3. Borra al futbolista de ID F00620 usando eliminarFutbolista.
4. Termina ejecutando el procedimiento mostrarFutbolistasEquipo para el EQUIPO A.



### Ejercicio 3 2p

Se quiere crear un programa que muestre por la salida de la consola el nombre, apellidos y años que tienen los futbolistas que, A DÍA DE HOY TODAVÍA NO HAYAN CUMPLIDO AÑOS, es decir, que en lo que va de año hasta HOY, no ha sido su cumpleaños. No muestres los futbolistas que sí han cumplido años.