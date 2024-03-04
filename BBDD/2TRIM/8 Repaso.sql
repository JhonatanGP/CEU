
--1. ¿Cuántos clientes tienen por nombre de contacto Maria?
SELECT * FROM CLIENTE;
SELECT COUNT(*) FROM CLIENTE WHERE NOMBRE_CONTACTO = 'Maria';

--2. Devuelve la línea de dirección 1 de los clientes, sustituyendo C/ por la palabra CALLE, cuando sea necesario y la ciudad sea Fuenlabrada
SELECT REPLACE (linea_direccion1,'C/','CALLE ') from cliente where ciudad = 'Fuenlabrada';

--3. Indica el país, con todas sus letras en mayúsculas, que tiene más clientes
select * from 
select upper(pais) from cliente group by pais having COUNT(*) = (select max(count(*)) from cliente group by pais);

--4. Indica el nombre del cliente con todas las letras en minúsculas de aquellos cuyo fax termina en 16
select lower(nombre_cliente) from cliente where fax like '%16';
--5. Se quiere sustituir todas las vocales por el caracter - en el nombre de contacto, y mostrarlo (tabla cliente)

--6. Devuelve en una columna el nombre de contacto, en otra el apellido de contacto y en una tercera el número de palabras que hay en el apellido del contacto en la tabla cliente (se debe suponer que solo es posible 1 o 2 apellidos a lo sumo, separados por un espacio siempre).

--7. Devuelve el nombre de los cliente junto al caracter : y el campo limite_credito de aquellos clientes cuyo límite de crédito está entre 10000 y 50000. La cadena debe mostrarse en una única columna y terminar con la palabra "euros".

--8. Se quiere saber el nombre del empleado y el número de clientes que representa como ventas, ordenados primero por el que tiene más clientes representados (de mayor a menor), y luego por el nombre del empleado en orden alfabético (A a Z).

--9. ¿Cuántos códigos postales de clientes tienen un 8 o un 9 entre sus cifras?

--10. Se quiere saber el nombre de aquellos clientes que no tienen línea de dirección 2, su ciudad es Madrid y su línea de dirección 1 acaba en 4