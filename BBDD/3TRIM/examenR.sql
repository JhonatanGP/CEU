/*Ejercicio 1
Se quiere crear un programa que corrija fallos en las comandas. Para ello pedirá que se meta por teclado dos nombres de clientes, el primero será el que existe 
en la tabla comandas y está mal, y el segundo el nuevo que sustituye al primero y que habrá que guardar en la tabla. También se pedirán otros dos valores que
serán la fecha y la hora que se quiere cambiar de ese cliente. Si no hay comandas de ese cliente debes mostrar 0, y si las hay, actualizar esas filas en la 
tabla comandas cambiando el id_cliente correspondiente a ese nombre de cliente pasado, y mostrar el número total de filas modificadas. NOTA: hay que comprobar
que ese nombre introducido existe como cliente y en caso contrario, mostrar el mensaje 'No existe ese nombre de cliente', tanto para el cliente nuevo como el
antiguo, ambos deben existir previamente en la tabla clientes. */
SET SERVEROUTPUT ON;

DECLARE
    nombreantiguo    clientes.nombre%TYPE := '&nombreAntiguo'; --Pedro Juan
    nombrenuevo      clientes.nombre%TYPE := '&nombreNuevo'; --Jose Miguel
    fechacomanda     comandas.fecha%TYPE := '&fecha'; --01/03/2021
    fechahora        comandas.hora%TYPE := '&hora'; --21:00
    CURSOR datos 
IS
    SELECT
        comandas.id AS comandaid,
        id_cliente
    FROM
        comandas
        JOIN clientes ON clientes.id = comandas.id_cliente
    WHERE
        nombre = nombreantiguo
        AND fecha = fechacomanda
        AND hora = fechahora;

    clientenuevoid   clientes.id%TYPE;
    contador         INT := 0;
    existeantiguo    clientes.nombre%TYPE;
BEGIN
    SELECT
        id
    INTO clientenuevoid
    FROM
        clientes
    WHERE
        nombre = nombrenuevo;

    SELECT
        id
    INTO existeantiguo
    FROM
        clientes
    WHERE
        nombre = nombreantiguo;
    FOR fila IN datos LOOP
        UPDATE comandas
        SET
            id_cliente = clientenuevoid
        WHERE
            id = fila.comandaid;
        contador := contador + 1;
    END LOOP;
    dbms_output.put_line('total ' || contador);
EXCEPTION
    WHEN no_data_found THEN
        dbms_output.put_line('No existe ese nombre de cliente');
END;
/

/*Ejercicio 2
Se quiere hacer un BUSCADOR completo para nuestra base de datos del restaurante, por lo que necesitamos crear distintas funciones y procedimientos para poder
seleccionar distintos datos de platos, ingredientes, clientes y comandas. Todas estas funciones y procedimientos deberán estar dentro de un paquete llamado
miRestaurante. Se pide lo siguiente:
1.1. Crea una función obtenerIngredientesPlato que reciba como parámetros el nombre de un plato (nombre de la tabla platos) y una categoría de ingrediente 
(campo categoria en la tabla ingredientes), muestre por la salida todos los ingredientes que tiene ese plato (solo el nombre del ingrediente) y al finalizar,
aparezca el mensaje 'De todos esos ingredientes, hay X de la categoría Y', debiendo sustituir X por el número total de ingredientes de ese plato que son de la
categoría pasada como parámetro, e Y será el nombre de esa categoría. Para finalizar, se devolverá el número total de ingredientes que tiene ese plato.
EXCEPCIONES: si se pasa un nombre de un plato que no existe, o bien una categoría que no exista en la base de datos (independientemente de que ese plato tenga
ingredientes o no de esa categoría), debes mostrar un mensaje indicando 'Error, ese plato o categoría no es válido' y devolver -1. Si existiera un plato válido
con categoría de ingrediente válido pero sin ingredientes, devuelve 0.*/

