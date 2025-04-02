-- 1. Al insertar una evaluación, calcular automáticamente la nota final.
DELIMITER $$
CREATE TRIGGER after_insert_assesment
AFTER INSERT ON assesment
FOR EACH ROW
BEGIN
    DECLARE average DECIMAL(10,2);

    SELECT SUM(g.grade * at.estimation) / SUM(at.estimation) INTO average
    FROM grades g 
    JOIN assesment a ON g.id_assesment = a.id
    JOIN assesment_type at ON a.id_assesment_type = at.id
    WHERE g.id_register_skill = NEW.id_skill_planned;
    
    UPDATE final_grade
    SET final_grade = average
    WHERE id_register_skill = NEW.id_skill_planned;
END $$
DELIMITER ;
INSERT INTO assesment(id_skill_planned, id_state_assesment, id_assesment_type, date_assesment, description) VALUES (1, 1, 1, '2025-04-02', 'Arrays Java');

-- 2. Al actualizar la nota final de un módulo, verificar si el camper aprueba o reprueba.
DELIMITER $$
CREATE TRIGGER evaluated_camper
AFTER UPDATE ON final_grade
FOR EACH ROW
BEGIN
    DECLARE camper_status VARCHAR(20);

    IF NEW.final_grade >= 60 THEN
        SET camper_status = 'Aprobado';
    ELSE
        SET camper_status = 'Reprobado';
    END IF;

    UPDATE camper
    SET id_state_camper = (SELECT id FROM state_camper WHERE type_state = camper_status)
    WHERE id = (SELECT id_camper FROM register_skill WHERE id = NEW.id_register_skill);

END $$
DELIMITER ;
--Prueba 
UPDATE final_grade SET final_grade = 58 WHERE id_register_skill = 1;
-- 3. Al insertar una inscripción, cambiar el estado del camper a "Inscrito".
DELIMITER $$
CREATE TRIGGER change_state_camper
AFTER INSERT ON register_skill
FOR EACH ROW
BEGIN 
    UPDATE camper
    SET id_state_camper = (SELECT id FROM state_camper WHERE type_state = 'Inscrito')
    WHERE id = NEW.id_camper;
END $$
DELIMITER ;

--Prueba
INSERT INTO register_skill(id_camper, id_skill_planned, date_registration) VALUES(1, 1, '2025-09-10');
-- 4. Al actualizar una evaluación, recalcular su promedio inmediatamente.
DELIMITER $$
CREATE TRIGGER recalculate_final_grade
AFTER UPDATE ON assesment
FOR EACH ROW
BEGIN 
    DECLARE new_average DECIMAL(10,2);

    SELECT SUM(g.grade * atp.estimation) / SUM(atp.estimation) INTO new_average
    FROM grades g
    JOIN assesment a ON g.id_assesment = a.id
    JOIN assesment_type atp ON a.id_assesment_type = atp.id
    WHERE g.id_register_skill = NEW.id_skill_planned;

    -- Actualizar la nota final
    UPDATE final_grade
    SET final_grade = new_average
    WHERE id_register_skill = NEW.id_skill_planned;
END $$
DELIMITER ;

--Prueba
UPDATE grades SET grade = 76 WHERE id_register_skill = 1 AND id_assesment = 1;

-- 5. Al eliminar una inscripción, marcar al camper como “Retirado”.
DELIMITER $$
CREATE TRIGGER delete_register_skill
AFTER DELETE ON register_skill
FOR EACH ROW
BEGIN
    UPDATE camper
    SET id_state_camper = (SELECT id FROM state_camper WHERE type_state = 'Retirado')
    WHERE id = OLD.id_camper;
END $$
DELIMITER ;

--Prueba
DELETE FROM register_skill WHERE id = 2;
-- 6. Al insertar un nuevo módulo, registrar automáticamente su SGDB asociado.

-- 7. Al insertar un nuevo trainer, verificar duplicados por identificación.
DELIMITER $$
CREATE TRIGGER check_trainer
BEFORE INSERT ON trainers
FOR EACH ROW 
BEGIN
    DECLARE count_duplicates INT;

    SELECT COUNT(*) INTO count_duplicates
    FROM trainers
    WHERE identification = NEW.identification;

    IF count_duplicates > 0 THEN
    SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'This trainer identification already exists';
    END IF;
