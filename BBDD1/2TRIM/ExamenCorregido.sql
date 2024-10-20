DROP TABLE PRODUCTOS CASCADE CONSTRAINTS;
DROP TABLE CLIENTES CASCADE CONSTRAINTS;
DROP TABLE PROVEEDORES CASCADE CONSTRAINTS;
DROP TABLE COMPRAS CASCADE CONSTRAINTS;

CREATE TABLE PRODUCTOS(
    REF INT PRIMARY KEY,
    NOMBRE VARCHAR(50),
    TIPO VARCHAR(50) CHECK (TIPO IN ('ANILLO','PULSERA','COLGANTE','PENDIENTE')),
    PRECIO NUMBER(6,2),
    PROVEEDOR INT
);
CREATE TABLE CLIENTES(
    ID INT PRIMARY KEY,
    NOMBRE VARCHAR(100),
    CP INT
);
CREATE TABLE PROVEEDORES(
    ID INT PRIMARY KEY,
    NOMBRE VARCHAR(100),
    TFNO INT
);
CREATE TABLE COMPRAS(
    REF INT PRIMARY KEY,
    CLIENTE INT,
    PRODUCTO INT,
    FECHA DATE,
    PAGO VARCHAR(50) CHECK (PAGO IN ('METALICO','TARJETA'))
);
ALTER TABLE PRODUCTOS
ADD FOREIGN KEY (PROVEEDOR) REFERENCES PROVEEDORES(ID);
ALTER TABLE COMPRAS
ADD FOREIGN KEY (CLIENTE) REFERENCES CLIENTES(ID);
ALTER TABLE COMPRAS
ADD FOREIGN KEY (PRODUCTO) REFERENCES PRODUCTOS(REF);

INSERT INTO PROVEEDORES VALUES (1,'METALES S.L.',123456789);
INSERT INTO PROVEEDORES VALUES (2,'TODO PLATA',111111222);
INSERT INTO PROVEEDORES VALUES (3,'AROS',NULL);
INSERT INTO PRODUCTOS VALUES (1,'MOON','ANILLO',50,1);
INSERT INTO PRODUCTOS VALUES (2,'MARTE','PULSERA',75,1);
INSERT INTO PRODUCTOS VALUES (3,'MOON','COLGANTE',45.49,3);
INSERT INTO PRODUCTOS VALUES (4,'JUPITER','PENDIENTE',179.99,2);
INSERT INTO PRODUCTOS VALUES (5,'ESTRELLAS','PENDIENTE',15.50,1);
INSERT INTO PRODUCTOS VALUES (6,'COMETA','PENDIENTE',79.99,2);
INSERT INTO PRODUCTOS VALUES (7,'FUGAZ','ANILLO',399.99,2);
INSERT INTO CLIENTES VALUES (1,'PEDRO ALVAREZ',41110);
INSERT INTO CLIENTES VALUES (2,'GRACIA GOMEZ',41930);
INSERT INTO CLIENTES VALUES (3,'LUISA GUTIERREZ',41930);
INSERT INTO CLIENTES VALUES (4,'ANTONIO ALVAREZ',41927);
INSERT INTO CLIENTES VALUES (5,'ANA GARCIA',41930);
INSERT INTO CLIENTES VALUES (6,'MARIO GARCIA',41010);
INSERT INTO COMPRAS VALUES (1,1,1,'02/09/2022','METALICO');
INSERT INTO COMPRAS VALUES (2,2,4,'11/11/2022','METALICO');
INSERT INTO COMPRAS VALUES (3,3,4,'01/01/2023','TARJETA');
INSERT INTO COMPRAS VALUES (4,5,5,'22/06/2023','METALICO');
INSERT INTO COMPRAS VALUES (5,1,2,'02/09/2023','METALICO');
INSERT INTO COMPRAS VALUES (6,1,3,'12/10/2023','TARJETA');
INSERT INTO COMPRAS VALUES (7,5,6,'15/10/2023','TARJETA');
INSERT INTO COMPRAS VALUES (8,4,7,'07/11/2023','METALICO');
INSERT INTO COMPRAS VALUES (9,6,2,'28/12/2023','METALICO');
INSERT INTO COMPRAS VALUES (10,2,3,'02/02/2024','TARJETA');

select nombre from productos;
select count(*) from productos where tipo = 'PENDIENTE';
select nombre,precio from productos where precio between 100 and 500;
select distinct tipo from productos order by tipo desc;
select avg(precio) from productos where nombre like 'M%';
--original select avg(precio) from productos where substr(nombre,1,1) = 'M';
select cp from clientes where nombre like '%ALVAREZ';
select initcap(substr(nombre,1,instr(nombre,' '))) from clientes;
select count(*) from clientes where cp = 41930;
select nombre,tfno from proveedores where tfno is not null;
select count(*) from proveedores where tfno is null;
select sum(precio) from compras join productos on compras.producto = productos.ref; --ESTRUCTURA JOIN siempre JOIN NOMBRETABLA ON CONDICION
select * from productos;
select precio from compras;

select sum(precio) from compras join productos on productos.ref = compras.producto;

select distinct productos.nombre from compras join productos on productos.ref = compras.producto
    join clientes on clientes.id = compras.cliente where clientes.nombre = 'PEDRO ALVAREZ';
    
select productos.nombre, productos.precio 
    from compras 
    join productos on productos.ref = compras.producto 
    join clientes on clientes.id = compras.cliente
    where clientes.nombre = 'GRACIA GOMEZ' and precio = (
        select max(productos.precio) 
            from compras 
            join productos on productos.ref = compras.producto 
            join clientes on clientes.id = compras.cliente
            where clientes.nombre = 'GRACIA GOMEZ'
    );
select proveedores.nombre from compras 
    join productos on productos.ref = compras.producto
    join proveedores on proveedores.id = productos.proveedor
    join clientes on clientes.id = compras.cliente
    where clientes.nombre = 'ANTONIO ALVAREZ';
select count(*) from compras
    join clientes on clientes.id = compras.cliente
    where clientes.nombre = 'ANA GARCIA';
select * from productos;
select nombre from productos where precio = (select max(precio) from productos where tipo = 'ANILLO');
select nombre from productos where precio = (select min(precio) from productos where tipo = 'PENDIENTE');
select nombre,cp from clientes where cp = 41930
union
select nombre,cp from clientes where cp = 41927;
select * from proveedores where nombre like '%O%';
select round(precio,1) from productos where nombre = 'JUPITER';
select count(*) from compras where to_char(fecha,'YYYY') = 2022;
select to_char(fecha,'YYYY'),count(*) from compras group by to_char(fecha,'YYYY');
select 'El día ' || to_char(fecha,'DD/MM/YYYY')||', ' || initcap(substr(clientes.nombre,1,instr(clientes.nombre,' '))) || 'compró ' || productos.nombre || ' en ' || lower(compras.pago) from compras
    join productos on productos.ref = compras.producto
    join clientes on clientes.id = compras.cliente
    where clientes.nombre = 'MARIO GARCIA';
select distinct productos.nombre from compras join productos on productos.ref = compras.producto;
select to_char(fecha,'DAY') from compras where fecha = (select min(fecha) from compras);