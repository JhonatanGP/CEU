drop table platos cascade constraints;
drop table ingredientes cascade constraints;
drop table ingredientes_platos cascade constraints;
drop table clientes cascade constraints;
drop table comandas cascade constraints;
create table platos (
    id int primary key,
    nombre varchar(100) not null,
    precio number(6,2),
    tiempo_preparacion int
);
create table ingredientes(
    id int primary key,
    nombre varchar(100) not null,
    categoria varchar(30) check(categoria in ('CARNE','PESCADO','CONDIMENTO','FRUTA','VERDURA','LACTEO','BEBIDA','LEGUMBRE','OTRO')),
    estado varchar(30) check( estado in ('SOLIDO','LIQUIDO'))
);
create table ingredientes_platos(
    id_ingrediente int,
    id_plato int,
    cantidad int
);
alter table ingredientes_platos
add foreign key (id_ingrediente) references ingredientes(id);
alter table ingredientes_platos
add foreign key (id_plato) references platos(id);
create table clientes(
    id int primary key,
    nombre varchar(100) not null,
    telefono varchar(10),
    localidad varchar(100) not null
);
create table comandas(
    id int primary key,
    mesa int,
    id_cliente int,
    id_plato int,
    estado varchar(30) check( estado in ('COCINA','SERVIDO','COBRADO','DEVUELTO')),
    fecha date,
    hora char(5)
);
alter table comandas
add foreign key (id_cliente) references clientes(id);
alter table comandas
add foreign key (id_plato) references platos(id);

insert into platos values (1,'Plato Arroz caldoso',12.50,25);
insert into platos values (2,'Plato Calamares con patatas',7.50,15);
insert into platos values (3,'Entrante bacalao en aceite',4.50,10);
insert into platos values (4,'Entrante Crema de zanahorias',3,10);
insert into platos values (5,'Tarta de queso',5.50,10);

insert into ingredientes values (1,'Ajo','VERDURA','SOLIDO');
insert into ingredientes values (2,'Aceite de oliva virgen extra','CONDIMENTO','LIQUIDO');
insert into ingredientes values (3,'Cebolla','VERDURA','SOLIDO');
insert into ingredientes values (4,'Calamar','PESCADO','SOLIDO');
insert into ingredientes values (5,'Patata','VERDURA','SOLIDO');
insert into ingredientes values (6,'Pimiento','VERDURA','SOLIDO');
insert into ingredientes values (7,'Vino blanco','BEBIDA','LIQUIDO');
insert into ingredientes values (8,'Sal','CONDIMENTO','SOLIDO');
insert into ingredientes values (9,'Pimienta','CONDIMENTO','SOLIDO');
insert into ingredientes values (10,'Costilla de cerdo','CARNE','SOLIDO');
insert into ingredientes values (11,'Guisante','VERDURA','SOLIDO');
insert into ingredientes values (12,'Tomate','VERDURA','SOLIDO');
insert into ingredientes values (13,'Pimenton dulce','CONDIMENTO','SOLIDO');
insert into ingredientes values (14,'Agua','BEBIDA','LIQUIDO');
insert into ingredientes values (15,'Caldo de ave','BEBIDA','LIQUIDO');
insert into ingredientes values (16,'Arroz','LEGUMBRE','SOLIDO');
insert into ingredientes values (17,'Bacalao','PESCADO','SOLIDO');
insert into ingredientes values (18,'Guindilla','CONDIMENTO','SOLIDO');
insert into ingredientes values (19,'Perejil','CONDIMENTO','SOLIDO');
insert into ingredientes values (20,'Zanahoria','VERDURA','SOLIDO');
insert into ingredientes values (21,'Caldo de verduras','CONDIMENTO','LIQUIDO');
insert into ingredientes values (22,'Nata liquida','LACTEO','LIQUIDO');
insert into ingredientes values (23,'Queso mascarpone','LACTEO','SOLIDO');
insert into ingredientes values (24,'Leche','LACTEO','SOLIDO');
insert into ingredientes values (25,'Esencia vainilla','CONDIMENTO','LIQUIDO');
insert into ingredientes values (26,'Huevo','OTRO','SOLIDO');
insert into ingredientes values (27,'Harina','OTRO','SOLIDO');
insert into ingredientes values (28,'Frutos rojos','FRUTA','SOLIDO');

