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
CALL assesment_camper(2, 1, '2025-04-30', '2025-03-31', '2025-05-10', 'Conceptos Arrays Java', 'Proyecto Java', 'Quizz Arrays Java');

-- 5. Calcular y registrar automáticamente la nota final de un módulo.
DELIMITER //
CREATE PROCEDURE final_grade_skill(IN id_register_skill INT)
BEGIN
    DECLARE final_grade DECIMAL(10,2);
    
    -- Calcular la nota final basada en el promedio de las calificaciones del módulo
    SELECT AVG(grade) INTO final_grade
    FROM grades
    WHERE id_register_skill = id_register_skill;
    
    -- Actualizar o insertar en la tabla final_grade
    INSERT INTO final_grade (id_register_skill, final_grade)
    VALUES (id_register_skill, final_grade)
    ON DUPLICATE KEY UPDATE final_grade = final_grade;
    
    -- Opcional: Actualizar el estado del camper basado en la nota final
    IF final_grade >= 60 THEN
        UPDATE register_skill
        SET id_skill_planned = (SELECT id FROM skill_planned WHERE id_state_skill = 
            (SELECT id FROM state_skill WHERE description = 'Aprobado'))
        WHERE id = id_register_skill;
    ELSE
        UPDATE register_skill
        SET id_skill_planned = (SELECT id FROM skill_planned WHERE id_state_skill = 
            (SELECT id FROM state_skill WHERE description = 'Reprobado'))
        WHERE id = id_register_skill;
    END IF;
END //
DELIMITER ;
--Prueba
CALL final_grade_skill(3);

-- 6. Asignar campers aprobados a una ruta de acuerdo con la disponibilidad del área.
DELIMITER //

CREATE PROCEDURE register_camper_route(IN p_id_camper INT, IN p_id_route INT)
BEGIN
    DECLARE p_area_id INT;
    DECLARE currently_capacity INT;
    DECLARE capacity INT;

    -- Obtener el área asociada a la ruta (considerando solo un área por ruta)
    SELECT DISTINCT st.area_id INTO p_area_id
    FROM schedule_trainer st
    JOIN trainers t ON st.trainer_id = t.id
    JOIN group_campus gc ON t.id = gc.trainer_id
    JOIN group_details gd ON gc.id = gd.id_group
    WHERE gc.route_id = p_id_route
    LIMIT 1; 

    -- Verificar si se obtuvo un área válida
    IF p_area_id IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: No se encontró un área asociada a la ruta seleccionada';
    END IF;
    
    -- Verificar capacidad actual vs máxima
    SELECT COUNT(*) INTO currently_capacity
    FROM camper c
    JOIN group_details gp ON c.id = gp.id_camper
    JOIN group_campus gc ON gp.id_group = gc.id
    JOIN trainers t ON gc.trainer_id = t.id
    JOIN schedule_trainer st ON t.id = st.trainer_id
    WHERE st.area_id = p_area_id;
    
    SELECT capacity INTO capacity
    FROM area
    WHERE id = p_area_id;
    
    -- Si hay espacio disponible, asignar al camper
    IF currently_capacity < capacity THEN
        UPDATE camper
        SET id_learning_route = p_id_route,
            id_state_camper = (SELECT id FROM state_camper WHERE type_state = 'Inscrito')
        WHERE id = p_id_camper;
        
        SELECT 'El camper ha sido asignado correctamente a la ruta' AS Mensaje;
    ELSE
        SELECT 'El área está llena para esta ruta' AS Mensaje;
    END IF;
END //
DELIMITER ;
CALL register_camper_route(1, 1);