CREATE OR REPLACE FUNCTION obteneringredientesplato (
    nombreplato            platos.nombre%TYPE,
    categoriaingrediente   ingredientes.categoria%TYPE
) RETURN INT 
IS
    CURSOR datos 
    IS
    SELECT
        i.nombre AS nombreingrediente,
        i.categoria
    FROM
        ingredientes i
        JOIN ingredientes_platos ON id_ingrediente = i.id
        JOIN platos ON platos.id = id_plato
    WHERE
        platos.nombre = nombreplato;
    contador          INT := 0;
    total             INT := 0;
    existeplato       platos.nombre%TYPE;
    existecategoria   ingredientes.categoria%TYPE;
BEGIN
    SELECT
        nombre
    INTO existeplato
    FROM
        platos
    WHERE
        nombre = nombreplato;
    SELECT DISTINCT
        categoria
    INTO existecategoria
    FROM
        ingredientes
    WHERE
        categoria = categoriaingrediente;
    FOR fila IN datos LOOP
        IF fila.categoria = categoriaingrediente THEN
            contador := contador + 1;
        END IF;
        dbms_output.put_line(fila.nombreingrediente);
        total := total + 1;
    END LOOP;
    dbms_output.put_line('De todos esos ingredientes, hay ' || contador || ' de la categoría ' || categoriaingrediente);
    RETURN total;
EXCEPTION
    WHEN no_data_found THEN
        dbms_output.put_line('Error, ese plato o categoría no es válido');
        RETURN -1;
END;
/

BEGIN
    dbms_output.put_line(obteneringredientesplato('Tarta de queso', 'LACTEO'));
END;
/
/*1.2. Crea una función obtenerPlatosPesos que reciba como parámetros dos cantidades, muestre por pantalla el nombre de los platos cuya suma de cantidad de
los ingredientes que forman ese plato se encuentre entre las dos cantidades pasadas por parámetro. Debe devolver el número total de platos mostrados. Es 
importante que dé igual el orden de estos parámetros,es decir, puede ser el primero mayor que el segundo, a la inversa o iguales, en todos los casos se debe
mostrar los platos que tengan la suma de cantidades de sus ingredientes entre ambos valores, o en caso de que sean iguales, una suma de pesos exactamente 
igual a dicho valor. Debes contemplar que no se introduzcan valores menores a cero, en cuyo caso muestra una excepción personalizada llamada noPesoNegativo 
que muestre el mensaje 'No puedes poner pesos negativos' y devuelva -1. */

CREATE OR REPLACE FUNCTION obtenerplatospesos (
    cantidad1   ingredientes_platos.cantidad%TYPE,
    cantidad2   ingredientes_platos.cantidad%TYPE
) RETURN INT IS

    CURSOR datos IS
    SELECT
        nombre,
        SUM(cantidad) AS cantidadplato
    FROM
        ingredientes_platos
        JOIN platos ON id = id_plato
    GROUP BY
        nombre;

    contador INT := 0;
    nopesonegativo EXCEPTION;
BEGIN
    IF cantidad1 < 0 OR cantidad2 < 0 THEN
        RAISE nopesonegativo;
    END IF;
    FOR fila IN datos LOOP IF cantidad1 > cantidad2 THEN
        IF fila.cantidadplato BETWEEN cantidad2 AND cantidad1 THEN
            dbms_output.put_line(fila.nombre);
            contador := contador + 1;
        END IF;

    ELSIF cantidad1 < cantidad2 THEN
        IF fila.cantidadplato BETWEEN cantidad1 AND cantidad2 THEN
            dbms_output.put_line(fila.nombre);
            contador := contador + 1;
        END IF;
    ELSE --son iguales
        IF fila.cantidadplato = cantidad1 THEN
            dbms_output.put_line(fila.nombre);
            contador := contador + 1;
        END IF;
    END IF;
    END LOOP;

    RETURN contador;
EXCEPTION
    WHEN nopesonegativo THEN
        dbms_output.put_line('No puedes poner pesos negativos');
        RETURN -1;
END;
/

BEGIN
    dbms_output.put_line(obtenerplatospesos(124, 124));
END;
/
/*1.3. Crea un procedimiento que se llame encuentraLetrasIngredientes al que se le pase como parámetros una letra como primer parámetro, y el número de veces
que se quiere que aparezcan en el nombre de un ingrediente. El procedimiento mostrará por la salida de consola el nombre de aquellos ingredientes que tienen
exactamente ese número de veces (segundo parámetro) esa letra (primer parámetro). Si no hay ningún ingrediente que cumpla esta condición, se mostrará el 
mensaje 'No aparece la letra X un número de Y veces en los ingredientes', siendo X la letra recibida e Y el número de veces indicado. */

