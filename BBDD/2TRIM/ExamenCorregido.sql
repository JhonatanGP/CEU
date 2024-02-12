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