insert into ingredientes_platos values (1,1,3);
insert into ingredientes_platos values (2,1,30);
insert into ingredientes_platos values (10,1,300);
insert into ingredientes_platos values (11,1,60);
insert into ingredientes_platos values (12,1,40);
insert into ingredientes_platos values (13,1,5);
insert into ingredientes_platos values (14,1,250);
insert into ingredientes_platos values (15,1,400);
insert into ingredientes_platos values (6,1,80);
insert into ingredientes_platos values (8,1,10);
insert into ingredientes_platos values (16,1,150);
insert into ingredientes_platos values (4,2,400);
insert into ingredientes_platos values (2,2,40);
insert into ingredientes_platos values (3,2,100);
insert into ingredientes_platos values (1,2,10);
insert into ingredientes_platos values (5,2,120);
insert into ingredientes_platos values (6,2,80);
insert into ingredientes_platos values (7,2,120);
insert into ingredientes_platos values (8,2,12);
insert into ingredientes_platos values (9,2,8);
insert into ingredientes_platos values (17,3,125);
insert into ingredientes_platos values (1,3,5);
insert into ingredientes_platos values (18,3,2);
insert into ingredientes_platos values (2,3,20);
insert into ingredientes_platos values (19,3,2);
insert into ingredientes_platos values (3,4,25);
insert into ingredientes_platos values (20,4,60);
insert into ingredientes_platos values (21,4,250);
insert into ingredientes_platos values (22,4,50);
insert into ingredientes_platos values (8,4,5);
insert into ingredientes_platos values (9,4,5);
insert into ingredientes_platos values (2,4,15);
insert into ingredientes_platos values (2,5,3);
insert into ingredientes_platos values (23,5,60);
insert into ingredientes_platos values (24,5,20);
insert into ingredientes_platos values (25,5,1);
insert into ingredientes_platos values (26,5,10);
insert into ingredientes_platos values (27,5,10);
insert into ingredientes_platos values (28,5,20);

insert into clientes values (1,'Pedro Juan','111222333','Bormujos');
insert into clientes values (2,'Jose Miguel','222333444','Bormujos');
insert into clientes values (3,'Maria','333444555','Gines');

insert into comandas values (1,1,1,3,'COCINA','01-03-2021','21:00');
insert into comandas values (2,1,1,1,'COCINA','01-03-2021','21:00');
insert into comandas values (3,2,2,3,'COCINA','01-03-2021','21:05');
insert into comandas values (4,2,2,4,'COCINA','01-03-2021','21:05');
insert into comandas values (5,1,1,3,'SERVIDO','01-03-2021','21:10');
insert into comandas values (6,2,2,3,'SERVIDO','01-03-2021','21:15');
insert into comandas values (7,2,2,4,'SERVIDO','01-03-2021','21:16');
insert into comandas values (8,2,2,2,'COCINA','01-03-2021','21:16');
insert into comandas values (9,1,1,1,'SERVIDO','01-03-2021','21:25');
insert into comandas values (10,1,1,5,'COCINA','01-03-2021','21:25');
insert into comandas values (11,2,2,5,'COCINA','01-03-2021','21:26');
insert into comandas values (12,2,2,2,'SERVIDO','01-03-2021','21:35');
insert into comandas values (13,1,1,5,'SERVIDO','01-03-2021','21:37');
insert into comandas values (14,2,2,5,'SERVIDO','01-03-2021','21:38');
insert into comandas values (15,1,1,3,'COBRADO','01-03-2021','21:50');
insert into comandas values (16,1,1,1,'COBRADO','01-03-2021','21:50');
insert into comandas values (17,1,1,5,'COBRADO','01-03-2021','21:50');
insert into comandas values (18,1,2,3,'COBRADO','01-03-2021','21:50');
insert into comandas values (19,1,2,4,'COBRADO','01-03-2021','21:50');
insert into comandas values (20,1,2,2,'COBRADO','01-03-2021','21:50');
insert into comandas values (21,1,2,5,'COBRADO','01-03-2021','21:50');
insert into comandas values (22,1,3,3,'COCINA','02-03-2021','21:05');
insert into comandas values (23,1,3,1,'COCINA','02-03-2021','21:10');
insert into comandas values (24,1,3,2,'COCINA','02-03-2021','21:12');
insert into comandas values (25,1,3,1,'DEVUELTO','02-03-2021','21:12');
insert into comandas values (26,1,3,3,'SERVIDO','02-03-2021','21:15');
insert into comandas values (27,1,3,2,'SERVIDO','02-03-2021','21:27');
insert into comandas values (28,1,3,5,'COCINA','02-03-2021','21:27');
insert into comandas values (29,1,3,5,'SERVIDO','02-03-2021','21:37');
insert into comandas values (30,1,3,3,'COBRADO','02-03-2021','21:55');
insert into comandas values (31,1,3,2,'COBRADO','02-03-2021','21:55');
insert into comandas values (32,1,3,5,'COBRADO','02-03-2021','21:55');