CREATE OR REPLACE PROCEDURE encuentraletrasingredientes (
    letra      VARCHAR,
    numveces   INT
) IS
    CURSOR datos IS
    SELECT
        lower(nombre) AS nombre
    FROM
        ingredientes
    WHERE
        lower(nombre) LIKE '%' || lower(letra) || '%'; --'%a%'
    contador   INT := 0;
    total      INT := 0;
BEGIN
    FOR fila IN datos LOOP
        FOR i IN 1..length(fila.nombre) LOOP IF substr(fila.nombre, i, 1) = letra THEN
            contador := contador + 1;
        END IF;
        END LOOP;

        IF contador = numveces THEN
            dbms_output.put_line(fila.nombre);
            total := total + 1;
        END IF;

        contador := 0;
    END LOOP;

    IF total = 0 THEN
        dbms_output.put_line('No aparece la letra ' || letra || ' un número de ' || numveces || ' veces en los ingredientes');
    END IF;
END;
/

BEGIN
    encuentraletrasingredientes('a', 4);
END;
/
/*
1.4. Se quiere un procedimiento llamado comandasTotal, que tendrá un parámetro de entrada diaSemana que será un día de la semana con todas sus letras en 
minúsculas (Ej.: lunes, martes, miercoles, etc.), un parámetro de salida que llame total, y que realice lo siguiente:
- A partir de la semana pasado por parámetro, obtener el número total de comandas realizadas en ese día de la semana (lunes, martes, etc.) y guardar ese
  valor en el parámetro de salida total.
- Mostrar un mensaje por la salida de consola con el número total de comandas de ese día de la semana cuya hora tiene un valor par de minutos (ej.: 2, 4, 16,
  44, etc. MINUTOS). NOTA: no calcules el valor total de minutos contando las horas, solo los minutos de ese valor. Ej.: 21:50 vale porque 50 es par.
- Indicar en un mensaje por la salida el número total de comandas en ese día de la semana hechas por 'Pedro Juan'. */

CREATE OR REPLACE PROCEDURE comandastotal (
    diasemana   VARCHAR,
    total       OUT INT
) IS

    CURSOR datos IS
    SELECT
        hora
    FROM
        comandas
    WHERE
        replace(to_char(fecha, 'day'), ' ') = diasemana;

    contador         INT := 0;
    totalpedrojuan   INT := 0;
BEGIN
    SELECT
        COUNT(*)
    INTO total
    FROM
        comandas
    WHERE
        replace(to_char(fecha, 'day'), ' ') = diasemana;

    FOR fila IN datos LOOP IF MOD(to_number(substr(fila.hora, 4, 2)), 2) = 0 THEN --par
        contador := contador + 1;
    END IF;
    END LOOP;

    dbms_output.put_line('Pares ' || contador);
    SELECT
        COUNT(*)
    INTO totalpedrojuan
    FROM
        comandas
    WHERE
        replace(to_char(fecha, 'day'), ' ') = diasemana
        AND id_cliente = (
            SELECT
                id
            FROM
                clientes
            WHERE
                nombre = 'Pedro Juan'
        );

    dbms_output.put_line('Pedro Juan ' || totalpedrojuan);
END;
/

DECLARE
    total INT;
BEGIN
    comandastotal('lunes', total);
    dbms_output.put_line('Total ' || total);
END;
/

--1.5. Debes introducir todas las funciones y procedimientos anteriores dentro de un paquete llamado miRestaurante.

CREATE OR REPLACE PACKAGE mirestaurante IS
    FUNCTION obteneringredientesplato (
        nombreplato            platos.nombre%TYPE,
        categoriaingrediente   ingredientes.categoria%TYPE
    ) RETURN INT;

    FUNCTION obtenerplatospesos (
        cantidad1   ingredientes_platos.cantidad%TYPE,
        cantidad2   ingredientes_platos.cantidad%TYPE
    ) RETURN INT;

    PROCEDURE encuentraletrasingredientes (
        letra      VARCHAR,
        numveces   INT
    );

    PROCEDURE comandastotal (
        diasemana   VARCHAR,
        total       OUT INT
    );

