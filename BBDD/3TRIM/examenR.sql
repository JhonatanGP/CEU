/*Ejercicio 1
Se quiere crear un programa que corrija fallos en las comandas. Para ello pedirá que se meta por teclado dos nombres de clientes, el primero será el que existe en la tabla
comandas y está mal, y el segundo el nuevo que sustituye al primero y que habrá que guardar en la tabla. También se pedirán otros dos valores que serán la fecha y la hora 
que se quiere cambiar de ese cliente. Si no hay comandas de ese cliente debes mostrar 0, y si las hay, actualizar esas filas en la tabla comandas cambiando el id_cliente
correspondiente a ese nombre de cliente pasado, y mostrar el número total de filas modificadas. NOTA: hay que comprobar que ese nombre introducido existe como cliente y en caso
contrario, mostrar el mensaje 'No existe ese nombre de cliente', tanto para el cliente nuevo como el antiguo, ambos deben existir previamente en la tabla clientes.
*/
set serveroutput on;

declare
nombreAntiguo clientes.nombre%type := '&nombreAntiguo'; --Pedro Juan
nombreNuevo clientes.nombre%type := '&nombreNuevo'; --Jose Miguel
fechaComanda comandas.fecha%type := '&fecha'; --01/03/2021
fechaHora comandas.hora%type := '&hora'; --21:00
cursor datos is
select comandas.id as comandaId,id_cliente
from comandas
join clientes on clientes.id = comandas.id_cliente
where nombre = nombreAntiguo and fecha = fechaComanda and hora = fechaHora;
clienteNuevoId clientes.id%type;
contador int := 0;
existeAntiguo clientes.nombre%type;
begin
select id into clienteNuevoId from clientes where nombre = nombreNuevo;
select id into existeAntiguo from clientes where nombre = nombreAntiguo;
for fila in datos loop
update comandas set id_cliente = clienteNuevoId where id = fila.comandaId;
contador := contador + 1;
end loop;
dbms_output.put_line('total ' || contador);
exception
when no_data_found then
dbms_output.put_line('No existe ese nombre de cliente');
end;
/

/*Ejercicio 2
Se quiere hacer un BUSCADOR completo para nuestra base de datos del restaurante, por lo que necesitamos crear distintas funciones y procedimientos para poder seleccionar distintos
datos de platos, ingredientes, clientes y comandas. Todas estas funciones y procedimientos deberán estar dentro de un paquete llamado miRestaurante. Se pide lo siguiente:
1.1. Crea una función obtenerIngredientesPlato que reciba como parámetros el nombre de un plato (nombre de la tabla platos) y una categoría de ingrediente (campo categoria en la tabla
ingredientes), muestre por la salida todos los ingredientes que tiene ese plato (solo el nombre del ingrediente) y al finalizar, aparezca el mensaje 'De todos esos ingredientes, hay X de
la categoría Y', debiendo sustituir X por el número total de ingredientes de ese plato que son de la categoría pasada como parámetro, e Y será el nombre de esa categoría. Para finalizar,
se devolverá el número total de ingredientes que tiene ese plato.
EXCEPCIONES: si se pasa un nombre de un plato que no existe, o bien una categoría que no exista en la base de datos (independientemente de que ese plato tenga ingredientes o no de
esa categoría), debes mostrar un mensaje indicando 'Error, ese plato o categoría no es válido' y devolver -1. Si existiera un plato válido con categoría de ingrediente válido pero sin
ingredientes, devuelve 0.*/

create or replace function obtenerIngredientesPlato(nombrePlato platos.nombre%type,categoriaIngrediente ingredientes.categoria%type) return int
is
    cursor datos is
    select i.nombre as nombreIngrediente,i.categoria
    from ingredientes i
    join ingredientes_platos on id_ingrediente = i.id
    join platos on platos.id = id_plato
