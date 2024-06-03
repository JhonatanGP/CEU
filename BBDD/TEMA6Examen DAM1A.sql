--# Examen DAM1  ## Opci�n A BASE DE DATOS: restaurante.sql
set serveroutput on;
/*### Ejercicio 1
Crea una funci�n que se llame calculaDineroComandasDias que reciba como par�metro un d�a (formato d�a, mes y a�o, tal y como est� el campo 
fecha de comandas en base de datos) y devuelva el importe total que se ha ganado ese d�a.
NOTA 1: los precios de los platos est�n en la tabla platos.
NOTA 2: solo nos interesan las comandas que se encuentren en estado COBRADO. */

create or replace function calculaDineroComandasDias(dia comandas.fecha%type) return platos.precio%type
is
    totalCobrado platos.precio%type;
    cursor datos is select * from comandas where estado = 'COBRADO' and fecha = dia;
    precioPlato platos.precio%type;
begin
    /* Opci�n 1
    select 
        sum(precio) into totalCobrado 
        from comandas 
        join platos on platos.id = comandas.id_plato 
        where estado = 'COBRADO' and fecha = dia;
    Fin Opci�n 1 */
    totalCobrado := 0;
    for fila in datos loop
        select precio into precioPlato from platos where id = fila.id_plato;
        totalCobrado := totalCobrado + precioPlato;
    end loop;
    return totalCobrado;
end;
/
begin
    dbms_output.put_line(calculaDineroComandasDias('01/03/21'));
end;
/
/*### Ejercicio 2
Crea un procedimiento que se llame incluyeComanda que reciba como par�metros de entrada los siguientes:
- Mesa donde se ha atendido.
- Nombre del cliente.
- Nombre del plato. Cuando crees la comanda en la tabla, recuerda a�adir tambi�n los datos siguientes:
- Estado: siempre ser� COCINA.
- Fecha: el d�a de hoy.
- Hora: la hora de este momento en formato char(5) con dos caracteres para la hora, luego caracter : y otros dos caracteres para los minutos 
(tal y como est� guardado en base de datos). El id de la comanda debe ser una unidad mayor que el id mayor que exista en la tabla comandas. 
Ej: si la comanda de id mayor tiene valor 25, tienes que introducir tu nueva comanda con id igual a 26.
Al crear la comanda, muestra el mensaje "Comanda registrada correctamente en COCINA".
Excepciones:
- Debes contemplar que el cliente y el plato existen. En caso de que no seas as�, mostrar por pantalla 'Datos incorrectos'; */

create or replace procedure incluyeComanda(
    vmesa comandas.mesa%type,
    nombreCliente clientes.nombre%type,
    nombrePlato platos.nombre%type)
is
    existeCliente clientes.nombre%type;
    --existeCliente int := 0;
    existePlato platos.nombre%type;
    idMayor comandas.id%type;
    --idNuevo comandas.id%type;
begin
    select id into existeCliente from clientes where nombre = nombreCliente; --no_data_found
    --select count(nombre) into existeCliente from clientes where nombre = nombreCliente; --0
    select id into existePlato from platos where nombre = nombrePlato; --no_data_found
    select max(id) into idMayor from comandas;
    --select max(id)+1 into idNuevo from comandas;
    insert into comandas values (idMayor+1,vmesa,existeCliente,existePlato,'COCINA',sysdate,to_char(sysdate,'hh24:mi'));
    dbms_output.put_line('Comanda registrada correctamente en COCINA');
exception
    when no_data_found then
        dbms_output.put_line('Datos incorrectos');
end;
/
begin
    incluyeComanda(1,'Maria','Plato Arroz caldoso');
end;
/
/*
insert into comandas (id,mesa) values (1,2);
insert into comandas (id,mesa,id_cliente,id_plato,estado,fecha,hora) values (....);
insert into comandas values (1,4,2,1,'COCINA',sysdate,to_char(..));
*/


/*### Ejercicio 3
Crea un procedimiento que se utilice para borrar comandas que se llame eliminarComanda, que reciba por par�metro el id de una comanda y elimine dicho 
registro de la tabla. Una vez se borre, mostrar el mensaje "Comanda eliminada satisfactoriamente". Ten en cuenta que:
- Es necesario que el id de la comanda exista en la tabla comandas. Si no es as�, crear una excepci�n personalizada llamada idNoValido que muestre por
pantalla "No existe ese id". */
create or replace procedure eliminarComanda(idComanda comandas.id%type)
is
    contador int;
    idNoValido exception;
begin
    select count(*) into contador from comandas where id = idComanda;
    if contador = 0 then
        raise idNoValido;
    else
        delete from comandas where id = idComanda;
        dbms_output.put_line('Comanda eliminada satisfactoriamente');
    end if;
exception
    when idNoValido then
        dbms_output.put_line('No existe ese id');
end;
/
begin
    eliminarComanda(32);
end;
/

/*### Ejercicio 4
Se quiere crear una funci�n denominada obtenerPalabrasYEspaciosPlatos que no reciba ning�n par�metro y que devuelva el n�mero de espacios en blanco 
que hay en total entre todos los nombres de platos. Adem�s, se quiere que se muestre por pantalla el nombre de cada plato seguido del n�mero de 
palabras de su nombre. Por ejemplo, el plato "Plato Arroz caldoso" tiene 3 palabras. */ --siempre hay uno mas, substr(nombre,instr(nombre,' ')+1
create or replace function obtenerPalabrasYEspaciosPlatos return int
is
    cursor datos is select nombre from platos;
    contador int := 0;
    total int := 0;
begin
    for fila in datos loop
        for i in 1..length(fila.nombre) loop
            if substr(fila.nombre,i,1) = ' ' then
                contador := contador + 1;
            end if;
        end loop;
        total := total + contador;
        dbms_output.put_line(fila.nombre || ' - ' || (contador+1) || ' palabras');
        contador := 0;
    end loop;
    return total;
end;
/
begin
    dbms_output.put_line(obtenerPalabrasYEspaciosPlatos);
end;
/

/*### Ejercicio 5
Crea un paquete que se llame paqueteLibreriaRestaurante que contenga:
- Funci�n calculaDineroComandasDias.
- Procedimiento incluyeComanda.
- Procedimiento eliminarComanda.
- Funci�n obtenerPalabrasYEspaciosPlatos. */


/*### Ejercicio 6
Se quiere un programa o bloque de c�digo an�nimo que, empleando las funciones y procedimientos anteriores del paquete paqueteLibreriaRestaurante, haga:
- Muestra por pantalla la diferencia entre el dinero ganado el d�a 01/03/21 y el 02/03/21.
- Inserta una nueva comanda con los siguientes par�metros:
    - Mesa: 1
    - Nombre del cliente: Jose Miguel
    - Nombre del plato: Entrante bacalao en aceite
- Borra la comanda creada anteriormente usando como datos para calcular el id de la comanda lo siguiente:
    - Ha sido en el d�a de hoy.
    - Es de Jose Miguel.
- Llama a la funci�n obtenerPalabrasYEspaciosPlatos y muestra por pantalla el valor devuelto con el n�mero de espacios que hay en los nombres de los platos. */


/*### Ejercicio 7
Se quiere mostrar por pantalla, mediante un programa, el estado de las comandas que tiene m�s vocales. Una vez averiguado cu�l es, utiliza la fecha y hora 
de la comanda que tiene ese estado para mostrar por pantalla cu�ntos segundos han pasado desde el 1 de enero del a�o de esa comanda hasta la fecha y hora 
de la comanda. */