/*Database*/
CREATE DATABASE rbook;
CREATE USER rbookadmin IDENTIFIED BY 'rbook2019';
GRANT ALL PRIVILEGES ON 'rbook'.* TO rbookadmin; 

/*Tables*/
CREATE TABLE categoria(
    categoria_id            VARCHAR(10) PRIMARY KEY,
    categoria_descripcion   VARCHAR(100) NOT NULL
);

CREATE TABLE titulo(
    titulo_id               VARCHAR(10) PRIMARY KEY,
    titulo_descripcion      VARCHAR(200) NOT NULL,
    titulo_resumen          VARCHAR(200) NOT NULL,
    categoria_id            VARCHAR(10) NOT NULL, /*FK*/
    CONSTRAINT fk_title_category
      FOREIGN KEY (categoria_id)
      REFERENCES categoria(categoria_id)
          ON DELETE CASCADE
          ON UPDATE CASCADE
);

CREATE TABLE autor(
    autor_id                VARCHAR(10) PRIMARY KEY,
    autor_nombres           VARCHAR(10) NOT NULL,
    autor_apellidos         VARCHAR(10) NOT NULL,
    autor_alias             VARCHAR(10) NULL,
    autor_nacionalidad      VARCHAR(10) NULL
);

CREATE TABLE autor_titulo(
    titulo_id               VARCHAR(10) NOT NULL, /*FK*/
    autor_id                VARCHAR(10) NOT NULL, /*FK*/
    CONSTRAINT fk_titleauthor_title
      FOREIGN KEY (titulo_id)
      REFERENCES titulo(titulo_id) 
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT tk_titleauthor_author 
      FOREIGN KEY (autor_id) REFERENCES autor(autor_id)
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);

CREATE TABLE editorial(
    editorial_id            INTEGER NOT NULL AUTO_INCREMENT, 
    editorial_description   VARCHAR(100) NOT NULL
);


CREATE TABLE almacenamiento(
    almacenamiento_id       INTEGER NOT NULL AUTO_INCREMENT,
    almacenamiento_sector   VARCHAR(10) NOT NULL,
    almacenamito_estante    VARCHAR(10) NOT NULL,
    almacenamiento_columna  VARCHAR(10) NOT NULL,
    almacenamiento_fila     VARCHAR(10) NOT NULL
);


CREATE TABLE ejemplar(
    ejemplar_id             VARCHAR(10) PRIMARY KEY,
    ejemplar_fecha_pub      DATETIME NULL,
    editorial_id            INTEGER NOT NULL, /*FK*/
    almacenamiento_id       INTEGER NOT NULL, /*FK*/
    CONSTRAINT fk_exemplary_editorial
    FOREIGN KEY (editorial_id)
    REFERENCES editorial(editorial_id)
      ON DELETE CASCADE
      ON UPDATE CASCADE ,
    CONSTRAINT fk_exemplary_storage
      FOREIGN KEY (editorial_id)
        REFERENCES almacenamiento(almacenamiento_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE ejemplares(
    titulo_id               VARCHAR(10) NOT NULL, /*FK*/
    ejemplar_id             VARCHAR(10) NOT NULL, /*FK*/
    CONSTRAINT fk_exemplaries_title
      FOREIGN KEY (titulo_id)
        REFERENCES titulo(titulo_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_exemplaries_exemplary
      FOREIGN KEY (ejemplar_id)
        REFERENCES ejemplar(ejemplar_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE estudiante(
    estudiante_cedula         VARCHAR(10) PRIMARY KEY,
    estudiante_nombres         VARCHAR(10) NOT NULL,
    estudiante_apellidos       VARCHAR(10) NOT NULL
);

CREATE TABLE prestamo(
    prestamo_id             BIGINT PRIMARY KEY AUTO_INCREMENT,
    fecha_salida            DATETIME NOT NULL,
    fecha_ingreso           DATETIME NULL,
    estudiante_id           VARCHAR(10) NOT NULL, /*FK*/
    ejemplar_id             VARCHAR(10) NOT NUll, /*FK*/
    CONSTRAINT fk_loan_student
      FOREIGN KEY (estudiante_id)
        REFERENCES estudiante(estudiante_cedula)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);


