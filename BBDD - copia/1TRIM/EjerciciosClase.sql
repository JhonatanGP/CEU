--Ejercicio1
drop table categorias cascade constraints;
create table categorias(
    cod_categorias varchar2(50),
    descripcion varchar2(50)
);
alter table categorias add primary key (cod_categorias);

drop table productos cascade constraints;
create table productos(
    id_productos int,
    nombre varchar2(50),
    precio number(5,5)
);
alter table productos add primary key (id_productos);

--Ejercicio2
drop table productos cascade constraints;
create table cuentas_bancarias(
    numero int primary key,
    saldo number(5,5)
);
drop table transacciones cascade constraints;
create table transacciones(
    cod_transacciones int primary key,
    tipo varchar2(50),
    cantidad number(5,5),
    numero number(5,5)
);
--Ejercicio3
drop table aulas cascade constraints;
create table aulas(
    numero int,           --PK
    planta varchar2(50),  --PK
    situacion number(5,5)
);
alter table aulas add primary key (numero, planta);

drop table estudiantes cascade constraints;
create table estudiantes(
    num_matricula int primary key , --PK
    Nombre varchar2(50),  
    direccion varchar2(50)
);
drop table asignaturas cascade constraints;
create table asignaturas(
    denominacion varchar2(50),      --PK
    ciclo int                       --PK
);
alter table asignaturas add primary key (denominacion, ciclo);

drop table estudios cascade constraints;
create table estudios(
    numero int,                     --PK
    planta varchar2(50),            --PK
    num_matricula int,              --PK
    denominacion varchar2(50),      --PK
    ciclo int,                      --PK
    hora int
);
alter table estudios add foreign key (numero,planta) references aulas(numero,planta);
alter table estudios add foreign key (num_matricula) references estudiantes(num_matricula);
alter table estudios add foreign key (denominacion, ciclo) references asignaturas(denominacion, ciclo);

--Ejercicio4
drop table aulas1 cascade constraints;
create table aulas1(
    numero int,           --PK
    planta varchar2(50),  --PK
    situacion number(5,5)
);
alter table aulas1 add primary key (numero, planta);

drop table estudiantes1 cascade constraints;
create table estudiantes1(
    num_matricula int primary key , --PK
    Nombre varchar2(50),  
    direccion varchar2(50)
);
drop table asignaturas1 cascade constraints;
create table asignaturas1(
    denominacion varchar2(50),      --PK
    ciclo int                       --PK
);
alter table asignaturas1 add primary key (denominacion, ciclo);

drop table estudios1 cascade constraints;
create table estudios1(
    id_estudios int primary key,                --PK
    numero int,                     --FK
    planta varchar2(50),            --FK
    num_matricula int,              --FK
    denominacion varchar2(50),      --FK
    ciclo int,                      --FK
    hora int
);
alter table estudios1 add foreign key (numero,planta) references aulas1(numero,planta);
alter table estudios1 add foreign key (num_matricula) references estudiantes1(num_matricula);
alter table estudios1 add foreign key (denominacion, ciclo) references asignaturas1(denominacion, ciclo);

--Ejercicio5
drop table representantes cascade constraints;
create table representantes(
    id_licencia int primary key , --PK
    Nombre varchar2(50)  
);
drop table actores cascade constraints;
create table actores(
    id_carne int primary key , --PK
    nombreA varchar2(50),
    nombreB varchar2(50),
    id_licencia_repre int,     --FK
    contrato varchar2(50)
);
alter table actores add foreign key (id_licencia_repre) references representantes(id_licencia);

--Ejercicio6
drop table empleados cascade constraints;
create table empleados(
    dni int primary key , --PK
    nombre varchar2(50),
    dni_superv  int       --FK
);
drop table ser_jefe cascade constraints;
create table ser_jefe(
    dni_superv int primary key
);
alter table empleados add foreign key (dni_superv) references ser_jefe(dni_superv);

--Ejercicio 7 
drop table piezas cascade constraints;
create table piezas(
    codigo int primary key,  --PK
    descripcion varchar2(50)
);
drop table compuestos cascade constraints;
create table compuestos(
    codigo_c int, --PK
    codigo int    --PK FK
);
alter table compuestos add primary key (codigo_c, codigo);
alter table compuestos add foreign key (codigo) references piezas(codigo);