where platos.nombre = nombrePlato;
contador int := 0;
total int := 0;
existePlato platos.nombre%type;
existeCategoria ingredientes.categoria%type;
begin
select nombre into existePlato from platos where nombre = nombrePlato;
select distinct categoria into existeCategoria from ingredientes where categoria =
categoriaIngrediente;
for fila in datos loop
if fila.categoria = categoriaIngrediente then
contador := contador + 1;
end if;
dbms_output.put_line(fila.nombreIngrediente);
total := total + 1;
end loop;
dbms_output.put_line('De todos esos ingredientes, hay ' || contador || ' de la categoría ' ||
categoriaIngrediente);
return total;
exception
when no_data_found then
dbms_output.put_line('Error, ese plato o categoría no es válido');
return -1;
end;
/
begin
dbms_output.put_line(obtenerIngredientesPlato('Tarta de queso','LACTEO'));
end;
/
/*1.2. Crea una función obtenerPlatosPesos que reciba como parámetros dos cantidades, muestre por pantalla el nombre de los platos cuya suma de cantidad de los ingredientes que
forman ese plato se encuentre entre las dos cantidades pasadas por parámetro. Debe devolver el número total de platos mostrados. Es importante que dé igual el orden de estos parámetros,
es decir, puede ser el primero mayor que el segundo, a la inversa o iguales, en todos los casos se debe mostrar los platos que tengan la suma de cantidades de sus ingredientes entre ambos
valores, o en caso de que sean iguales, una suma de pesos exactamente igual a dicho valor. Debes contemplar que no se introduzcan valores menores a cero, en cuyo caso muestra una
excepción personalizada llamada noPesoNegativo que muestre el mensaje 'No puedes poner pesos negativos' y devuelva -1.*/

