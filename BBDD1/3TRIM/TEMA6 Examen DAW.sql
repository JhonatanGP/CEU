--Examen DAW1 A #La B solo cambia el nombre de las funciones,procedimientos,paquete y orden de ejercicios BBDD: bbdd-FUTBOLISTAS-ALTURAPESO.sql
ALTER SESSION SET nls_date_format='DD-MM-YYYY HH24:MI:SS';
DROP TABLE FUTBOLISTAS CASCADE CONSTRAINTS;
DROP TABLE EQUIPOS CASCADE CONSTRAINTS;
DROP TABLE PARTIDOS CASCADE CONSTRAINTS;

CREATE TABLE FUTBOLISTAS(
ID CHAR(6) PRIMARY KEY CHECK( REGEXP_LIKE( ID, 'F[0-9][0-9][0-9]20' )),
NOMBRE VARCHAR(100),
APELLIDOS VARCHAR(300),
FECHA_NACIMIENTO DATE,
POSICION VARCHAR(50) CHECK( POSICION LIKE 'PORTERO' OR POSICION LIKE 'DEFENSA' OR POSICION LIKE 'MEDIOCENTRO' OR POSICION LIKE 'DELANTERO' ),
SALARIO NUMBER(12,2) CHECK( SALARIO > 50000),
ID_EQUIPO INT
);

CREATE TABLE EQUIPOS(
ID INT PRIMARY KEY,
NOMBRE VARCHAR(100),
ESTADIO VARCHAR(100),
PRESUPUESTO NUMBER(20,2)
);

CREATE TABLE PARTIDOS(
ID INT PRIMARY KEY,
ARBITRO VARCHAR(200),
RESULTADO VARCHAR(5) CHECK( REGEXP_LIKE( RESULTADO, '[0-9][0-9]-[0-9][0-9]' )),
ESTADIO VARCHAR(100),
FECHA DATE,
ID_EQUIPO_CASA INT,
ID_EQUIPO_FUERA INT
);

ALTER TABLE FUTBOLISTAS
ADD CHECK (FECHA_NACIMIENTO > '31/DEC/1974');
ALTER TABLE FUTBOLISTAS
ADD FOREIGN KEY (ID_EQUIPO) REFERENCES EQUIPOS(ID);

ALTER TABLE PARTIDOS
ADD FOREIGN KEY (ID_EQUIPO_CASA) REFERENCES EQUIPOS(ID);
ALTER TABLE PARTIDOS
ADD FOREIGN KEY (ID_EQUIPO_FUERA) REFERENCES EQUIPOS(ID);

DELETE FROM EQUIPOS;
INSERT INTO EQUIPOS VALUES (1,'EQUIPO A', 'ESTADIO A',1000000);
INSERT INTO EQUIPOS VALUES (2,'EQUIPO B', 'ESTADIO B',2000000);
INSERT INTO EQUIPOS VALUES (3,'EQUIPO C', 'ESTADIO C',3000000);

DELETE FROM FUTBOLISTAS;
INSERT INTO FUTBOLISTAS VALUES ('F00120','PEDRO','GOMEZ','22/01/1980','PORTERO',100000,1);
INSERT INTO FUTBOLISTAS VALUES ('F00220','PEDRO LUIS','GOMEZ','20/04/1985','DEFENSA',110000,1);
INSERT INTO FUTBOLISTAS VALUES ('F00320','LUIS','GALVEZ','12/01/1990','DELANTERO',80000,1);
INSERT INTO FUTBOLISTAS VALUES ('F00420','ANTONIO','DOMINGUEZ','25/06/1981','PORTERO',340000,2);
INSERT INTO FUTBOLISTAS VALUES ('F00520','JESUS','FERNANDEZ','02/01/1995','MEDIOCENTRO',140000,2);
INSERT INTO FUTBOLISTAS VALUES ('F00620','DIEGO','DIAZ','05/04/1987','PORTERO',160000,2);
INSERT INTO FUTBOLISTAS VALUES ('F00720','PABLO','CARO','27/01/1988','DEFENSA',200000,3);
INSERT INTO FUTBOLISTAS VALUES ('F00820','ESTEBAN','BENITEZ','29/09/2000','DEFENSA',300000,3);
INSERT INTO FUTBOLISTAS VALUES ('F00920','ENRIQUE','ALVAREZ','30/09/2001','MEDIOCENTRO',120000,3);

