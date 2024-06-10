--Examen DAW1 Opci�n A # La B solo cambia el nombre de las funciones,procedimientos,paquete y orden de ejercicios BBDD: bbdd-FUTBOLISTAS-ALTURAPESO.sql

set serveroutput on;

/*###  Ejercicio 1
Crea un procedimiento que se llame introduceEquipos que reciba por par�metros de entrada el nombre de un equipo, el nombre de su estadio y su presupuesto,
y con esos datos introduzca esos valores en los campos de un nuevo registro de la tabla equipos. Ten en cuenta lo siguiente:
- Compruebe que no existe un equipo ya con ese nombre en la base de datos. Si ya existe, que muestre por pantalla el mensaje "Ese equipo ya existe" y no 
  haga nada m�s.
- Verifique que el presupuesto es mayor que cero. En caso contrario, debes crear una excepci�n personalizada llamada presupuestoNoValido que muestre por 
  pantalla el mensaje "El presupuesto debe ser mayor que cero".
- Debes obtener el �ltimo id registrado en la base de datos y asignarle al nuevo que vayas a crear el valor siguiente (Ej.: si el �ltimo id (m�s alto) 
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
Crea un procedimiento que se llame borrarEquipo que reciba por par�metro el id de un equipo para borrar (tabla equipos) y elimine dicha fila de la tabla.
Una vez borrado, debes mostrar el mensaje "Equipo borrado correctamente de la tabla equipos". Debes tener en cuenta lo siguiente:
- Hay que comprobar que el id del par�metro existe en la tabla equipos. Si no es as�, llamar a una excepci�n no_data_found que muestre por pantalla 
  "No existe ese equipo para borrar".
- Antes de borrar, debes comprobar que ese equipo no tiene jugadores en la tabla futbolistas. Si existe alg�n jugador cuyo id_equipo sea el que se 
  pretende borrar, llamar a una excepci�n personalizada hayFutbolistasEnEseEquipo que muestre por pantalla el mensaje "No se puede borrar el equipo 
  porque tiene jugadores". */

/*###  Ejercicio 3
Crea una funci�n que se llame obtenerDiaSemanaNacimientoFutbolista que reciba por par�metro el id de un futbolista y devuelva el d�a de la semana con 
letras (ej.: lunes, martes, mi�rcoles, etc.) en el que naci�. Hay que tener en cuenta:
- El id del futbolista debe existir en la tabla futbolistas. Si no es as�, mostrar por pantalla "El futbolista no est� registrado" y devolver "NS". */

/*###  Ejercicio 4
Se quiere crear un procedimiento que se llame listarDatosCuriososFutbolistas que no reciba par�metros y que muestre por pantalla los siguientes datos:
- Nombre del equipo donde juega el futbolista m�s alto, junto a su altura.
- Nombre del equipo donde juega el futbolista que menos pesa, junto a su peso.
- Nombre de todos los equipos junto al n�mero total de futbolistas que juegan en ese equipo.
- N�mero total de futbolistas. */

/*###  Ejercicio 5
Crea un paquete denominado libFutbolistas que contenga:
- Procedimiento introduceEquipos.
- Procedimiento borrarEquipo.
- Funci�n obtenerDiaSemanaNacimientoFutbolista.
- Procedimiento listarDatosCuriososFutbolistas. */

/*###  Ejercicio 6
Desarrolla un bloque de c�digo an�nimo que, llamando a funciones y procedimientos del paquete libFutbolistas, haga lo siguiente:
- Inserte el siguiente equipo:
    - Nombre: CEU TEAM
    - Estado: Bormujos Stadium.
    - Presupuesto: 10
- Muestre los datos m�s curiosos de los fubtolistas que imprime el procedimiento listarDatosCuriososFutbolistas del paquete libFutbolistas.
- Borra el equipo creado CEU TEAM empleando borrarEquipo de la librer�a libFutbolistas.
- Muestra por pantalla el d�a de la semana en el que naci� LUIS. */

/*###  Ejercicio 7
Crea una funci�n que se llame golesEquipo que reciba por par�metro el nombre del equipo y devuelva el n�mero de goles que ha marcado en 
total (tanto en casa como jugando fuera). Esos goles los podr�s obtener de los resultados de los partidos. Se debe tener en cuenta la 
excepci�n de que no exista el id de ese equipo para ese nombre, mostrando un mensaje por pantalla "No existe ese equipo" y devolviendo -1.*/
