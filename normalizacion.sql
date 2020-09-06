CREATE DATABASE biblioteca;

\c biblioteca;

CREATE TABLE libros(
codigo_libro SERIAL PRIMARY KEY,
titulo VARCHAR(150) NOT NULL
);

CREATE TABLE lectores(
id SERIAL PRIMARY KEY,
nombre VARCHAR(150) NOT NULL
);

CREATE TABLE editoriales(
id SERIAL PRIMARY KEY,
editorial VARCHAR(150) NOT NULL
);

CREATE TABLE autores(
id SERIAL PRIMARY KEY,
autor VARCHAR(150) NOT NULL
);

CREATE TABLE libro_autor(
codigo_libro INT NOT NULL,
autor_id INT NOT NULL,
FOREIGN KEY(codigo_libro) REFERENCES libros(codigo_libro),
FOREIGN KEY(autor_id) REFERENCES autores(id)
);

CREATE TABLE libro_editorial(
codigo_libro INT NOT NULL,
editorial_id INT NOT NULL,
FOREIGN KEY(codigo_libro) REFERENCES libros(codigo_libro),
FOREIGN KEY(editorial_id) REFERENCES editoriales(id)
);

CREATE TABLE prestamos(
id SERIAL PRIMARY KEY,
codigo_libro INT NOT NULL,
lector_id INT NOT NULL,
fecha_devolucion DATE NOT NULL,
FOREIGN KEY(codigo_libro) REFERENCES libros(codigo_libro),
FOREIGN KEY(lector_id) REFERENCES lectores(id)
);