DELETE FROM PARTIDOS;
INSERT INTO PARTIDOS VALUES (1,'ARBITRO A','00-00','ESTADIO A','01/01/2020',1,2);
INSERT INTO PARTIDOS VALUES (2,'ARBITRO B','01-00','ESTADIO A','08/01/2020',1,3);
INSERT INTO PARTIDOS VALUES (3,'ARBITRO C','01-01','ESTADIO B','15/01/2020',2,3);
INSERT INTO PARTIDOS VALUES (4,'ARBITRO B','02-00','ESTADIO B','22/01/2020',2,1);
INSERT INTO PARTIDOS VALUES (5,'ARBITRO A','04-01','ESTADIO C','29/01/2020',3,1);
INSERT INTO PARTIDOS VALUES (6,'ARBITRO A','03-03','ESTADIO C','05/02/2020',3,2);

UPDATE FUTBOLISTAS SET ID_EQUIPO = 2 WHERE ID LIKE 'F00120';
UPDATE FUTBOLISTAS SET ID_EQUIPO = 3 WHERE ID LIKE 'F00420';
UPDATE FUTBOLISTAS SET ID_EQUIPO = 1 WHERE ID LIKE 'F00920';

DELETE FROM FUTBOLISTAS WHERE ID LIKE 'F00120' OR ID LIKE 'F00420';

ALTER TABLE FUTBOLISTAS
ADD ALTURA INT;
ALTER TABLE FUTBOLISTAS
ADD PESO NUMBER(4,1);
UPDATE FUTBOLISTAS SET ALTURA = 179, PESO = 76 WHERE NOMBRE LIKE 'PEDRO LUIS';
UPDATE FUTBOLISTAS SET ALTURA = 174, PESO = 71.5 WHERE NOMBRE LIKE 'LUIS';
UPDATE FUTBOLISTAS SET ALTURA = 169, PESO = 66 WHERE NOMBRE LIKE 'JESUS';
UPDATE FUTBOLISTAS SET ALTURA = 189, PESO = 82 WHERE NOMBRE LIKE 'DIEGO';
UPDATE FUTBOLISTAS SET ALTURA = 183, PESO = 84 WHERE NOMBRE LIKE 'PABLO';
UPDATE FUTBOLISTAS SET ALTURA = 180, PESO = 81.5 WHERE NOMBRE LIKE 'ESTEBAN';
UPDATE FUTBOLISTAS SET ALTURA = 162, PESO = 60 WHERE NOMBRE LIKE 'ENRIQUE';

# Examen DAW1

## Opción A

## La opción B solo cambia el nombre de las funciones, procedimientos, paquete y orden de ejercicios

BASE DE DATOS: bbdd-FUTBOLISTAS-ALTURAPESO.sql

### Ejercicio 1 6p

Se va trabajar sobre la tabla FUTBOLISTAS y EQUIPOS. Se quiere hacer un CRUD completo por lo que necesitamos crear distintas funciones y procedimientos para poder crear, editar, consultar o borrar registros de esta tabla. Además, todas estas funciones y procedimientos deberán estar dentro de un paquete llamado funcFutbolistas. Se pide:

1.1. Crea una función insertarFutbolista que tenga como parámetros todos los campos de la tabla FUTBOLISTAS. No hace falta que compruebas que estos datos se introducen bien o no, pero sí debes COMPROBAR que el ID introducido no existe previamente en la base de datos, y además es válido (recuerda que ese campo ID es PK con la restricción de que sea F seguido de 3 números y luego el número 20. Si tienes dudas mira la restricción en la tabla). Si el ID introducido como parámetro no es válido, muestra en la salida el mensaje "ID no válido" y devuelve -1. Si el ID no existe y el ID es válido, inserta en la base de datos a ese nuevo futbolista, muestra por la salida el mensaje "Futbolista creado correctamente" y devuelve 1. Si el ID ya existía en la base de datos, muestra por la salida el mensaje "Ese ID ya existe" y devuelve 0.

1.2. Crea una función actualizaFutbolista que tenga como parámetros todos los campos de la tabla FUTBOLISTAS. Como en el caso anterior, no vamos a comprobar todas las restricciones de todos los campos, asumimos que están bien, salvo el ID. En este caso no será necesario comprobar nada más que el ID existe ya que es el único caso en que se editará el futbolista. Si no existe, mostrar por la salida el mensaje "No existe ese ID", no hace falta indicar si es válido o no, y devolver -1. Si el ID existe, modificar los valores de los campos del futbolista, TODOS menos el ID, con los valores pasados por parámetros a la función. Mostrar por la salida el mensaje "Futbolista editado correctamente" y devolver 1.

