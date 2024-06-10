--Examen DAW1 Opción A # La B solo cambia el nombre de las funciones,procedimientos,paquete y orden de ejercicios BBDD: bbdd-FUTBOLISTAS-ALTURAPESO.sql
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
UPDATE FUTBOLISTAS SET ALTURA = 179, PESO = 76 WHERE NOMBRE LIKE 'PEDRO
LUIS';
UPDATE FUTBOLISTAS SET ALTURA = 174, PESO = 71.5 WHERE NOMBRE LIKE 'LUIS';
UPDATE FUTBOLISTAS SET ALTURA = 169, PESO = 66 WHERE NOMBRE LIKE 'JESUS';
UPDATE FUTBOLISTAS SET ALTURA = 189, PESO = 82 WHERE NOMBRE LIKE 'DIEGO';
UPDATE FUTBOLISTAS SET ALTURA = 183, PESO = 84 WHERE NOMBRE LIKE 'PABLO';
UPDATE FUTBOLISTAS SET ALTURA = 180, PESO = 81.5 WHERE NOMBRE LIKE
'ESTEBAN';
UPDATE FUTBOLISTAS SET ALTURA = 162, PESO = 60 WHERE NOMBRE LIKE 'ENRIQUE';
set serveroutput on;

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
    introduceEquipos('EQUIPO ABC','A',1);
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