END $$
DELIMITER ;
--Prueba
INSERT INTO trainers(name, surname, identification, headquarters_id) VALUES('María', 'Jaimes', '123456789', 1);
-- 8. Al asignar un área, validar que no exceda su capacidad.
DELIMITER //

CREATE TRIGGER before_insert_schedule_trainer
BEFORE INSERT ON schedule_trainer
FOR EACH ROW
BEGIN
    DECLARE current_count INT;
    DECLARE max_capacity INT;

    -- Obtener la capacidad máxima del área
    SELECT capacity INTO max_capacity
    FROM area
    WHERE id = NEW.area_id;

    -- Contar cuántas asignaciones hay actualmente en esa área
    SELECT COUNT(*) INTO current_count
    FROM schedule_trainer
    WHERE area_id = NEW.area_id;

    -- Si la cantidad actual es igual o mayor a la capacidad, lanzar un error
    IF current_count >= max_capacity THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: The area has reached its maximum capacity';
    END IF;
END //
DELIMITER ;
-- 9. Al insertar una evaluación con nota < 60, marcar al camper como “Bajo rendimiento”.
DELIMITER $$
CREATE TRIGGER low_performance_camper
AFTER INSERT ON grades
FOR EACH ROW 
BEGIN
    IF NEW.grade < 60 THEN
        UPDATE camper
        SET id_state_camper = (SELECT id FROM state_camper WHERE type_state = 'Bajo rendimiento')
        WHERE id = (SELECT id_camper FROM register_skill WHERE id = NEW.id_register_skill);
    END IF;
END $$
DELIMITER ;

--Prueba
INSERT INTO grades(id_register_skill, id_assesment, grade)
VALUES (13, 2, 54);
-- 10. Al cambiar de estado a “Graduado”, mover registro a la tabla de egresados.
DELIMITER $$
CREATE TRIGGER change_camper_graduated
AFTER UPDATE ON camper
FOR EACH ROW 
BEGIN
    DECLARE camper_graduated INT;
    
    -- Obtener el ID del estado "Graduado"
    SELECT id INTO camper_graduated FROM state_camper WHERE type_state = 'Graduado' LIMIT 1;
    
    -- Si el nuevo estado es "Graduado"
    IF NEW.id_state_camper = camper_graduated AND OLD.id_state_camper != camper_graduated THEN
        -- Insertar en la tabla de graduados
        INSERT INTO graduates (id_camper, date_graduation)
        VALUES (NEW.id, CURDATE());
    END IF;
END $$
DELIMITER ;
--Prueba
UPDATE camper SET id_state_camper = 5 WHERE id = 5;
-- 11. Al modificar horarios de trainer, verificar solapamiento con otros.
DELIMITER //

CREATE TRIGGER check_schedule_trainer
BEFORE INSERT ON schedule_trainer
FOR EACH ROW
BEGIN
    DECLARE same_schedule INT;

    -- Contar cuántos horarios se solapan con el nuevo
    SELECT COUNT(*) INTO same_schedule
    FROM schedule_train st
    JOIN schedule s1 ON st.schedule_id = s1.id
    JOIN schedule s2 ON NEW.schedule_id = s2.id
    WHERE st.trainer_id = NEW.trainer_id
      AND (
          (s2.start_time BETWEEN s1.start_time AND s1.end_time) OR
          (s2.end_time BETWEEN s1.start_time AND s1.end_time) OR
          (s1.start_time BETWEEN s2.start_time AND s2.end_time)
      );

    -- Si hay conflicto, bloquear la inserción
    IF same_schedule > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: The trainer already has a conflicting schedule';
    END IF;
END //
DELIMITER ;
-- 12. Al eliminar un trainer, liberar sus horarios y rutas asignadas.
DELIMITER $$
CREATE TRIGGER before_trainer_delete
BEFORE DELETE ON trainers
FOR EACH ROW
BEGIN
    DELETE FROM schedule_trainer
    WHERE trainer_id = OLD.id;

    UPDATE group_campus
    SET trainer_id = NULL
    WHERE trainer_id = OLD.id;