-- 7. Asignar un trainer a una ruta y área específica, validando el horario.
DELIMITER //
CREATE PROCEDURE assignTrainerRoute(
    IN p_trainer_id INT,
    IN p_route_id INT,
    IN p_area_id INT,
    IN p_schedule_id INT
)
BEGIN
    DECLARE v_validate INT DEFAULT 0;
    
    -- Verificar si el trainer ya tiene asignado el mismo horario en otra área
    SELECT COUNT(*) INTO v_validate
    FROM schedule_trainer st
    JOIN schedule s ON st.schedule_id = s.id
    WHERE st.trainer_id = p_trainer_id
    AND s.time_slot = (SELECT time_slot FROM schedule WHERE id = p_schedule_id);
    
    IF v_validate = 0 THEN
        -- Insertar nueva asignación
        INSERT INTO schedule_trainer (trainer_id, schedule_id, area_id)
        VALUES (p_trainer_id, p_schedule_id, p_area_id);
        
        -- Actualizar la relación con la ruta si es necesario
        INSERT INTO skill_trainer (id_trainer, id_specialization)
        SELECT p_trainer_id, e.id
        FROM specialization e
        JOIN learning_route lr ON e.id = lr.id
        WHERE lr.id = p_route_id
        ON DUPLICATE KEY UPDATE id_trainer = p_trainer_id;
        
        SELECT 'Trainer asignado exitosamente' AS Mensaje;
    ELSE
        SELECT 'Conflicto de horario. El trainer ya está asignado en este horario.' AS Mensaje;
    END IF;
END //
DELIMITER ;
CALL assignTrainerRoute(1, 1, 1, 1);

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
DELIMITER //
CREATE PROCEDURE new_area(
    IN p_name VARCHAR(100),
    IN p_capacity INT,
    IN p_state_id INT,
    IN p_start_time TIME,
    IN p_end_time TIME,
    IN p_time_slot VARCHAR(50)
)
BEGIN
    DECLARE v_area_id INT;
    DECLARE v_schedule_id INT;
    
    -- Insertar nueva área
    INSERT INTO area (name, capacity, state_id)
    VALUES (p_name, p_capacity, p_state_id);
    
    SET v_area_id = LAST_INSERT_ID();
    
    -- Crear horario para el área
    INSERT INTO schedule (start_time, end_time, time_slot)
    VALUES (p_start_time, p_end_time, p_time_slot);
    
    SET v_schedule_id = LAST_INSERT_ID();
    
    SELECT CONCAT('Área registrada con ID: ', v_area_id) AS Mensaje;
END //
DELIMITER ;
CALL new_area('Zona Hunters', 35, 1, '08:00:00', '17:00:00', 'AM');
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
DELIMITER //
CREATE PROCEDURE ReasignarCamperPorBajoRendimiento(
    IN p_id_camper INT,
    IN p_nueva_ruta_id INT
)
BEGIN
    DECLARE v_promedio_actual DECIMAL(5,2);
    DECLARE v_area_id INT;
    DECLARE v_capacidad_actual INT;
    DECLARE v_capacidad_maxima INT;
    
    -- Calcular promedio actual del camper
    SELECT AVG(fg.final_grade) INTO v_promedio_actual
    FROM final_grade fg
    JOIN register_skill rs ON fg.id_register_skill = rs.id
    WHERE rs.id_camper = p_id_camper;
    
    -- Obtener el área asociada a la nueva ruta
    SELECT id_area INTO v_area_id
    FROM sgdb_route
    WHERE id_route = p_nueva_ruta_id;
    
    -- Verificar capacidad
    SELECT COUNT(*) INTO v_capacidad_actual
    FROM camper c
    JOIN sgdb_route r ON c.id_learning_route = r.id
    WHERE r.id_area = v_area_id;
    
    SELECT capacity INTO v_capacidad_maxima
    FROM area
    WHERE id = v_area_id;
    
    -- Si el promedio es bajo y hay capacidad, reasignar
    IF v_promedio_actual < 60 AND v_capacidad_actual < v_capacidad_maxima THEN
        -- Registrar el cambio en el historial
        INSERT INTO camper_history (id_camper, date_change, previous_state, new_state)
        SELECT 
            p_id_camper, 
            NOW(), 
            c.id_state_camper,
            (SELECT id FROM state_camper WHERE type_state = 'Reasignado')
        FROM camper c
        WHERE c.id = p_id_camper;
        
        -- Actualizar la ruta del camper
        UPDATE camper
        SET id_learning_route = p_nueva_ruta_id,
            id_state_camper = (SELECT id FROM state_camper WHERE type_state = 'Reasignado')
        WHERE id = p_id_camper;
        
        SELECT 'Camper reasignado exitosamente debido a bajo rendimiento' AS Mensaje;
    ELSEIF v_promedio_actual >= 60 THEN
        SELECT 'El camper tiene un rendimiento adecuado, no requiere reasignación' AS Mensaje;
    ELSE
        SELECT 'No hay capacidad disponible en el área para la nueva ruta' AS Mensaje;
    END IF;