END;
/

CREATE OR REPLACE PACKAGE BODY mirestaurante IS

    FUNCTION obteneringredientesplato (
        nombreplato            platos.nombre%TYPE,
        categoriaingrediente   ingredientes.categoria%TYPE
    ) RETURN INT IS

        CURSOR datos IS
        SELECT
            i.nombre AS nombreingrediente,
            i.categoria
        FROM
            ingredientes i
            JOIN ingredientes_platos ON id_ingrediente = i.id
            JOIN platos ON platos.id = id_plato
        WHERE
            platos.nombre = nombreplato;

        contador          INT := 0;
        total             INT := 0;
        existeplato       platos.nombre%TYPE;
        existecategoria   ingredientes.categoria%TYPE;
    BEGIN
        SELECT
            nombre
        INTO existeplato
        FROM
            platos
        WHERE
            nombre = nombreplato;

        SELECT DISTINCT
            categoria
        INTO existecategoria
        FROM
            ingredientes
        WHERE
            categoria = categoriaingrediente;

        FOR fila IN datos LOOP
            IF fila.categoria = categoriaingrediente THEN
                contador := contador + 1;
            END IF;
            dbms_output.put_line(fila.nombreingrediente);
            total := total + 1;
        END LOOP;

        dbms_output.put_line('De todos esos ingredientes, hay '
                             || contador
                             || ' de la categoría '
                             || categoriaingrediente);
        RETURN total;
    EXCEPTION
        WHEN no_data_found THEN
            dbms_output.put_line('Error, ese plato o categoría no es válido');
            RETURN -1;
    END;

    FUNCTION obtenerplatospesos (
        cantidad1   ingredientes_platos.cantidad%TYPE,
        cantidad2   ingredientes_platos.cantidad%TYPE
    ) RETURN INT IS

        CURSOR datos IS
        SELECT
            nombre,
            SUM(cantidad) AS cantidadplato
        FROM
            ingredientes_platos
            JOIN platos ON id = id_plato
        GROUP BY
            nombre;

        contador INT := 0;
        nopesonegativo EXCEPTION;
    BEGIN
        IF cantidad1 < 0 OR cantidad2 < 0 THEN
            RAISE nopesonegativo;
        END IF;
        FOR fila IN datos LOOP IF cantidad1 > cantidad2 THEN
            IF fila.cantidadplato BETWEEN cantidad2 AND cantidad1 THEN
                dbms_output.put_line(fila.nombre);
                contador := contador + 1;
            END IF;

        ELSIF cantidad1 < cantidad2 THEN
            IF fila.cantidadplato BETWEEN cantidad1 AND cantidad2 THEN
                dbms_output.put_line(fila.nombre);
                contador := contador + 1;
            END IF;
        ELSE --son iguales
            IF fila.cantidadplato = cantidad1 THEN
                dbms_output.put_line(fila.nombre);
                contador := contador + 1;
            END IF;
        END IF;
        END LOOP;

        RETURN contador;
    EXCEPTION
        WHEN nopesonegativo THEN
            dbms_output.put_line('No puedes poner pesos negativos');
            RETURN -1;
    END;

    PROCEDURE encuentraletrasingredientes (
        letra      VARCHAR,
        numveces   INT
    ) IS

        CURSOR datos IS
        SELECT
            lower(nombre) AS nombre
        FROM
            ingredientes
        WHERE
            lower(nombre) LIKE '%'
                               || lower(letra)
                               || '%'; --'%a%'

        contador   INT := 0;
        total      INT := 0;
    BEGIN
        FOR fila IN datos LOOP
            FOR i IN 1..length(fila.nombre) LOOP IF substr(fila.nombre, i, 1) = letra THEN
                contador := contador + 1;
            END IF;
            END LOOP;

            IF contador = numveces THEN
                dbms_output.put_line(fila.nombre);
                total := total + 1;
            END IF;

            contador := 0;
        END LOOP;

        IF total = 0 THEN
            dbms_output.put_line('No aparece la letra ' || letra || ' un número de ' || numveces || ' veces en los ingredientes');
        END IF;

    END;

    PROCEDURE comandastotal (
        diasemana   VARCHAR,
        total       OUT INT
    ) IS

        CURSOR datos IS
        SELECT
            hora
        FROM
            comandas
        WHERE
            replace(to_char(fecha, 'day'), ' ') = diasemana;

        contador         INT := 0;
        totalpedrojuan   INT := 0;
    BEGIN
        SELECT
            COUNT(*)
        INTO total
        FROM
            comandas
        WHERE
            replace(to_char(fecha, 'day'), ' ') = diasemana;

        FOR fila IN datos LOOP IF MOD(to_number(substr(fila.hora, 4, 2)), 2) = 0 THEN --par
            contador := contador + 1;
        END IF;
        END LOOP;

        dbms_output.put_line('Pares ' || contador);
        SELECT
            COUNT(*)
        INTO totalpedrojuan
        FROM
            comandas
        WHERE
            replace(to_char(fecha, 'day'), ' ') = diasemana
            AND id_cliente = (
                SELECT
                    id
                FROM
                    clientes
                WHERE
                    nombre = 'Pedro Juan' );
        dbms_output.put_line('Pedro Juan ' || totalpedrojuan);
    END;