END $$
DELIMITER ;

--Prueba
DELETE FROM trainers WHERE id = 5;
-- 13. Al cambiar la ruta de un camper, actualizar automáticamente sus módulos.
DELIMITER $$

CREATE TRIGGER after_change_route_camper
AFTER UPDATE ON camper
FOR EACH ROW
BEGIN
    DECLARE pending_state_id INT;

    -- Verificar si la ruta de aprendizaje ha cambiado
    IF NEW.id_learning_route != OLD.id_learning_route THEN
        -- Obtener el ID del estado "Pendiente"
        SELECT id INTO pending_state_id 
        FROM state_skill 
        WHERE description = 'En Espera' 
        LIMIT 1;

        -- Eliminar los registros anteriores de habilidades del camper
        DELETE FROM register_skill
        WHERE id_camper = NEW.id;

        -- Insertar nuevos registros de habilidades basados en la nueva ruta
        INSERT INTO register_skill (id_camper, id_skill_planned, date_registration, id_state_skill)
        SELECT NEW.id, sp.id, CURDATE(), pending_state_id
        FROM skill_planned sp
        WHERE sp.id_route = NEW.id_learning_route;
    END IF;
END $$

DELIMITER ;
--Prueba
UPDATE camper SET id_learning_route = 2 WHERE id = 6;
-- 14. Al insertar un nuevo camper, verificar si ya existe por número de documento.
DELIMITER $$
CREATE TRIGGER check_camper
BEFORE INSERT ON camper
FOR EACH ROW
BEGIN
    DECLARE count_duplicates INT;
    
    -- Verificar si ya existe un camper con la misma identificación
    SELECT COUNT(*) INTO count_duplicates 
    FROM camper 
    WHERE identification = NEW.identification;
    
    -- Si existe, lanzar un error
    IF count_duplicates > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'This camper identification already exists';
    END IF;
END $$
DELIMITER ;
DROP TRIGGER check_camper;
--Prueba
INSERT INTO camper (identification, name, surname, date_registration, id_headquarters, id_state_camper, id_risk_level, id_tutor, id_learning_route) VALUES ('1052340500', 'Sara', 'Bandera', '2025-04-01', 1, 1, 1, 1, 1);
-- 15. Al actualizar la nota final, recalcular el estado del módulo automáticamente.
DELIMITER $$
CREATE TRIGGER after_grade_update
AFTER UPDATE ON grades
FOR EACH ROW
BEGIN
    DECLARE state_id INT;
    DECLARE skill_id INT;
    
    -- Obtener el skill_planned asociado a esta evaluación
    SELECT id_skill_planned INTO skill_id
    FROM assesment
    WHERE id = NEW.id;
    
    -- Si la nota es mayor o igual a 60, aprueba
    IF NEW.grade >= 60 THEN
        -- Obtener el ID del estado "Aprobado"
        SELECT id INTO state_id FROM state_skill WHERE description = 'Aprobado' LIMIT 1;
    ELSE
        -- Obtener el ID del estado "Reprobado"
        SELECT id INTO state_id FROM state_skill WHERE description = 'Reprobado' LIMIT 1;
    END IF;
    
    -- Actualizar el estado del skill en la tabla de registros
    UPDATE skill_planned 
    SET id_state_skill = state_id
    WHERE id_skill = skill_id;
END $$
DELIMITER ;
--Prueba
UPDATE grades SET grade = 20 WHERE id = 3;
-- 16. Al asignar un módulo, verificar que el trainer tenga ese conocimiento.
DELIMITER $$

CREATE TRIGGER before_assign_skill_trainer
BEFORE INSERT ON schedule_trainer
FOR EACH ROW
BEGIN
    DECLARE skill_count INT;

    -- Contar si el entrenador tiene la especialización requerida para el módulo
    SELECT COUNT(*) INTO skill_count
    FROM skill_trainer st
    JOIN skill_planned sp ON st.id_especialization = sp.id_skill
    WHERE st.id_trainer = NEW.trainer_id
      AND sp.id = NEW.schedule_id;

    -- Si no tiene la especialización requerida, bloquear la inserción
    IF skill_count = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: The trainer does not have the required skill for this module';
    END IF;
END $$