END //
DELIMITER ;

-- 12. Cambiar el estado de un camper a "Graduado" al finalizar todos los módulos.
DELIMITER //
CREATE PROCEDURE GraduateCamper(IN p_id_camper INT)
BEGIN
    DECLARE v_total_skill INT;
    DECLARE v_success_skill INT;
    
    -- Contar total de módulos en la ruta del camper
    SELECT COUNT(*) INTO v_total_skill
    FROM skill_planned sp
    JOIN sgdb_route r ON sp.id_route = r.id
    JOIN camper c ON c.id_learning_route = r.id_route
    WHERE c.id = p_id_camper;
    
    -- Contar módulos aprobados por el camper
    SELECT COUNT(*) INTO v_success_skill
    FROM register_skill rs
    JOIN skill_planned sp ON rs.id_skill_planned = sp.id
    JOIN final_grade fg ON fg.id_register_skill = rs.id
    WHERE rs.id_camper = p_id_camper
    AND fg.final_grade >= 60;
    
    -- Si completó todos los módulos, cambiar estado a Graduado
    IF v_success_skill >= v_total_skill THEN
        -- Registrar en historial
        INSERT INTO camper_history (id_camper, date_change, previous_state, new_state)
        SELECT 
            p_id_camper, 
            NOW(), 
            c.id_state_camper,
            (SELECT id FROM state_camper WHERE type_state = 'Graduado')
        FROM camper c
        WHERE c.id = p_id_camper;
        
        -- Actualizar estado
        UPDATE camper
        SET id_state_camper = (SELECT id FROM state_camper WHERE type_state = 'Graduado')
        WHERE id = p_id_camper;
        
        -- Registrar en tabla de graduados
        INSERT INTO graduates (id_camper, date_graduation)
        VALUES (p_id_camper, CURDATE());
        
        SELECT 'Camper graduado exitosamente' AS Mensaje;
    ELSE
        SELECT CONCAT('El camper aún no ha completado todos los módulos: ', 
                     v_modulos_aprobados, ' de ', v_modulos_totales) AS Mensaje;
    END IF;
END //
DELIMITER ;
CALL GraduateCamper(1);
-- 13. Consultar y exportar todos los datos de rendimiento de un camper.
DELIMITER //
CREATE PROCEDURE performance_camper(IN p_id_camper INT)
BEGIN
    SELECT 
        c.id AS id_camper,
        c.name AS Camper_Name,
        c.surname AS Camper_Surname,
        sc.type_state AS State,
        lr.description AS learning_route,
        s.name AS Skill,
        rs.date_registration AS Start_Skill,
        ass.id_assesment_type AS Type_Assesment,
        g.grade AS Assesment,
        g.id_assesment AS id_assesment,
        fg.final_grade AS Final_Grade_Skill,
        ch.date_change AS Change_State,
        ch.previous_state AS previous_state,
        ch.new_state AS new_state
    FROM camper c
    LEFT JOIN state_camper sc ON c.id_state_camper = sc.id
    LEFT JOIN learning_route lr ON c.id_learning_route = lr.id
    LEFT JOIN sgdb_route sr ON lr.id = sr.id_route
    LEFT JOIN register_skill rs ON c.id = rs.id_camper
    LEFT JOIN skill_planned sp ON rs.id_skill_planned = sp.id
    LEFT JOIN skill s ON sp.id_skill = s.id
    LEFT JOIN grades g ON rs.id = g.id_register_skill
    LEFT JOIN assesment ass ON g.id_assesment = ass.id
    LEFT JOIN final_grade fg ON rs.id = fg.id_register_skill
    LEFT JOIN camper_history ch ON c.id = ch.id_camper
    WHERE c.id = p_id_camper
    ORDER BY s.name, g.id_assesment;
