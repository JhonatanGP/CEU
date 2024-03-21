--Ejercicio1 GBBDD
create table categorias(
    codigo char(2) primary key,
    descripcion varchar2(200)
);
create table productos(
    id char(2) primary key,
    nombre varchar2(50),
    precio int
);

--Ejercicio2 GBBDD
create table cuentas_bancarias (
    numero char(16) primary key,
    saldo int
);
create table transacciones(
    codigo char(2) primary key,
    tipo varchar2(10),
    cantidad int,
    numero char(16)
);

alter table transacciones add foreign key (numero) references cuentas_bancarias(numero);

--Ejercicio3 GBBDD
create table aulas (
    numero char(2),
    planta char(2),
    primary key (numero,planta),
    situacion varchar2(200)
);

create table estudiantes (
    numero_matricula char(5) primary key,
    nombre varchar2(50),
    direccion varchar2(50)
);
create table asignaturas(
    denominacion varchar2(30),
    ciclo varchar2(30),
    primary key(denominacion,ciclo)
);
create table estudios (
    numero char(2),
    planta char(2),
    numero_matricula char(5),
    denominacion varchar2(30),
    ciclo varchar2(30),
    hora int
);

alter table estudios add foreign key (numero,planta) references aulas(numero,planta);
alter table estudios add foreign key (numero_matricula) references estudiantes(numero_matricula);
alter table estudios add foreign key (denominacion,ciclo) references asignaturas(denominacion,ciclo);

-- Ejercicio 4 GBBDD

create table aulas (
    numero char(2),
    planta char(2),
    situacion varchar2(200)
);

create table estudiantes (
    numero_matricula char(5),
    nombre varchar2(50),
    direccion varchar2(50)
);
create table estudios (
    numero char(2),
    planta char(2),
    numero_matricula char(5),
    denominacion varchar2(30),
    ciclo varchar2(30),
    hora char(2),
    id char(2) primary key
);
create table asignaturas(
    denominacion varchar2(30),
    ciclo varchar2(30)
);
alter table aulas add primary key (numero,planta);
alter table asignaturas add primary key (denominacion, ciclo);
alter table estudios add foreign key (numero_matricula) references estudiantes(numero_matricula);
alter table estudios add foreign key (denominacion,ciclo) references asignaturas(denominacion,ciclo);
alter table estudios add foreign key (numero,planta) references aulas(numero,planta);

--Ejercicio 5 GBBDD

Create table representantes (
    id_licencia char(2) primary key,
    nombre varchar2(30)
);
create table actores (
    id_carne char(2) primary key,
    nombre_a varchar2(30),
    nombre_b varchar2(30),
    id_licencia_representante char(2),
    contrato varchar2(200)
    
);

alter table actores add foreign key (id_licencia_representante) references representantes(id_licencia);

--Ejercicio 6 GBBDD
create table supervisan(
    dni_supervisor char(9)
);
create table empleados(
    DNI char(9) primary key,
    nombre varchar2(30),
    DNISupervisor char(9)
);


alter table empleados add foreign key (DNISupervisor) references supervisan(dni_supervisor);

--Ejercicio 7 GBBDD

Create table piezas (
    codigo char(2) primary key,
    descripcion varchar2(200)
);
Create table compuestos (
    codigo char(2),
    codigo_c char(2) primary key
);

alter table compuesto add foreign key (codigo) references piezas(codigo);

--Ejercicio 8 GBBDD
create table actores(
    identificador char(2)primary key,
    nombre varchar2(30),
    identificadorPersonaje char(2)
);
create table personajes (
    identificador char(2) primary key,
    nombre varchar2(30),
    pelicula varchar2(100),
    identificadorActor char(2)
);

alter table actores add foreign key (identificadorPersonaje) references personajes(identificador);
alter table personajes add foreign key (identificadorActor) references actores(identificador);

--Ejercicio 9

create table directivos(
    DNI char(9),
    nombre varchar2(30),
    puesto varchar2(50),
    departamento varchar2(50)
);
create table comerciales (
    DNI char(9),
    nombre varchar2(30),
    puesto varchar2(50),
    comision int
);
create table tecnicos(
    DNI char(9),
    nombre varchar2(30),
    puesto varchar2(50),
    equipo char(2)
);

--Ejercicio 10 GBBDD

