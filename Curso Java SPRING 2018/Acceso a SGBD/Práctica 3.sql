CREATE TABLE socios(
	DNI CHAR(9) NOT NULL,
	nombre VARCHAR(150) NOT NULL,
	fechaAlta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	usuario VARCHAR(8),
	clave VARCHAR(8),
	email VARCHAR(100),
	PRIMARY KEY(DNI)
);

CREATE TABLE tipos_peliculas(
	codigo INTEGER NOT NULL,
	nombre VARCHAR(50) NOT NULL,
	PRIMARY KEY (codigo)
);

CREATE TABLE peliculas(
	titulo VARCHAR(150) NOT NULL,
	tipo INTEGER NOT NULL,
	autor VARCHAR(150),
	actores TEXT,
	PRIMARY KEY(titulo),
	CONSTRAINT FK_peliculas_tipos FOREIGN KEY(tipo)
	REFERENCES tipos_peliculas(codigo)
);

CREATE TABLE ejemplares(
	codigo INTEGER NOT NULL AUTO_INCREMENT,
	titulo VARCHAR(150) NOT NULL,
	fechaAlta DATETIME NOT NULL,
	PRIMARY KEY(codigo),
	CONSTRAINT FK_ejemplares_peliculas FOREIGN KEY (titulo)
	REFERENCES peliculas(titulo)
);

CREATE TABLE alquiler(
	DNI CHAR(9) NOT NULL,	
	codigo INTEGER NOT NULL,
	fechaRetirada DATETIME NOT NULL,
	fechaDevolucion DATETIME NOT NULL,
	PRIMARY KEY(DNI, codigo),
	CONSTRAINT FK_alquiler_socios FOREIGN KEY (DNI)
	REFERENCES socios(DNI),
	CONSTRAINT FK_alquiler_ejemplares FOREIGN KEY (codigo)
	REFERENCES ejemplares(codigo)
)