1.3. Crear un procedimiento llamado borrarFutbolista que tenga como parámetro de entrada un ID de futbolista. Si existe ese ID en la tabla futbolistas, borrar toda la fila de ese ID y mostrar por la salida el mensaje "Futbolista borrado correctamente". Si ese ID no existe, utilizar una EXCEPCIÓN y mostrar por la salida el mensaje "No existe ese ID".

1.4. Se quiere obtener un informe con los futbolistas que juegan en un determinado equipo. Para ello crea un procedimiento mostrarFutbolistasEquipo que tenga como parámetro de entrada el NOMBRE de un equipo (campo NOMBRE de la tabla EQUIPOS) y muestre por la salida de consola todos los futbolistas que juegan en ese equipo (tabla FUTBOLISTAS, campos NOMBRE y APELLIDOS).

1.5. Debes introducir todas las funciones y procedimientos anteriores dentro de un paquete llamado funcFutbolistas.

1.6. Crea un programa que realice lo siguiente:
1. Llamada a la función insertarFutbolista del paquete funcFutbolistas para introducir un nuevo futbolista. Pásale los valores que quieras pero debe crear un nuevo futbolista en la tabla (NO lo pidas por teclado, NO).
2. Cambia el nombre del futbolista PABLO por PABLO JESUS usando la función actualizaFutbolista.
3. Borra al futbolista de ID F00320 usando borrarFutbolista.
4. Termina ejecutando el procedimiento mostrarFutbolistasEquipo para el EQUIPO B.


### Ejercicio 2 2p

Se quiere crear un programa que muestre por la salida de la consola el nombre, apellidos y años que tienen los futbolistas que, A DÍA DE HOY YA HAYAN CUMPLIDO AÑOS, es decir, que en lo que va de año hasta HOY ya fue su cumpleaños. No muestres los futbolistas que no han cumplido años todavía.

### Ejercicio 3 2p

1. Crea una función llamada obtenerFutbolistasPorAnyo que reciba como parámetros dos años con cuatro dígitos (ej.: 2021 y 2019). Debes mostrar por la salida el nombre del futbolista y el nombre del equipo en el que juega de aquellos futbolistas nacidos entre esos dos años pasados por parámetro (ambos inclusives). NOTA: los años deben poder meterse con cualquier orden, da igual que el primero sea mayor que el segundo, al revés, o que ambos sean iguales, debe funcionar indistintamente. Se devolverá un número con el total de futbolistas mostrados. Debe devolver 1 si lo hace correctamente, es decir, hay futbolistas, y -1 si no los hay.

2. Crea un programa que llame a obtenerFutbolistasPorAnyo con estos tres supuestos (respeta el orden de los parámetros):
2.1. 1990 y 1985.
2.2. 2000 y 2000.
2.3. 2005 y 2007.