DELIMITER ;
-- 17. Al cambiar el estado de un área a inactiva, liberar campers asignados.
DELIMITER $$
CREATE TRIGGER after_area_update
AFTER UPDATE ON area
FOR EACH ROW
BEGIN
    DECLARE inactive_state_id INT;
    
    -- Obtener el ID del estado "Inactivo"
    SELECT id INTO inactive_state_id FROM state WHERE name = 'Inactivo' LIMIT 1;
    
    -- Si el nuevo estado es "Inactivo"
    IF NEW.state_id = inactive_state_id AND OLD.state_id != inactive_state_id THEN

        UPDATE schedule_trainer
        SET area_id = NULL
        WHERE area_id = NEW.id;
    END IF;
END $$
DELIMITER ;
DROP TRIGGER after_area_update;
--Prueba
UPDATE area SET state_id = 3 WHERE id = 1;
-- 18. Al crear una nueva ruta, clonar la plantilla base de módulos y SGDBs.
DELIMITER $$
CREATE TRIGGER after_learning_route_insert
AFTER INSERT ON learning_route
FOR EACH ROW
BEGIN
    DECLARE template_route_id INT;
    
    -- Obtener la ruta de plantilla (supongamos que tiene ID 1)
    SET template_route_id = 1;
    
    -- Clonar módulos de la plantilla
    INSERT INTO skill_planned (id_skill, id_route, start_date, end_date, id_state_skill)
    SELECT id_skill, NEW.id, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 3 MONTH), id_state_skill
    FROM skill_planned
    WHERE id_route = template_route_id;
    
    -- Clonar SGDBs asociados
    INSERT INTO sgdb_route (id_route, id_Main_SGBD, id_Second_SGBD)
    SELECT NEW.id, id_Main_SGBD, id_Second_SGBD
    FROM sgdb_route
    WHERE id_route = template_route_id;
END $$
DELIMITER ;

--Prueba
INSERT INTO learning_route(description) VALUES('WordPress');
-- 19. Al registrar la nota práctica, verificar que no supere 60% del total.
DELIMITER $$
CREATE TRIGGER check_practical_assesment
BEFORE INSERT ON assesment
FOR EACH ROW
BEGIN
    DECLARE assessment_type_id INT;
    DECLARE total_practical DECIMAL(5,2);
    
    -- Obtener el ID del tipo de evaluación "Práctica"
    SELECT id INTO assessment_type_id
    FROM assesment_type
    WHERE type_name = 'Práctica' LIMIT 1;
    
    -- Si es una evaluación práctica
    IF NEW.id_assesment_type = assessment_type_id THEN
        -- Calcular el total de notas prácticas para este skill
        SELECT SUM(at.estimation) INTO total_practical
        FROM assesment a
        JOIN assesment_type at ON a.id_assesment_type = at.id
        WHERE a.id_skill_planned = NEW.id_skill_planned
        AND a.id_assesment_type = assessment_type_id;
        
        -- Sumar la nueva nota
        SET total_practical = IFNULL(total_practical, 0) + NEW.at.estimation;
        
        -- Verificar que no supere el 60%
        IF total_practical > 60 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'La nota práctica no puede superar el 60% del total';
        END IF;
    END IF;
END $$
DELIMITER ;

INSERT INTO assesment (id_skill_planned, id_state_assesment, id_assesment_type, date_assesment, description) VALUES (1, 2, 3, '2025-04-01', 'Nota práctica');


-- 20. Al modificar una ruta, notificar cambios a los trainers asignados.
DELIMITER //

CREATE TRIGGER after_learning_route_update
AFTER UPDATE ON learning_route
FOR EACH ROW
BEGIN
    -- Registrar los cambios en la tabla de log para cada trainer afectado
    INSERT INTO notification_log (message, target_type, id_trainer)
    SELECT DISTINCT CONCAT('The learning route ', NEW.id, ' has been modified. Please check the changes.'),
           t.id,
           'trainer',
           t.id
    FROM trainers t
    JOIN group_campus gc ON t.id = gc.trainer_id
    WHERE gc.route_id = NEW.id;

END //
DELIMITER ;
--Prueba
UPDATE learning_route SET description = 'FRONTEND' WHERE id = 1;
