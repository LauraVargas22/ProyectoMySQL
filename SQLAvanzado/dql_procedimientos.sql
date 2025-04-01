-- 1. Registrar un nuevo camper con toda su información personal y estado inicial.
DELIMITER $$

CREATE PROCEDURE register_camper(
    IN identification_camper VARCHAR(25),
    IN name_camper VARCHAR(50),
    IN surname_camper VARCHAR(50),
    IN id_headquarters_camper INT,
    IN id_state_camper INT,
    IN id_riskLevel_camper INT,
    IN phone_number_camper VARCHAR(25),
    IN date_registration_camper DATE,
    IN name_tutor VARCHAR(50),
    IN surname_tutor VARCHAR(50),
    IN identification_tutor VARCHAR(25),
    IN phone_number_tutor VARCHAR(25)
)
BEGIN
    DECLARE id_tutor_camper INT;
    DECLARE id_camper INT;
    DECLARE message VARCHAR(100);

    INSERT INTO tutor(name, surname, phone_number, identification)
    VALUES (name_tutor, surname_tutor, phone_number_tutor, identification_tutor);
    
    SET id_tutor_camper = LAST_INSERT_ID();

    INSERT INTO camper(identification, name, surname, date_registration, 
                      id_headquarters, id_state_camper, id_risk_level, id_tutor) 
    VALUES (identification_camper, name_camper, surname_camper, date_registration_camper, 
           id_headquarters_camper, id_state_camper, id_riskLevel_camper, id_tutor_camper);
    
    SET id_camper = LAST_INSERT_ID();

    INSERT INTO telephone(id_camper, phone_number)
    VALUES (id_camper, phone_number_camper);
    
    SET message = CONCAT('Camper ', name_camper, ' ', surname_camper, ' registrado exitosamente.');
    SELECT message AS result;  
END $$

DELIMITER ;
CALL register_camper('9845732452', 'Omar', 'Cardona', 1, 1, 3, '3001234567', '2023-10-01', 'Ana', 'Pérez', '1234432345', '3007654321');

-- 2. Actualizar el estado de un camper luego de completar el proceso de ingreso.
DELIMITER $$
CREATE PROCEDURE update_camper_state(IN camper_id INT)
BEGIN
	DECLARE message VARCHAR(100);

	UPDATE camper 
	SET id_state_camper = 2
	WHERE id = camper_id;
	
    IF ROW_COUNT() > 0 THEN
        SET message = CONCAT('El camper con ID ', camper_id, ' ha sido actualizado exitosamente.');
    ELSE
        SET message = 'No se encontró actualizó el camper con el ID proporcionado.';
    END IF;
    SELECT message AS 'Mensaje';
END $$

DELIMITER ;
CALL update_camper_state(98);

-- 3. Procesar la inscripción de un camper a una ruta específica.
DELIMITER $$
CREATE PROCEDURE learning_route_camper(
    IN camper_id INT,
    IN learning_route_id INT
)
BEGIN
    DECLARE message VARCHAR(100);

    UPDATE camper
    SET id_learning_route = learning_route_id
    WHERE id = camper_id;

    IF ROW_COUNT() > 0 THEN
        SET message = CONCAT('El camper con ID ', camper_id, ' ha sido inscrito exitosamente a la ruta con ID ', learning_route_id, '.');
    ELSE
        SET message = 'No se encontró actualizó el camper con el ID proporcionado.';
    END IF;
    SELECT message AS 'Mensaje';
END $$ 

DELIMITER ;
CALL learning_route_camper(98, 1);

-- 4. Registrar una evaluación completa (teórica, práctica y quizzes) para un camper.
DELIMITER $$
CREATE PROCEDURE assesment_camper(
    IN camper_id INT,
    IN id_skill_planned INT,
    IN date_assesment_theorical DATE,
    IN date_assesment_practical DATE,
    IN date_assesment_quizzes DATE,
    IN description_theorical VARCHAR(50),
    IN description_practical VARCHAR(50),
    IN description_quizzes VARCHAR(50)
)
BEGIN
    DECLARE message VARCHAR(50);
    DECLARE id_state INT;
    DECLARE id_assesment_theorical INT;
    DECLARE id_assesment_practical INT;
    DECLARE id_assesment_quizzes INT;

    SET id_state = 11;
    SET id_assesment_theorical = 1;    
    SET id_assesment_practical = 2; 
    SET id_assesment_quizzes = 3; 

    INSERT INTO assesment(id_assesment_type, id_skill_planned, date_assesment, description, id_state_assesment)
    VALUES (id_assesment_theorical, id_skill_planned, date_assesment_theorical, description_theorical, id_state);

    INSERT INTO assesment(id_assesment_type, id_skill_planned, date_assesment, description, id_state_assesment)
    VALUES (id_assesment_practical, id_skill_planned, date_assesment_practical, description_practical, id_state);

    INSERT INTO assesment(id_assesment_type, id_skill_planned, date_assesment, description, id_state_assesment)
    VALUES (id_assesment_quizzes, id_skill_planned, date_assesment_quizzes, description_quizzes, id_state);

    IF ROW_COUNT() > 0 THEN
        SET message = 'Evaluaciones registradas exitosamente';
    ELSE
        SET message = 'Error en el registro de las evaluaciones.';
    END IF;
    SELECT message AS 'Mensaje';
END $$
DELIMITER ;

