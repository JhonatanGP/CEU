CREATE TABLE BARCOS(
    MATRICULA CHAR(7) PRIMARY KEY,
    NOMBRE VARCHAR(50),
    CLASE VARCHAR(50),
    ARMADOR VARCHAR(50),
    CAPACIDAD NUMBER(8,2),
    NACIONALIDAD VARCHAR(50)
);
CREATE TABLE LOTES(
    CODIGO INT PRIMARY KEY,
    MATRICULA CHAR(7),
    NUM_KG NUMBER(8,2) ,
    PRECIO_KG_SALIDA NUMBER(8,2),
    PRECIO_KG_VENDIDO NUMBER(8,2),
    FECHA_VENTA DATE,
    COD_ESPECIE INT
);
CREATE TABLE ESPECIES(
    CODIGO INT PRIMARY KEY,
    NOMBRE VARCHAR(50),
    TIPO VARCHAR(50),
    CUPO_BARCO NUMBER(8,2),
    CALADERO_PPAL INT
);
CREATE TABLE CALADEROS(
    CODIGO INT PRIMARY KEY,
    NOMBRE VARCHAR(50),
    UBICACION VARCHAR(100),
    ESPECIE_PPAL INT
);
CREATE TABLE FECHAS_CAPTURAS(
    COD_ESPECIE INT,
    COD_CALADERO INT,
    FECHA_INICIO DATE,
    FECHA_FIN DATE,
    PRIMARY KEY(COD_ESPECIE, COD_CALADERO)
);
ALTER TABLE BARCOS CHECK (REGEXP_LIKE(MATRICULA, '[A-Z][A-Z]-[0-9][0-9][0-9][0-9]'));
ALTER TABLE LOTES ADD FOREIGN KEY (MATRICULA) REFERENCES BARCOS(MATRICULA) ON DELETE CASCADE;
ALTER TABLE LOTES ADD FOREIGN KEY (COD_ESPECIE) REFERENCES ESPECIES(CODIGO) ON DELETE CASCADE;
ALTER TABLE LOTES ADD CHECK (PRECIO_KG_VENDIDO>PRECIO_KG_SALIDA);
ALTER TABLE LOTES ADD CHECK (NUM_KG>0);
ALTER TABLE LOTES ADD CHECK (PRECIO_KG_SALIDA>0);
ALTER TABLE LOTES ADD  CHECK (PRECIO_KG_VENDIDO>0);

ALTER TABLE ESPECIES ADD FOREIGN KEY (CALADERO_PPAL) REFERENCES CALADEROS(CODIGO);
ALTER TABLE CALADEROS ADD FOREIGN KEY (ESPECIE_PPAL) REFERENCES ESPECIES(CODIGO) ON DELETE SET NULL;
ALTER TABLE CALADEROS ADD CHECK (NOMBRE LIKE UPPER(NOMBRE));
ALTER TABLE CALADEROS ADD CHECK (UBICACION LIKE UPPER(UBICACION));

ALTER TABLE FECHAS_CAPTURAS ADD FOREIGN KEY (COD_ESPECIE) REFERENCES ESPECIES(CODIGO);
ALTER TABLE FECHAS_CAPTURAS ADD FOREIGN KEY (COD_CALADERO) REFERENCES CALADEROS(CODIGO);
ALTER TABLE FECHAS_CAPTURAS ADD CHECK (FECHA_INICIO NOT BETWEEN DATE '2020-02-02' AND DATE '2020-03-28');
ALTER TABLE FECHAS_CAPTURAS ADD CHECK (FECHA_FIN NOT BETWEEN DATE '2020-02-02' AND DATE '2020-03-28');

ALTER TABLE CALADEROS ADD CIENTIFICO VARCHAR(100);
INSERT INTO BARCOS VALUES ('AA-1212', 'MARIA', 'PALANGRERO', 'ANTONIO', 2500,'ESPA�OLA');
INSERT INTO BARCOS VALUES ('AB-2323', 'ISABEL', 'BAJURA', 'ANTONIO', 2500, 'AFRICANA');
INSERT INTO ESPECIES VALUES (1, 'SARDINA', 'EUROPEA', 600, NULL);
INSERT INTO ESPECIES VALUES (2, 'ANCHOA', 'AFRICANA', 900, NULL);
INSERT INTO CALADEROS VALUES (1, 'PUNTILLA', '8KM COSTA MAR', 1, NULL);
INSERT INTO CALADEROS VALUES (2, 'FARO', '6KM COSTA MAR', 2, NULL);
INSERT INTO LOTES VALUES (1, 'AA-1234', 200, 8.5, 12.75, DATE '2020-12-15', 1);
INSERT INTO LOTES VALUES (2, 'AB-1111', 500, 4.5, 15.5, DATE '2020-12-15', 2);
INSERT INTO FECHAS_CAPTURAS VALUES (1, 1, DATE '2020-05-01', DATE '2020-05-31');
INSERT INTO FECHAS_CAPTURAS VALUES (2, 2, DATE '2020-07-01', DATE '2020-07-15');

ALTER TABLE BARCOS DROP COLUMN ARMADOR;
DROP TABLE BARCOS CASCADE CONSTRAINTS;
DROP TABLE LOTES CASCADE CONSTRAINTS;
DROP TABLE ESPECIES CASCADE CONSTRAINTS;
DROP TABLE CALADEROS CASCADE CONSTRAINTS;
DROP TABLE FECHAS_CAPTURAS CASCADE CONSTRAINTS;