END;
/
/*1.6. Crea un programa que realice lo siguiente haciendo llamadas a funciones y procedimientos del paquete miRestaurante:
1. Llamada a la función obtenerIngredientesPlato para el "Plato Arroz caldoso" y la categoría de ingrediente "CONDIMENTO". Muestra el resultado.
2. Usando la función obtenerPlatosPesos, muestra el resultado pasando los parámetros siguiendo el orden indicado:
 2.1. 100 y 410.
 2.2. 1400 y 800.
3.Empleando encuentraLetrasIngredientes, averigua cuantos ingredientes tienen la letra v dos veces en su nombre.
4.Termina ejecutando el procedimiento comandasTotal para el día de la semana lunes y muestra después por la salida de consola el valor del parámetro de salida.*/

DECLARE
    total INT;
BEGIN
    dbms_output.put_line(mirestaurante.obteneringredientesplato('Plato Arroz caldoso', 'CONDIMENTO'));
    dbms_output.put_line(mirestaurante.obtenerplatospesos(100, 410));
    dbms_output.put_line(mirestaurante.obtenerplatospesos(1400, 800));
    dbms_output.put_line(mirestaurante.encuentraletrasingredientes('v', 2));
    dbms_output.put_line(mirestaurante.comandastotal('lunes', total));
    dbms_output.put_line(total);
END;
/
/*
Ejercicio 3
Se quiere crear un programa que pida una fecha por teclado y muestre por la salida un mensaje con el tiempo empleado TOTAL por el personal de la cocina para
preparar esos platos de ese día. Diremos que un plato se ha preparado y su estado fue COCINA en algún momento en las comandas. Recuerda sumar el tiempo total
de todos los platos y que se puede haber preparado varias veces el mismo plato ese día. Crea una excepción personalizada noCocina que se llame cuando no haya
ningún plato cocinado ese día, mostrando por pantalla el mensaje 'No se cocinó nada ese día'.NOTA: el campo tiempo_preparacion de la tabla platos son MINUTOS.*/

SELECT
    SUM(tiempo_preparacion)
FROM
    comandas
    JOIN platos ON platos.id = comandas.id_plato
WHERE
    estado = 'COCINA'
    AND fecha = '01/03/22';

DECLARE
    fechacomanda   comandas.fecha%TYPE := '&fecha';
    total          platos.tiempo_preparacion%TYPE;
    nococina EXCEPTION;
BEGIN
    SELECT
        SUM(tiempo_preparacion)
    INTO total
    FROM
        comandas
        JOIN platos ON platos.id = comandas.id_plato
    WHERE
        estado = 'COCINA'
        AND fecha = fechacomanda;

    IF total IS NULL THEN
        RAISE nococina;
    END IF;
    dbms_output.put_line('Tiempo total: ' || total);
EXCEPTION
    WHEN nococina THEN
        dbms_output.put_line('No se cocinó nada ese día');
END;
/