create table alumnos(
    dni char(9) primary key,
    nombre varchar2(30),
    direccion varchar2(30),
    telefono char(9),
    edad int,
    cif char(9)
);
create table empresas (
    cif char(9) primary key,
    nombre varchar2(30),
    descripcion varchar2(200),
    telefono char(9)
);
create table cursos (
    codigo char(2) primary key,
    fecha_inicio date,
    fecha_fin date,
    identificador char(2),
    dni_profesor char(9)
);
create table tipos_de_cursos(
    identificador char(2) primary key,
    programa varchar2(200),
    horas_duracion int,
    titulo varchar2(50)
);
create table profesores (
    dni char(9) primary key,
    nombre varchar2(30),
    apellidos varchar2(30),
    direccion varchar2(30),
    telefono char(9)
);
create table asistencias(
    dni char(9) primary key,
    codigo char(2),
    nota number(2)
);

alter table asistencias add foreign key (codigo) references cursos(codigo);
alter table alumnos add foreign key (cif) references empresas(cif);
alter table cursos add foreign key (identificador) references tipos_de_cursos(identificador);
alter table cursos add foreign key (dni_profesor) references profesores(dni);

--Ejercicio 11 GBBDD

create table socios(
    codigo_de_socio char(2),
    dni char(9) primary key,
    nombre varchar2(30),
    apellidos varchar2(30),
    direccion varchar2(30),
    telefonos char(9)
);
create table libros(
    isbn char(13) primary key,
    titulo varchar2(30),
    editorial varchar2(30),
    año_publicacion date,
    autores varchar2(200),
    año_edicion date,
    deteriorado varchar2(30)
);
create table prestamos(
    codigo_de_socio char(2) primary key,
    dni char(9),
    isbn char(13),
    fecha_prestamo date,
    fecha_devolucion date,
    fecha_real_devolucion date
);

alter table socios add foreign key (codigo_de_socio) references prestamos(codigo_de_socio);
alter table prestamos add foreign key (dni) references socios(dni);
alter table prestamos add foreign key (isbn) references libros(isbn);

--Ejercicio 12 GBBDD
drop table localidades cascade constraints;
create table localidades(
    nombre varchar2(30) primary key,
    nombreCCAA varchar(30),
    poblacion int,
    esCapitalProvincia varchar2(30),
    esCapiralCCAA varchar2(30),
    dosDigitosCCPP char(2)
);
create table provincias(
  dosDigitosCCPP char(2) primary key,
  nombre varchar2(30),
  poblacion int,
  nombreCCAA varchar(30)
);
create table CCAAS(
    nombre varchar2(30) primary key,
    poblacion int,
    superficie float
);

alter table localidades add foreign key (dosDigitosCCPP) references provincias(dosDigitosCCPP);
alter table localidades add foreign key (nombreCCAA) references CCAAS(nombre);
alter table provincias add foreign key (nombreCCAA) references localidades(nombre);

--Ejercicio 13 GBBDD

create table actores(
    id char(2) primary key,
    nombre_completo varchar2(30),
    fecha_nacimiento date,
    nacionalidad varchar2(30),
    id_personaje char(2)
);
create table personajes(
    id char(2) primary key,
    nombre varchar2(30),
    raza varchar2(30),
    graduacion_militar varchar2(30),
    id_actor char(2),
    id_personaje_superior char(2)
);
create table peliculas(
    id char(2) primary key,
    año_lanzamiento int,
    titulo varchar2(30),
    director varchar2(30),
    id_personaje_protagonista char(2)
);
create table capitulos(
    temporada int,
    orden varchar2(30),
    titulo varchar2(30),
    fecha_1ª_emision date
);

alter table capitulos add primary key (temporada,orden);

create table planetas(
    codigo char(2) primary key,
    nombre varchar2(30),
    n_tripulantes int
);
create table naves(
    codigo char(2) primary key,
    nombre varchar2(30),
    n_tripulantes int
);
create table personajes_peliculas(
    id_personaje char(2),
    id_pelicula char(2)
);
create table personajes_capitulos(
    id_personaje char(2),
    temporada int,
    orden varchar2(30)
);
create table visitas(
    codigo_planeta char(2),
    codigo_nave char(2),
    temporada int,
    orden varchar2(30)
);

