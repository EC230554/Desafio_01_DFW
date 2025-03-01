CREATE TABLE materia (
                         id BIGINT AUTO_INCREMENT PRIMARY KEY,
                         nombre VARCHAR(255) NOT NULL
);

CREATE TABLE alumno (
                        id BIGINT AUTO_INCREMENT PRIMARY KEY,
                        nombre VARCHAR(255) NOT NULL,
                        apellido VARCHAR(255) NOT NULL,
                        id_materia BIGINT,
                        FOREIGN KEY (id_materia) REFERENCES materia(id)
);