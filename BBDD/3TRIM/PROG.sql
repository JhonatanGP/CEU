CREATE TABLE personas (
 DNI varchar2(50) NOT NULL,
 NOMBRE varchar2(50) NOT NULL,
 APELLIDOS varchar2(100) NOT NULL,
 FECHA_NACIMIENTO DATE DEFAULT NULL,
 PRIMARY KEY (DNI)
); 
INSERT INTO personas values('54999853E', 'Jhonatan', 'Guzmán Panozo','10-04-2024');
INSERT INTO personas values('54999853A', 'Jhonatan', 'Guzmán Panozo','10-04-2024');
INSERT INTO personas values('12345678A', 'Antonio', 'Rojas','10-04-2024');