alter table actores add foreign key (id_personaje) references personajes(id);
alter table personajes add foreign key (id_actor) references actores(id);
alter table peliculas add foreign key (id_personaje_protagonista) references personajes(id);
alter table personajes_peliculas add foreign key (id_personaje) references personajes(id);
alter table personajes_peliculas add foreign key (id_pelicula) references peliculas(id);
alter table personajes_capitulos add foreign key (id_personaje) references personajes(id);
alter table personajes_capitulos add foreign key (temporada,orden) references capitulos(temporada,orden);
alter table visitas add foreign key (codigo_planeta) references planetas(codigo);
alter table visitas add foreign key (codigo_nave) references naves(codigo);
alter table visitas add foreign key (temporada,orden) references capitulos(temporada,orden);

--Ejercicio 14 GBBDD

create table personajes(
    codigo char(2) primary key,
    nombre varchar2(30),
    graduacion varchar2(30),
    raza varchar2(30),
    fecha_nacimiento date,
    ciudad varchar2(30),
    nombre_mentos varchar2(30),
    fecha_graduacion date,
    planeta_natal varchar2(30),
    fecha_ult_combate date
);

--Ejercicio 15 GBBDD

create table accidentes_geograficos(
    posicion_horizontal int,
    posicion_vertical int,
    nombre varchar2(30),
    tipo varchar2(30),
    longitud int,
    altura int,
    extension int
);
create table paises(
    id char(2) primary key,
    nombre varchar2(30),
    extension int,
    poblacion int
);
create table localidades(
    nombre varchar2(30) primary key,
    id char(2)
);
create table localizaciones(
    posicion_horizontal int,
    posicion_vertical int,
    nombre_localidad varchar2(30),
    id_pais char(2)
);
create table pasos_rios(
    posicion_horizontal int,
    posicion_vertical int,
    nombre_localidad varchar2(30),
    id_pais char(2)
);

alter table accidentes_geograficos add primary key (posicion_horizontal,posicion_vertical);
alter table localidades add primary key (nombre);
alter table localizaciones add foreign key (posicion_horizontal,posicion_vertical) references accidentes_geograficos(posicion_horizontal,posicion_vertical);
alter table localizaciones add foreign key (id_pais) references paises(id);
alter table pasos_rios add foreign key (posicion_horizontal,posicion_vertical) references accidentes_geograficos(posicion_horizontal,posicion_vertical);
alter table pasos_rios add foreign key (nombre_localidad) references localidades(nombre);
alter table pasos_rios add foreign key (id_pais) references paises(id);

--Ejercicio 16 GBBDD

create table empleados(
    dni char(9) primary key,
    nombre varchar2(30),
    experiencia int
);
create table clientes(
    dni char(9) primary key,
    nombre varchar2(30),
    profesion varchar2(30),
    telefono char(9),
    direccion varchar2(30)
);
create table tratamientos(
    id char(2) primary key,
    nombre varchar2(30),
    tipo varchar2(30)
);
create table servicios(
    dni_empleado char(9),
    dni_cliente char(9),
    id_tratamiento char(2),
    fecha date
);

alter table servicios add foreign key (dni_empleado) references empleados(dni);
alter table servicios add foreign key (dni_cliente) references clientes(dni);
alter table servicios add foreign key (id_tratamiento) references tratamientos(id);

--Ejercicio 17 GBBDD

create table trabajadores(
    dni char(9) primary key,
    nombre varchar2(30),
    apellido varchar2(30),
    telefono char(9),
    experiencia int,
    fecha_incorporacion date,
    puesto varchar2(30),
    dni_jefe char(9)
);
create table platos(
    id char(2) primary key,
    nombre varchar2(30), 
    tipo varchar2(30)
);
create table ingredientes(
    id char(2) primary key,
    nombre varchar2(30)
);
create table elaboraciones(
    dni char(9),
    id_plato char(2)
);
create table recetas(
    id_plato char(2),
    id_ingrediente char(2)
);
create table ser_jefe(
    dni_jefe char(9) primary key
);

alter table elaboraciones add foreign key (dni) references trabajadores(dni);
alter table elaboraciones add foreign key (id_plato) references platos(id);
alter table recetas add foreign key (id_plato) references platos(id);
alter table recetas add foreign key (id_ingrediente) references ingredientes(id);