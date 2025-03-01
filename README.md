# Desafio_01_DFW

Manuel de Jesús Escobar Contreras  EC230554

CODIGO FUENTE:

package sv.edu.udb.Desafio_01;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;
import sv.edu.udb.Desafio_01.repository.AlumnoRepository;
import sv.edu.udb.Desafio_01.repository.MateriaRepository;

import static org.assertj.core.api.Assertions.assertThat;

@SpringBootTest
public class AlumnoMateriaTests {

    @Autowired
    private AlumnoRepository alumnoRepository;

    @Autowired
    private MateriaRepository materiaRepository;

    @Test
    @Transactional
    public void testInsertarRegistros() {
        // Crear y guardar una nueva materia
        Materia materia = new Materia();
        materia.setNombre("Biología");
        materiaRepository.save(materia);

        // Verificar que la materia se haya guardado
        assertThat(materiaRepository.findById(materia.getId())).isPresent();

        // Crear y guardar un nuevo alumno
        Alumno alumno = new Alumno();
        alumno.setNombre("Pedro");
        alumno.setApellido("Ramírez");
        alumno.setIdMateria(materia.getId());
        alumnoRepository.save(alumno);

        // Verificar que el alumno se haya guardado
        assertThat(alumnoRepository.findById(alumno.getId())).isPresent();
    }
}


data.sql 

INSERT INTO materia (nombre) VALUES ('Algebra'),
                                    ('Física'),
                                    ('Química'),
                                    ('DWF'),
                                    ('SPL');

INSERT INTO alumno (nombre, apellido, id_materia) VALUES
                                                      ('Juan', 'Pérez', 1),
                                                      ('Ana', 'García', 2),
                                                      ('Luis', 'Martínez', 3),
                                                      ('María', 'López', 4),
                                                      ('Carlos', 'González', 5);
schema.sql

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
                                                      