END //
DELIMITER ;
CALL performance_camper(1);
-- 14. Registrar la asistencia a clases por área y horario.
DELIMITER //
CREATE PROCEDURE RegisterAttendance(
    IN p_id_camper INT,
    IN p_id_session INT
)
BEGIN
    -- Verificar que el camper pertenezca al área y horario de la sesión
    DECLARE v_validate BOOLEAN DEFAULT FALSE;
    
    SELECT TRUE INTO v_validate
    FROM camper c
    JOIN sgdb_route sr ON c.id_learning_route = sr.id_route
    JOIN session s ON s.id_skill_planned = sr.id
    WHERE c.id = p_id_camper AND s.id = p_id_session;
    
    IF v_validate THEN
        -- Registrar asistencia
        INSERT INTO attendance (id_camper, id_session)
        VALUES (p_id_camper, p_id_session)
        ON DUPLICATE KEY UPDATE id_session = p_id_session;
        
        SELECT 'Asistencia registrada exitosamente' AS Mensaje;
    ELSE
        SELECT 'El camper no pertenece a esta sesión o área' AS Mensaje;
    END IF;
END //
DELIMITER ;
CALL RegisterAttendance(1, 1);
-- 15. Generar reporte mensual de notas por ruta.
DELIMITER //
CREATE PROCEDURE report_per_month_route(
    IN p_id_route INT,
    IN p_month INT,
    IN p_year INT
)
BEGIN
    SELECT 
        lr.description AS learning_route,
        s.name AS Skill,
        c.name AS name_camper,
        c.surname AS surname_camper,
        AVG(g.grade) AS average_assesment,
        fg.final_grade AS final_grade,
        CASE 
            WHEN fg.final_grade >= 60 THEN 'Aprobado'
            ELSE 'Reprobado'
        END AS State
    FROM learning_route lr
    JOIN skill_planned sp ON lr.id = sp.id_route
    JOIN skill s ON sp.id_skill = s.id
    JOIN register_skill rs ON sp.id = rs.id_skill_planned
    JOIN camper c ON rs.id_camper = c.id
    JOIN grades g ON rs.id = g.id_register_skill
    JOIN final_grade fg ON rs.id = fg.id_register_skill
    WHERE lr.id = p_id_route
    AND MONTH(rs.date_registration) = p_month
    AND YEAR(rs.date_registration) = p_year
    GROUP BY lr.id, sp.id, c.id, fg.final_grade
    ORDER BY s.name, fg.final_grade DESC;
END //
DELIMITER ;
CALL report_per_month_route(1, 01, 2025);

-- 16. Validar y registrar la asignación de un salón a una ruta sin exceder la capacidad.
DELIMITER //
CREATE PROCEDURE area_per_route(
    IN p_id_route INT,
    IN p_id_trainer INT,
    IN p_id_area INT
)
BEGIN
    DECLARE v_capacity INT;
    DECLARE v_total_campers INT;
    
    -- Obtener capacidad del salón
    SELECT capacity INTO v_capacity
    FROM area
    WHERE id = p_id_area;
    
    -- Contar campers asignados a la ruta
    SELECT COUNT(*) INTO v_total_campers
    FROM camper c
    JOIN group_details gd ON c.id = gd.id_camper
    JOIN group_campus gc ON gd.id_group = gc.id
    WHERE gc.route_id = p_id_route;
    
    -- Verificar capacidad
    IF v_total_campers <= v_capacity THEN
        INSERT INTO schedule_trainer(route_id, trainer_id, area_id)
        VALUES(p_id_route, p_id_trainer, p_id_area);

        SELECT 'Salón asignado exitosamente a la ruta' AS Mensaje;
    ELSE
        SELECT CONCAT('La capacidad del salón (', v_capacity, 
                     ') es insuficiente para los campers asignados (', 
                     v_total_campers, ')') AS Mensaje;
    END IF;
END //
DELIMITER ;
CALL area_per_route(1, 1, 1);

-- 17. Registrar cambio de horario de un trainer.
DELIMITER //
CREATE PROCEDURE change_schedule_trainer(
    IN p_trainer_id INT,
    IN p_old_schedule_id INT,
    IN p_new_schedule_id INT
)
BEGIN
    DECLARE v_validate INT DEFAULT 0;
    
    -- Verificar si el nuevo horario genera conflicto
    SELECT COUNT(*) INTO v_validate
    FROM schedule_trainer st
    JOIN schedule s1 ON st.schedule_id = s1.id
    JOIN schedule s2 ON s2.id = p_new_schedule_id
    WHERE st.trainer_id = p_trainer_id
    AND s1.time_slot = s2.time_slot
    AND st.schedule_id != p_old_schedule_id;
    
    IF v_validate = 0 THEN
        -- Actualizar el horario
        UPDATE schedule_trainer
        SET schedule_id = p_new_schedule_id
        WHERE trainer_id = p_trainer_id
        AND schedule_id = p_old_schedule_id;
        
        SELECT 'Horario del trainer actualizado exitosamente' AS Mensaje;
    ELSE
        SELECT 'El nuevo horario genera conflicto con otro horario existente del trainer' AS Mensaje;
    END IF;