--Ejercicio 8 
drop table actores cascade constraints;
create table actores(
    identificador char(2)primary key,
    nombre varchar2(30),
    identificadorPersonaje char(2)
);
drop table personajes cascade constraints;
create table personajes (
    identificador char(2) primary key,
    nombre varchar2(30),
    pelicula varchar2(100),
    identificadorActor char(2)
);
alter table actores add foreign key (identificadorPersonaje) references personajes(identificador);
alter table personajes add foreign key (identificadorActor) references actores(identificador);

--Ejercicio 9
drop table directivos cascade constraints;
create table directivos(
    DNI char(9) primary key,
    nombre varchar2(30),
    puesto varchar2(50),
    departamento varchar2(50)
);
drop table comerciales cascade constraints;
create table comerciales (
    DNI char(9) primary key,
    nombre varchar2(30),
    puesto varchar2(50),
    comision int
);
drop table tecnicos cascade constraints;
create table tecnicos(
    DNI char(9)primary key,
    nombre varchar2(30),
    puesto varchar2(50),
    equipo char(2)
);
--Ejercicio 10 
drop table alumnos cascade constraints;
create table alumnos(
    dni char(9) primary key,
    nombre varchar2(30),
    direccion varchar2(30),
    telefono char(9),
    edad int,
    cif char(9)
);
drop table empresas cascade constraints;
create table empresas (
    cif char(9) primary key,
    nombre varchar2(30),
    descripcion varchar2(200),
    telefono char(9)
);
drop table cursos cascade constraints;
create table cursos (
    codigo char(2) primary key,
    fecha_inicio date,
    fecha_fin date,
    identificador char(2),
    dni_profesor char(9)
);
drop table tipos_cursos cascade constraints;
create table tipos_cursos(
    identificador char(2) primary key,
    programa varchar2(200),
    horas_duracion int,
    titulo varchar2(50)
);
drop table profesores cascade constraints;
create table profesores (
    dni char(9) primary key,
    nombre varchar2(30),
    apellidos varchar2(30),
    direccion varchar2(30),
    telefono char(9)
);
drop table asistencias cascade constraints;
create table asistencias(
    dni char(9) primary key,
    codigo char(2),
    nota number(2)
);
alter table asistencias add foreign key (codigo) references cursos(codigo);
alter table alumnos add foreign key (cif) references empresas(cif);
alter table cursos add foreign key (identificador) references tipos_cursos(identificador);
alter table cursos add foreign key (dni_profesor) references profesores(dni);

--Ejercicio 11 
drop table socios cascade constraints;
create table socios(
    codigo_de_socio char(2),
    dni char(9) primary key,
    nombre varchar2(30),
    apellidos varchar2(30),
    direccion varchar2(30),
    telefonos char(9)
);
drop table libros cascade constraints;
create table libros(
    isbn char(13) primary key,
    titulo varchar2(30),
    editorial varchar2(30),
    ano_publicacion date,
    autores varchar2(200),
    ano_edicion date,
    deteriorado varchar2(30)
);
drop table prestamos cascade constraints;
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

--Ejercicio 12 
drop table localidades cascade constraints;
create table localidades(
    nombre varchar2(30) primary key,
    nombreCCAA varchar(30),
    poblacion int,
    esCapitalProvincia varchar2(30),
    esCapiralCCAA varchar2(30),
    dosDigitosCCPP char(2)
);
drop table provincias cascade constraints;
create table provincias(
  dosDigitosCCPP char(2) primary key,
  nombre varchar2(30),
  poblacion int,
  nombreCCAA varchar(30)
);
drop table CCAAS cascade constraints;
create table CCAAS(
    nombre varchar2(30) primary key,
    poblacion int,
    superficie float
);
alter table localidades add foreign key (dosDigitosCCPP) references provincias(dosDigitosCCPP);
alter table localidades add foreign key (nombreCCAA) references CCAAS(nombre);
alter table provincias add foreign key (nombreCCAA) references localidades(nombre);

--Ejercicio 13
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
    ano_lanzamiento int,
    titulo varchar2(30),
    director varchar2(30),
    id_personaje_protagonista char(2)
);
create table capitulos(
    temporada int,
    orden varchar2(30),
    titulo varchar2(30),
    fecha_1_emision date
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

--Ejercicio 14 
drop table personajes cascade constraints;
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

--Ejercicio 15
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

--Ejercicio 16
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

--Ejercicio 17 
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