CALL assesment_camper(1, 1, '2025-04-30', '2025-03-31', '2025-05-10', 'Conceptos Arrays Java', 'Proyecto Java', 'Quizz Arrays Java');

-- 5. Calcular y registrar automáticamente la nota final de un módulo.
DELIMITER $$
CREATE PROCEDURE final_grade_skill(
    IN id_skill INT
)
BEGIN
    
END $$
DELIMITER ;
-- 6. Asignar campers aprobados a una ruta de acuerdo con la disponibilidad del área.
DELIMITER $$
CREATE PROCEDURE 
BEGIN
END $$
DELIMITER ;
-- 7. Asignar un trainer a una ruta y área específica, validando el horario.
DELIMITER $$
CREATE PROCEDURE 
BEGIN
END $$
DELIMITER ;
-- 8. Registrar una nueva ruta con sus módulos y SGDB asociados.
DELIMITER $$
CREATE PROCEDURE new_learning_route(
    IN description_route VARCHAR(100),
    IN id_skill INT,
    IN start_date DATE,
    IN end_date DATE,
    IN id_state_skill INT,
    IN id_MainSGDB INT,
    IN id_SecondarySGDB INT
)
BEGIN
    DECLARE id_route INT;
    DECLARE message VARCHAR(100);

    INSERT INTO learning_route(description)
    VALUES (description_route);

    SET id_route = LAST_INSERT_ID();

    INSERT INTO skill_planned(id_skill, start_date, end_date, id_state_skill, id_route) 
    VALUES (id_skill, start_date, end_date, id_state_skill, id_route);

    INSERT INTO sgdb_route(id_Main_SGBD, id_Second_SGBD, id_route)
    VALUES (id_MainSGDB, id_SecondarySGDB, id_route);

    IF ROW_COUNT() > 0 THEN
        SET message = 'Ruta de aprendizaje registrada exitosamente';
    ELSE
        SET message = 'Error en el registro de la ruta de aprendizaje.';
    END IF;
    SELECT message AS 'Mensaje';
END $$
DELIMITER ;

CALL new_learning_route('Ruta de Aprendizaje 1', 1, '2025-03-31', '2025-05-01', 1, 1, 2);

-- 9. Registrar una nueva área de entrenamiento con su capacidad y horarios.
DELIMITER $$
CREATE PROCEDURE 
BEGIN
END $$
DELIMITER ;
-- 10. Consultar disponibilidad de horario en un área determinada.
DELIMITER $$
CREATE PROCEDURE area_disponibility(
    IN area_id INT
) 
BEGIN
    SELECT a.name, s.start_time AS Start_Time, s.end_time AS End_Time, s.time_slot AS Available_Time_Slot
    FROM area a
    JOIN schedule s ON 1=1
    LEFT JOIN schedule_trainer st ON a.id = st.area_id AND s.id = st.schedule_id
    WHERE st.area_id IS NULL AND a.id = area_id
    ORDER BY s.time_slot;
END $$
DELIMITER ;
CALL area_disponibility(1);
-- 11. Reasignar a un camper a otra ruta en caso de bajo rendimiento.

-- 12. Cambiar el estado de un camper a “Graduado” al finalizar todos los módulos.
-- 13. Consultar y exportar todos los datos de rendimiento de un camper.
-- 14. Registrar la asistencia a clases por área y horario.
-- 15. Generar reporte mensual de notas por ruta.
-- 16. Validar y registrar la asignación de un salón a una ruta sin exceder la capacidad.
-- 17. Registrar cambio de horario de un trainer.
-- 18. Eliminar la inscripción de un camper a una ruta (en caso de retiro).
DELIMITER $$

CREATE PROCEDURE delete_camper(IN id_camper_to_delete INT)
BEGIN
    DECLARE message VARCHAR(100);
    DECLARE camper_state INT;

    -- Obtener el estado del camper
    SELECT id_state_camper INTO camper_state FROM camper WHERE id = id_camper_to_delete;

    -- Validar si el camper existe y tiene estado 5
    IF camper_state IS NULL THEN
        SET message = 'Error: El camper no existe.';
    ELSEIF camper_state <> 5 THEN
        SET message = 'Error: El camper no tiene estado 5.';
    ELSE
        -- Eliminar registros relacionados en otras tablas
        DELETE FROM camper_address WHERE id_camper = id_camper_to_delete;
        DELETE FROM graduates WHERE id_camper = id_camper_to_delete;
        DELETE FROM group_details WHERE id_camper = id_camper_to_delete;
        DELETE FROM camper_history WHERE id_camper = id_camper_to_delete;
        DELETE FROM attendance WHERE id_camper = id_camper_to_delete;
        DELETE FROM telephone WHERE id_camper = id_camper_to_delete;
        DELETE FROM register_skill WHERE id_camper = id_camper_to_delete;

        -- Eliminar el camper
        DELETE FROM camper WHERE id = id_camper_to_delete;

        -- Verificar si se eliminó correctamente
        IF ROW_COUNT() > 0 THEN
            SET message = 'El camper ha sido eliminado exitosamente.';
        ELSE
            SET message = 'Error inesperado al eliminar el camper.';
        END IF;
    END IF;

    -- Mostrar el mensaje final
    SELECT message AS Mensaje;
END $$
DELIMITER ;
CALL delete_camper(71);

-- 19. Recalcular el estado de todos los campers según su rendimiento acumulado.
-- 20. Asignar horarios automáticamente a trainers disponibles según sus áreas.