create or replace function obtenerPlatosPesos(
cantidad1 ingredientes_platos.cantidad%type,
cantidad2 ingredientes_platos.cantidad%type) return int
is
cursor datos is
select nombre,sum(cantidad) as cantidadPlato
from ingredientes_platos
join platos on id = id_plato
group by nombre;
contador int := 0;
noPesoNegativo exception;
begin
if cantidad1 < 0 or cantidad2 < 0 then
raise noPesoNegativo;
end if;
for fila in datos loop
if cantidad1 > cantidad2 then
if fila.cantidadPlato between cantidad2 and cantidad1 then
dbms_output.put_line(fila.nombre);
contador := contador + 1;
end if;
elsif cantidad1 < cantidad2 then
if fila.cantidadPlato between cantidad1 and cantidad2 then
dbms_output.put_line(fila.nombre);
contador := contador + 1;
end if;
else --son iguales
if fila.cantidadPlato = cantidad1 then
dbms_output.put_line(fila.nombre);
contador := contador + 1;
end if;
end if;
end loop;
return contador;
exception
when noPesoNegativo then
dbms_output.put_line('No puedes poner pesos negativos');
return -1;
end;
/
begin
dbms_output.put_line(obtenerPlatosPesos(124,124));
end;
/
1.3. Crea un procedimiento que se llame encuentraLetrasIngredientes al que se le pase como
parámetros una letra como primer parámetro, y el número de veces que se quiere que
aparezcan en el nombre de un ingrediente. El procedimiento mostrará por la salida de consola
el nombre de aquellos ingredientes que tienen exactamente ese número de veces (segundo
parámetro) esa letra (primer parámetro). Si no hay ningún ingrediente que cumpla esta
condición, se mostrará el mensaje 'No aparece la letra X un número de Y veces en los
ingredientes', siendo X la letra recibida e Y el número de veces indicado.
create or replace procedure encuentraLetrasIngredientes(letra varchar, numveces int)
is
cursor datos is select lower(nombre) as nombre from ingredientes where lower(nombre)
like '%' || lower(letra) || '%'; --'%a%'
contador int := 0;
total int := 0;
begin
for fila in datos loop
for i in 1..length(fila.nombre) loop
if substr(fila.nombre,i,1) = letra then
contador := contador + 1;
end if;
end loop;
if contador = numveces then
dbms_output.put_line(fila.nombre);
total := total + 1;
end if;
contador := 0;
end loop;
if total = 0 then
dbms_output.put_line('No aparece la letra ' || letra || ' un número de ' || numveces || ' veces
en los ingredientes');
end if;
end;
/
begin
encuentraLetrasIngredientes('a',4);
end;
/
/*
1.4. Se quiere un procedimiento llamado comandasTotal, que tendrá un parámetro de entrada
diaSemana que será un día de la semana con todas sus letras en minúsculas (Ej.: lunes, martes,
miercoles, etc.), un parámetro de salida que llame total, y que realice lo siguiente:
- A partir de la semana pasado por parámetro, obtener el número total de comandas
realizadas en ese día de la semana (lunes, martes, etc.) y guardar ese valor en el parámetro de
salida total.
- Mostrar un mensaje por la salida de consola con el número total de comandas de ese día de
la semana cuya hora tiene un valor par de minutos (ej.: 2, 4, 16, 44, etc. MINUTOS). NOTA: no
calcules el valor total de minutos contando las horas, solo los minutos de ese valor. Ej.: 21:50
vale porque 50 es par.
- Indicar en un mensaje por la salida el número total de comandas en ese día de la semana
hechas por 'Pedro Juan'. */

create or replace procedure comandasTotal(diaSemana varchar,total out int)
is
cursor datos is select hora from comandas where replace(to_char(fecha,'day'),' ') =
diaSemana;
contador int := 0;
totalPedroJuan int := 0;
begin
select count(*) into total from comandas where replace(to_char(fecha,'day'),' ') =
diaSemana;
for fila in datos loop
if mod(to_number(substr(fila.hora,4,2)),2) = 0 then --par
contador := contador + 1;
end if;
end loop;
dbms_output.put_line('Pares ' || contador);
select count(*) into totalPedroJuan from comandas where replace(to_char(fecha,'day'),' ') =
diaSemana and id_cliente = (select id from clientes where nombre = 'Pedro Juan');
dbms_output.put_line('Pedro Juan ' || totalPedroJuan);
end;
/
declare
total int;
begin
comandasTotal('lunes',total);
dbms_output.put_line('Total ' || total);
end;
/

--1.5. Debes introducir todas las funciones y procedimientos anteriores dentro de un paquete llamado miRestaurante.

create or replace package miRestaurante
is
function obtenerIngredientesPlato(
nombrePlato platos.nombre%type,
categoriaIngrediente ingredientes.categoria%type) return int;
function obtenerPlatosPesos(
cantidad1 ingredientes_platos.cantidad%type,
cantidad2 ingredientes_platos.cantidad%type) return int;
procedure encuentraLetrasIngredientes(letra varchar, numveces int);
procedure comandasTotal(diaSemana varchar,total out int);
end;
/
create or replace package body miRestaurante
is
function obtenerIngredientesPlato(
nombrePlato platos.nombre%type,
categoriaIngrediente ingredientes.categoria%type) return int
is
cursor datos is
select i.nombre as nombreIngrediente,i.categoria
from ingredientes i
join ingredientes_platos on id_ingrediente = i.id
join platos on platos.id = id_plato
where platos.nombre = nombrePlato;
contador int := 0;
total int := 0;
existePlato platos.nombre%type;
existeCategoria ingredientes.categoria%type;
begin
select nombre into existePlato from platos where nombre = nombrePlato;
select distinct categoria into existeCategoria from ingredientes where categoria =
categoriaIngrediente;
for fila in datos loop
if fila.categoria = categoriaIngrediente then
contador := contador + 1;
end if;
dbms_output.put_line(fila.nombreIngrediente);
total := total + 1;
end loop;
dbms_output.put_line('De todos esos ingredientes, hay ' || contador || ' de la categoría ' ||
categoriaIngrediente);
return total;
exception
when no_data_found then
dbms_output.put_line('Error, ese plato o categoría no es válido');
return -1;
end;
function obtenerPlatosPesos(
cantidad1 ingredientes_platos.cantidad%type,
cantidad2 ingredientes_platos.cantidad%type) return int
is
cursor datos is
select nombre,sum(cantidad) as cantidadPlato
from ingredientes_platos
join platos on id = id_plato
group by nombre;
contador int := 0;
noPesoNegativo exception;
begin
if cantidad1 < 0 or cantidad2 < 0 then
raise noPesoNegativo;
end if;
for fila in datos loop
if cantidad1 > cantidad2 then
if fila.cantidadPlato between cantidad2 and cantidad1 then
dbms_output.put_line(fila.nombre);
contador := contador + 1;
end if;
elsif cantidad1 < cantidad2 then
if fila.cantidadPlato between cantidad1 and cantidad2 then
dbms_output.put_line(fila.nombre);
contador := contador + 1;
end if;
else --son iguales
if fila.cantidadPlato = cantidad1 then
dbms_output.put_line(fila.nombre);
contador := contador + 1;
end if;
end if;
end loop;
return contador;
exception
when noPesoNegativo then
dbms_output.put_line('No puedes poner pesos negativos');
return -1;
end;
procedure encuentraLetrasIngredientes(letra varchar, numveces int)
is
cursor datos is select lower(nombre) as nombre from ingredientes where lower(nombre)
like '%' || lower(letra) || '%'; --'%a%'
contador int := 0;
total int := 0;
begin
for fila in datos loop
for i in 1..length(fila.nombre) loop
if substr(fila.nombre,i,1) = letra then
contador := contador + 1;
end if;
end loop;
if contador = numveces then
dbms_output.put_line(fila.nombre);
total := total + 1;
end if;
contador := 0;
end loop;
if total = 0 then
dbms_output.put_line('No aparece la letra ' || letra || ' un número de ' || numveces || ' veces
en los ingredientes');
end if;
end;
procedure comandasTotal(diaSemana varchar,total out int)
is
cursor datos is select hora from comandas where replace(to_char(fecha,'day'),' ') =
diaSemana;
contador int := 0;
totalPedroJuan int := 0;
begin
select count(*) into total from comandas where replace(to_char(fecha,'day'),' ') =
diaSemana;
for fila in datos loop
if mod(to_number(substr(fila.hora,4,2)),2) = 0 then --par
contador := contador + 1;
end if;
end loop;
dbms_output.put_line('Pares ' || contador);
select count(*) into totalPedroJuan from comandas where replace(to_char(fecha,'day'),' ') =
diaSemana and id_cliente = (select id from clientes where nombre = 'Pedro Juan');
dbms_output.put_line('Pedro Juan ' || totalPedroJuan);
end;
end;
/
/*1.6. Crea un programa que realice lo siguiente haciendo llamadas a funciones y
procedimientos del paquete miRestaurante:
1. Llamada a la función obtenerIngredientesPlato para el "Plato Arroz caldoso" y la categoría
de ingrediente "CONDIMENTO". Muestra el resultado.
2. Usando la función obtenerPlatosPesos, muestra el resultado pasando los parámetros
siguiendo el orden indicado:
 2.1. 100 y 410.
 2.2. 1400 y 800.
3. Empleando encuentraLetrasIngredientes, averigua cuantos ingredientes tienen la letra v dos
veces en su nombre.
4. Termina ejecutando el procedimiento comandasTotal para el día de la semana lunes y
muestra después por la salida de consola el valor del parámetro de salida. */
declare
total int;
begin
dbms_output.put_line(miRestaurante.obtenerIngredientesPlato('Plato Arroz
caldoso','CONDIMENTO'));
dbms_output.put_line(miRestaurante.obtenerPlatosPesos(100,410));
dbms_output.put_line(miRestaurante.obtenerPlatosPesos(1400,800));
miRestaurante.encuentraLetrasIngredientes('v',2);
miRestaurante.comandasTotal('lunes',total);
dbms_output.put_line(total);
end;
/
/*
Ejercicio 3
Se quiere crear un programa que pida una fecha por teclado y muestre por la salida un mensaje con el
tiempo empleado TOTAL por el personal de la cocina para preparar esos platos de ese día. Diremos que
un plato se ha preparado y su estado fue COCINA en algún momento en las comandas. Recuerda sumar el
tiempo total de todos los platos y que se puede haber preparado varias veces el mismo plato ese día.
Crea una excepción personalizada noCocina que se llame cuando no haya ningún plato cocinado ese día,
mostrando por pantalla el mensaje 'No se cocinó nada ese día'.
NOTA: el campo tiempo_preparacion de la tabla platos son MINUTOS.*/

select sum(tiempo_preparacion) from comandas join platos on platos.id =
comandas.id_plato where
estado = 'COCINA' and fecha = '01/03/22';
declare
fechaComanda comandas.fecha%type := '&fecha';
total platos.tiempo_preparacion%type;
noCocina exception;
begin
select sum(tiempo_preparacion) into total from comandas join platos on platos.id =
comandas.id_plato where
estado = 'COCINA' and fecha = fechaComanda;
if total is null then
raise noCocina;
end if;
dbms_output.put_line('Tiempo total: ' || total);
exception
when noCocina then
dbms_output.put_line('No se cocinó nada ese día');
end;
/