END //
DELIMITER ;
CALL change_schedule_trainer(1, 1, 2);
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
CALL delete_camper(11);

-- 19. Recalcular el estado de todos los campers según su rendimiento acumulado.
DELIMITER //
CREATE PROCEDURE reevaluate_state_camper()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE v_id_camper INT;
    DECLARE v_average DECIMAL(5,2);
    DECLARE v_new_state INT;
    
    -- Cursor para recorrer todos los campers
    DECLARE cur_campers CURSOR FOR 
        SELECT DISTINCT c.id
        FROM camper c
        WHERE c.id_state_camper NOT IN (
            SELECT id FROM state_camper WHERE type_state IN ('Graduado', 'Retirado')
        );
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN cur_campers;
    
    process_campers: LOOP
        FETCH cur_campers INTO v_id_camper;
        IF done THEN
            LEAVE process_campers;
        END IF;
        
        -- Calcular promedio del camper
        SELECT AVG(fg.final_grade) INTO v_average
        FROM final_grade fg
        JOIN register_skill rs ON fg.id_register_skill = rs.id
        WHERE rs.id_camper = v_id_camper;
        
        -- Determinar nuevo estado basado en promedio
        IF v_average IS NULL THEN
            -- No tiene notas aún
            SET v_new_state = (SELECT id FROM state_camper WHERE type_state = 'En formación');
        ELSEIF v_average >= 60 THEN
            SET v_new_state = (SELECT id FROM state_camper WHERE type_state = 'Activo');
        ELSE
            SET v_new_state = (SELECT id FROM state_camper WHERE type_state = 'Riesgo');
        END IF;
        
        -- Actualizar solo si el estado es diferente
        UPDATE camper c
        SET c.id_state_camper = v_new_state
        WHERE c.id = v_id_camper
        AND c.id_state_camper != v_new_state;
        
        -- Registrar cambio en historial si hubo cambio
        IF ROW_COUNT() > 0 THEN
            INSERT INTO camper_history (id_camper, date_change, previous_state, new_state)
            VALUES (v_id_camper, NOW(), 
                   (SELECT id_state_camper FROM camper WHERE id = v_id_camper), 
                   v_new_state);
        END IF;
    END LOOP;
    
    CLOSE cur_campers;
    
    SELECT 'Estados de campers recalculados exitosamente' AS Mensaje;
END //
DELIMITER ;

CALL reevaluate_state_camper();

-- 20. Asignar horarios automáticamente a trainers disponibles según sus áreas.
DELIMITER //
CREATE PROCEDURE automatic_schedules()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE v_trainer_id INT;
    DECLARE v_schedule_id INT;
    
    -- Cursor para trainers sin horario asignado
    DECLARE cur_trainers CURSOR FOR
        SELECT DISTINCT t.id
        FROM trainers t
        WHERE t.id NOT IN (
            SELECT DISTINCT trainer_id 
            FROM schedule_trainer
        )
        ORDER BY t.id;
    
    -- Cursor para horarios disponibles
    DECLARE cur_schedules CURSOR FOR
        SELECT s.id
        FROM schedule s
        WHERE s.id NOT IN (
            SELECT DISTINCT schedule_id 
            FROM schedule_trainer
        )
        ORDER BY s.start_time;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN cur_trainers;
    OPEN cur_schedules;
    
    assign_loop: LOOP
        FETCH cur_trainers INTO v_trainer_id;
        IF done THEN
            LEAVE assign_loop;
        END IF;
        
        SET done = FALSE; 
        
        FETCH cur_schedules INTO v_schedule_id;
        IF NOT done THEN
            INSERT INTO schedule_trainer (trainer_id, schedule_id)
            VALUES (v_trainer_id, v_schedule_id);
    END LOOP;
    
    CLOSE cur_trainers;
    CLOSE cur_schedules;
    
    SELECT 'Horarios asignados automáticamente a trainers disponibles' AS Mensaje;
END //
DELIMITER ;
CALL automatic_schedules();