--# Examen DAM1  ## Opción A BASE DE DATOS: restaurante.sql
set serveroutput on;
/*### Ejercicio 1
Crea una función que se llame calculaDineroComandasDias que reciba como parámetro un día (formato día, mes y año, tal y como está el campo 
fecha de comandas en base de datos) y devuelva el importe total que se ha ganado ese día.
NOTA 1: los precios de los platos están en la tabla platos.
NOTA 2: solo nos interesan las comandas que se encuentren en estado COBRADO. */
create or replace function calculaDineroComandasDias(dia comandas.fecha%type) return platos.precio%type
is
    totalCobrado platos.precio%type;
    cursor datos is select * from comandas where estado = 'COBRADO' and fecha = dia;
    precioPlato platos.precio%type;
begin
    /* Opción 1
    select 
        sum(precio) into totalCobrado 
        from comandas 
        join platos on platos.id = comandas.id_plato 
        where estado = 'COBRADO' and fecha = dia;
    Fin Opción 1 */
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
Crea un procedimiento que se llame incluyeComanda que reciba como parámetros de entrada los siguientes:
- Mesa donde se ha atendido.
- Nombre del cliente.
- Nombre del plato. Cuando crees la comanda en la tabla, recuerda añadir también los datos siguientes:
- Estado: siempre será COCINA.
- Fecha: el día de hoy.
- Hora: la hora de este momento en formato char(5) con dos caracteres para la hora, luego caracter : y otros dos caracteres para los minutos 
(tal y como está guardado en base de datos). El id de la comanda debe ser una unidad mayor que el id mayor que exista en la tabla comandas. 
Ej: si la comanda de id mayor tiene valor 25, tienes que introducir tu nueva comanda con id igual a 26.
Al crear la comanda, muestra el mensaje "Comanda registrada correctamente en COCINA".
Excepciones:
- Debes contemplar que el cliente y el plato existen. En caso de que no seas así, mostrar por pantalla 'Datos incorrectos'; */

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
Crea un procedimiento que se utilice para borrar comandas que se llame eliminarComanda, que reciba por parámetro el id de una comanda y elimine dicho 
registro de la tabla. Una vez se borre, mostrar el mensaje "Comanda eliminada satisfactoriamente". Ten en cuenta que:
- Es necesario que el id de la comanda exista en la tabla comandas. Si no es así, crear una excepción personalizada llamada idNoValido que muestre por
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
Se quiere crear una función denominada obtenerPalabrasYEspaciosPlatos que no reciba ningún parámetro y que devuelva el número de espacios en blanco 
que hay en total entre todos los nombres de platos. Además, se quiere que se muestre por pantalla el nombre de cada plato seguido del número de 
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
- Función calculaDineroComandasDias.
- Procedimiento incluyeComanda.
- Procedimiento eliminarComanda.
- Función obtenerPalabrasYEspaciosPlatos. */


/*### Ejercicio 6
Se quiere un programa o bloque de código anónimo que, empleando las funciones y procedimientos anteriores del paquete paqueteLibreriaRestaurante, haga:
- Muestra por pantalla la diferencia entre el dinero ganado el día 01/03/21 y el 02/03/21.
- Inserta una nueva comanda con los siguientes parámetros:
    - Mesa: 1
    - Nombre del cliente: Jose Miguel
    - Nombre del plato: Entrante bacalao en aceite
- Borra la comanda creada anteriormente usando como datos para calcular el id de la comanda lo siguiente:
    - Ha sido en el día de hoy.
    - Es de Jose Miguel.
- Llama a la función obtenerPalabrasYEspaciosPlatos y muestra por pantalla el valor devuelto con el número de espacios que hay en los nombres de los 
platos. */


/*### Ejercicio 7
Se quiere mostrar por pantalla, mediante un programa, el estado de las comandas que tiene más vocales. Una vez averiguado cuál es, utiliza la fecha y hora 
de la comanda que tiene ese estado para mostrar por pantalla cuántos segundos han pasado desde el 1 de enero del año de esa comanda hasta la fecha y hora 
de la comanda. */