
--1. ¿Cuántos clientes tienen por nombre de contacto Maria?
SELECT * FROM CLIENTE;
SELECT COUNT(*) FROM CLIENTE WHERE NOMBRE_CONTACTO = 'Maria';

--2. Devuelve la línea de dirección 1 de los clientes, sustituyendo C/ por la palabra CALLE, cuando sea necesario y la ciudad sea Fuenlabrada
SELECT REPLACE (linea_direccion1,'C/','CALLE ') from cliente where ciudad = 'Fuenlabrada';

--3. Indica el país, con todas sus letras en mayúsculas, que tiene más clientes
select upper(pais) from cliente group by pais having COUNT(*) = (select max(count(*)) from cliente group by pais);

--4. Indica el nombre del cliente con todas las letras en minúsculas de aquellos cuyo fax termina en 16.
select lower(nombre_cliente) from cliente where fax like '%16';

--5. Se quiere sustituir todas las vocales por el caracter - en el nombre de contacto, y mostrarlo (tabla cliente)
select replace(nombre_contacto,'-') from cliente;
select replace(replace(replace(replace(replace(lower(nombre_contacto),'a','-'),'e','-'),'i','-'),'o','-'),'u','-') from cliente;

--6. Devuelve en una columna el nombre de contacto, en otra el apellido de contacto y en una tercera el número de palabras que hay en el apellido del contacto en la tabla cliente (se debe suponer que solo es posible 1 o 2 apellidos a lo sumo, separados por un espacio siempre)
select * from cliente;
select nombre_contacto,apellido_contacto,decode(instr(apellido_contacto,' '),0,'1','2') from cliente;

--7. Devuelve el nombre de los cliente junto al caracter : y el campo limite_credito de aquellos clientes cuyo límite de crédito está entre 10000 y 50000. La cadena debe mostrarse en una única columna y terminar con la palabra "euros".
select nombre_cliente ||': '||limite_credito||' euros' as "LIMITE CREDITO" from cliente where limite_credito between 10000 and 50000;

--8. Se quiere saber el nombre del empleado y el número de clientes que representa como ventas, ordenados primero por el que tiene más clientes representados (de mayor a menor), y luego por 
--el nombre del empleado en orden alfabético (A a Z).
select * from empleado;
select * from cliente;
select empleado.nombre, count(codigo_empleado_rep_ventas) from cliente join empleado on cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado group by empleado.nombre;

--9. ¿Cuántos códigos postales de clientes tienen un 8 o un 9 entre sus cifras?
select count (*) codigo_postal from cliente where codigo_postal like '%8' or codigo_postal like '%9';

--10. Se quiere saber el nombre de aquellos clientes que no tienen línea de dirección 2, su ciudad es Madrid y su línea de dirección 1 acaba en 4
select * from cliente;
select nombre_cliente from cliente where linea_direccion2 is null and ciudad = 'Madrid' and linea_direccion1 like '%4';

--1. Se quiere saber la segunda palabra del nombre de los clientes y mostrarla en mayúsculas. En caso de que no tenga, no debe aparecer en la lista. No deben aparecer espacios ni antes ni después de esta segunda palabra. Se entiende que la segunda palabra es aquella que está entre el primer espacio y el segundo espacio.
select  upper(substr(nombre_cliente,instr(nombre_cliente,' ',1,1)+1,instr(nombre_cliente || ' ',' ',1,2)-instr(nombre_cliente,' ',1,1)-1))
        from cliente
        where substr(nombre_cliente,instr(nombre_cliente,' ',1,1)+1,instr(nombre_cliente || ' ',' ',1,2)-instr(nombre_cliente,' ',1,1)-1) is not null;
--2. Se quiere mostrar en una única columna y fila una frase que contenga el nombre del cliente que hizo el último pago, el nombre del cliente que hizo el primer pago y la diferencia en meses (entero inferior, sin decimales) entre ambos pagos. El resultado debería ser tal que así tras las concatenaciones de dichos tres campos: 'Sotogrande y Tendo Garden. Han pasado 38 meses'.

--3. Empleando IN, obtén el nombre y gama de todos los productos que sean de la gama Ornamentales, Frutales y Aromáticas, y el tamaño/número de caracteres del nombre sea inferior o igual a 10 caracteres.

--4. Se quiere saber el código de los pedidos que no tienen comentarios y además la fecha del pedido se encuentra entre enero de 2008 y febrero de 2009.