```
set serveroutput on;
/*Se va trabajar sobre la tabla FUTBOLISTAS. Se quiere hacer un CRUD completo por lo que necesitamos crear distintas funciones y procedimientos 
para poder crear, editar, consultar o borrar registros de esta tabla. Además, todas estas funciones y procedimientos deberán estar dentro de
un paquete llamado funcFutbolistas. Se pide:

1.1. Crea una función insertarFutbolista que tenga como parámetros todos los campos de la tabla FUTBOLISTAS. No hace falta que compruebas que 
estos datos se introducen bien o no, pero sí debes COMPROBAR que el ID introducido no existe previamente en la base de datos, y además es 
válido (recuerda que ese campo ID es PK con la restricción de que sea F seguido de 3 números y luego el número 20. Si tienes dudas mira la 
restricción en la tabla). Si el ID introducido como parámetro no es válido, muestra en la salida el mensaje "ID no válido" y devuelve -1. 
Si el ID no existe y el ID es válido, inserta en la base de datos a ese nuevo futbolista, muestra por la salida el mensaje
"Futbolista creado correctamente" y devuelve 1. Si el ID ya existía en la base de datos, muestra por la salida el mensaje "Ese ID ya existe" 
y devuelve 0. */
create or replace function insertarFutbolista(
    vid futbolistas.id%type,
    vnombre futbolistas.nombre%type,
    vapellidos futbolistas.apellidos%type,
    vfecha_nacimiento futbolistas.fecha_nacimiento%type,
    vposicion futbolistas.posicion%type,
    vsalario futbolistas.salario%type,
    vid_equipo futbolistas.id_equipo%type,
    valtura fut
    
    
    
    
    
    
    
    
    
    bolistas.altura%type,
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

## Opción B

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

set serveroutput on;
--EXAMEN SEMANA VERDE
/*###  Ejercicio 1
Crea un procedimiento que se llame introduceEquipos que reciba por parámetros de entrada el nombre de un equipo, el nombre de su estadio y su presupuesto,
y con esos datos introduzca esos valores en los campos de un nuevo registro de la tabla equipos. Ten en cuenta lo siguiente:
- Compruebe que no existe un equipo ya con ese nombre en la base de datos. Si ya existe, que muestre por pantalla el mensaje "Ese equipo ya existe" y no 
  haga nada más.
- Verifique que el presupuesto es mayor que cero. En caso contrario, debes crear una excepción personalizada llamada presupuestoNoValido que muestre por 
  pantalla el mensaje "El presupuesto debe ser mayor que cero".
- Debes obtener el último id registrado en la base de datos y asignarle al nuevo que vayas a crear el valor siguiente (Ej.: si el último id (más alto) 
  es 4 entonces debes guardar ese nuevo registro con el id 5). Debes tener en cuenta que la tabla puede estar vacia y en ese caso asignarle al id el 
  valor de 1.
- Una vez introducido dicho nuevo registro equipo, mostrar por pantalla "Se ha introducido correctamente un nuevo equipo". */
drop procedure introduceEquipos;
create or replace procedure introduceEquipos(nombreEquipo equipos.nombre%type,nombreEstadio equipos.estadio%type,presupuestoEquipo equipos.presupuesto%type)
is
    cuentaId int := 0;
    presupuestoNoValido exception;
    idEquipo equipos.id%type;
begin
    select count(*) into cuentaId from equipos where nombre = nombreEquipo;
    if cuentaId != 0 then
        dbms_output.put_line('Ese equipo ya existe');
    elsif presupuestoEquipo > 0 then
        select max(id) into idEquipo from equipos;
        if idEquipo = null then
            idEquipo := 1;
        else
            idEquipo := idEquipo + 1;
        end if;
        insert into equipos values (idEquipo,nombreEquipo,nombreEstadio,presupuestoEquipo);
        dbms_output.put_line('Se ha introducido correctamente un nuevo equipo');
    else
        raise presupuestoNoValido;
    end if;
exception
    when presupuestoNoValido then
        dbms_output.put_line('El presupuesto debe ser mayor que cero');
end;
/
begin
    introduceEquipos('EQUIPO ABCD','A',0);
end;
/
/*###  Ejercicio 2
Crea un procedimiento que se llame borrarEquipo que reciba por parámetro el id de un equipo para borrar (tabla equipos) y elimine dicha fila de la tabla.
Una vez borrado, debes mostrar el mensaje "Equipo borrado correctamente de la tabla equipos". Debes tener en cuenta lo siguiente:
- Hay que comprobar que el id del parámetro existe en la tabla equipos. Si no es así, llamar a una excepción no_data_found que muestre por pantalla 
  "No existe ese equipo para borrar".
- Antes de borrar, debes comprobar que ese equipo no tiene jugadores en la tabla futbolistas. Si existe algún jugador cuyo id_equipo sea el que se 
  pretende borrar, llamar a una excepción personalizada hayFutbolistasEnEseEquipo que muestre por pantalla el mensaje "No se puede borrar el equipo 
  porque tiene jugadores". */

/*###  Ejercicio 3
Crea una función que se llame obtenerDiaSemanaNacimientoFutbolista que reciba por parámetro el id de un futbolista y devuelva el día de la semana con 
letras (ej.: lunes, martes, miércoles, etc.) en el que nació. Hay que tener en cuenta:
- El id del futbolista debe existir en la tabla futbolistas. Si no es así, mostrar por pantalla "El futbolista no está registrado" y devolver "NS". */

/*###  Ejercicio 4
Se quiere crear un procedimiento que se llame listarDatosCuriososFutbolistas que no reciba parámetros y que muestre por pantalla los siguientes datos:
- Nombre del equipo donde juega el futbolista más alto, junto a su altura.
- Nombre del equipo donde juega el futbolista que menos pesa, junto a su peso.
- Nombre de todos los equipos junto al número total de futbolistas que juegan en ese equipo.
- Número total de futbolistas. */

create or replace procedure listarDatosCuriososFutbolistas
is
    nombreEquipoAlto equipos.nombre%type;
    alturaAlto futbolistas.altura%type;
    nombreEquipoPeso equipos.nombre%type;
    pesoBajo futbolistas.peso%type;
    cursor datos is 
        select equipos.nombre as equipo,count(*) as contador
            from futbolistas
            join equipos on futbolistas.id_equipo = equipos.id
            group by equipos.nombre;
    totalFutbolistas int := 0;
begin
    select equipos.nombre,altura into nombreEquipoAlto,alturaAlto 
        from equipos
        join futbolistas on futbolistas.id_equipo = equipos.id
        where altura = (select max(altura) from futbolistas);
    dbms_output.put_line(nombreEquipoAlto || '|' || alturaAlto);
    select equipos.nombre,peso into nombreEquipoPeso,pesoBajo 
        from equipos
        join futbolistas on futbolistas.id_equipo = equipos.id
        where peso = (select min(peso) from futbolistas);
    dbms_output.put_line(nombreEquipoPeso || '|' || pesoBajo);
    for fila in datos loop
        dbms_output.put_line(fila.equipo||'|'||fila.contador);
    end loop;
    select count(*) into totalFutbolistas from futbolistas;
    dbms_output.put_line('Total jugadores: ' || totalFutbolistas);
end;
/
begin
    listarDatosCuriososFutbolistas;
end;
/

/*###  Ejercicio 5
Crea un paquete denominado libFutbolistas que contenga:
- Procedimiento introduceEquipos.
- Procedimiento borrarEquipo.
- Función obtenerDiaSemanaNacimientoFutbolista.
- Procedimiento listarDatosCuriososFutbolistas. */

/*###  Ejercicio 6
Desarrolla un bloque de código anónimo que, llamando a funciones y procedimientos del paquete libFutbolistas, haga lo siguiente:
- Inserte el siguiente equipo:
    - Nombre: CEU TEAM
    - Estado: Bormujos Stadium.
    - Presupuesto: 10
- Muestre los datos más curiosos de los fubtolistas que imprime el procedimiento listarDatosCuriososFutbolistas del paquete libFutbolistas.
- Borra el equipo creado CEU TEAM empleando borrarEquipo de la librería libFutbolistas.
- Muestra por pantalla el día de la semana en el que nació LUIS. */

/*###  Ejercicio 7
Crea una función que se llame golesEquipo que reciba por parámetro el nombre del equipo y devuelva el número de goles que ha marcado en 
total (tanto en casa como jugando fuera). Esos goles los podrás obtener de los resultados de los partidos. Se debe tener en cuenta la 
excepción de que no exista el id de ese equipo para ese nombre, mostrando un mensaje por pantalla "No existe ese equipo" y devolviendo -1.*/

create or replace function golesEquipo(nombreEquipo equipos.nombre%type) return int
is
    existeId equipos.id%type;
    cursor datos is 
        select resultado,equipoCasa.nombre as equipoCasa,equipoFuera.nombre as equipoFuera 
            from partidos 
            join equipos equipoCasa on equipoCasa.id = partidos.id_equipo_casa
            join equipos equipoFuera on equipoFuera.id = partidos.id_equipo_fuera
            where equipoCasa.nombre = nombreEquipo or equipoFuera.nombre = nombreEquipo;
    golesTotales int := 0;
begin
    select id into existeId from equipos where nombre = nombreEquipo;
    for fila in datos loop
        dbms_output.put_line(fila.resultado);
        if fila.equipoCasa = nombreEquipo then --juega en casa
            golesTotales := golesTotales + to_number(substr(fila.resultado,1,2));
        else --juega fuera
            golesTotales := golesTotales + to_number(substr(fila.resultado,4,2));
        end if;
    end loop;
    return golesTotales;
exception
    when no_data_found then
        dbms_output.put_line('No existe ese equipo');
        return -1;
end;
/
begin
    dbms_output.put_line(golesEquipo('EQUIPO C'));
end;
/