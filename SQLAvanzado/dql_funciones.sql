-- 1. Calcular el promedio ponderado de evaluaciones de un camper.
DELIMITER //
CREATE FUNCTION average_assesment_camper(p_camper_id INT) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE avg_assesments DECIMAL(10,2);
    
    SELECT AVG(fg.final_grade)
    INTO avg_assesments
    FROM final_grade fg
    JOIN register_skill rs ON fg.id_register_skill = rs.id
    WHERE rs.id_camper = p_camper_id;
    
    RETURN IFNULL(avg_assesments, 0);
END //
DELIMITER ;

SELECT average_assesment_camper(1);

-- 2. Determinar si un camper aprueba o no un módulo específico.
DELIMITER //
CREATE FUNCTION camper_skill(p_camper_id INT, p_module_id INT) RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
    DECLARE avg_grade DECIMAL(5,2);
    
    SELECT AVG(fg.final_grade) INTO avg_grade
    FROM final_grade fg
    JOIN register_skill rs ON fg.id_register_skill = rs.id
    WHERE rs.id_camper = p_camper_id AND rs.id_skill_planned = p_module_id;
    
    RETURN IF(avg_grade >= 60, 'Aprobado', 'Reprobado');
END //
DELIMITER ;

SELECT camper_skill(1, 1);
-- 3. Evaluar el nivel de riesgo de un camper según su rendimiento promedio.
DELIMITER //
CREATE FUNCTION camper_risk_level(p_camper_id INT) RETURNS VARCHAR(15)
DETERMINISTIC
BEGIN
    DECLARE avg_grade DECIMAL(10,2);
    
    SELECT average_assesment_camper(p_camper_id) INTO avg_grade;
    
    RETURN CASE 
        WHEN avg_grade >= 75 THEN 'Bajo'
        WHEN avg_grade >= 65 THEN 'Medio'
        ELSE 'Alto'
    END;
END //
DELIMITER ;

SELECT camper_risk_level(1);
-- 4. Obtener el total de campers asignados a una ruta específica.
DELIMITER $$
CREATE FUNCTION campers_route(route_id INT) RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total_camper INT;
    
    SELECT COUNT(*) INTO total_camper
    FROM camper
    WHERE id_learning_route = route_id;
    
    RETURN total_camper;
END $$

DELIMITER ;

SELECT campers_route(1) AS 'Total Campers in Route 1';
-- 5. Consultar la cantidad de módulos que ha aprobado un camper.
DELIMITER //
CREATE FUNCTION modules_passed_by_camper(p_camper_id INT) RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE count_passed INT;
    
    SELECT COUNT(DISTINCT rs.id_skill_planned) INTO count_passed
    FROM final_grade fg
    JOIN register_skill rs ON fg.id_register_skill = rs.id
    WHERE rs.id_camper = p_camper_id AND fg.final_grade >= 7.0;
    
    RETURN count_passed;
END //
DELIMITER ;

SELECT modules_passed_by_camper(1);

-- 6. Validar si hay cupos disponibles en una determinada área.
DELIMITER //
CREATE FUNCTION availability_area(p_area_id INT) RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE available_seats INT;
    
    SELECT a.capacity - COUNT(DISTINCT gd.id_camper) INTO available_seats
    FROM area a
    LEFT JOIN schedule_trainer st ON a.id = st.area_id
    LEFT JOIN trainers t ON st.trainer_id = t.id
    LEFT JOIN group_campus gc ON t.id = gc.trainer_id
    LEFT JOIN group_details gd ON gc.id = gd.id_group
    WHERE a.id = p_area_id
    GROUP BY a.capacity;
    
    RETURN available_seats > 0;
END //
DELIMITER ;

SELECT availability_area(5);

-- 7. Calcular el porcentaje de ocupación de un área de entrenamiento.
DELIMITER //
CREATE FUNCTION occupancy_area(p_area_id INT) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE percentage DECIMAL(5,2);
    
    SELECT (COUNT(DISTINCT gd.id_camper) / NULLIF(a.capacity, 0)) * 100 
    INTO percentage
    FROM area a
    LEFT JOIN schedule_trainer st ON a.id = st.area_id
    LEFT JOIN trainers t ON st.trainer_id = t.id
    LEFT JOIN group_campus gc ON t.id = gc.trainer_id
    LEFT JOIN group_details gd ON gc.id = gd.id_group
    WHERE a.id = p_area_id
    GROUP BY a.capacity;
    
    RETURN IFNULL(percentage, 0);
END //
DELIMITER ;
SELECT occupancy_area(1);
-- 8. Determinar la nota más alta obtenida en un módulo.
DELIMITER //
CREATE FUNCTION highest_grade_in_skill(p_skill_id INT) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE highest DECIMAL(5,2);
    
    SELECT MAX(fg.final_grade) INTO highest
    FROM final_grade fg
    JOIN register_skill rs ON fg.id_register_skill = rs.id
    WHERE rs.id_skill_planned = p_skill_id;
    
    RETURN IFNULL(highest, 0);
END //
DELIMITER ;
SELECT highest_grade_in_skill(2);
-- 9. Calcular la tasa de aprobación de una ruta.
DELIMITER //
CREATE FUNCTION approval_rate_route(p_route_id INT) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE rate DECIMAL(5,2);
    
    SELECT (COUNT(DISTINCT rs.id_camper) / COUNT(DISTINCT c.id)) * 100 
    INTO rate
    FROM camper c
    JOIN register_skill rs ON c.id = rs.id_camper
    JOIN skill_planned sp ON rs.id_skill_planned = sp.id
    WHERE sp.id_route = p_route_id AND rs.id_camper IN (
        SELECT id_camper FROM final_grade WHERE final_grade >= 60
    );
    
    RETURN IFNULL(rate, 0);
END //
DELIMITER ;
SELECT approval_rate_route(1);

-- 10. Verificar si un trainer tiene horario disponible.
DELIMITER //
CREATE FUNCTION trainer_has_available_schedule(p_trainer_id INT) RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE count_schedules INT;
    
    SELECT COUNT(*) INTO count_schedules
    FROM schedule_trainer
    WHERE trainer_id = p_trainer_id;
    
    RETURN count_schedules = 0;
END //
DELIMITER ;
SELECT trainer_has_available_schedule(2);
-- 11. Obtener el promedio de notas por ruta.
DELIMITER $$
CREATE FUNCTION average_route(route_id INT) RETURNS FLOAT
DETERMINISTIC
BEGIN
    DECLARE avg_grade FLOAT;
    
    SELECT AVG(fg.final_grade) INTO avg_grade
    FROM final_grade fg
    JOIN register_skill rs ON fg.id_register_skill = rs.id
    JOIN skill_planned sp ON rs.id_skill_planned = sp.id
    WHERE sp.id_route = route_id;
    
    RETURN avg_grade;
END $$
DELIMITER ;
SELECT average_route(1) AS 'Average Grade in Route 1';
-- 12. Calcular cuántas rutas tiene asignadas un trainer.
DELIMITER $$
CREATE FUNCTION routes_trainer(trainer_id INT) RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total_routes INT;
    
    SELECT COUNT(DISTINCT lr.id) INTO total_routes
    FROM learning_route lr
    JOIN group_campus gc ON lr.id = gc.route_id
    WHERE gc.trainer_id = trainer_id;
    
    RETURN total_routes;
END $$
DELIMITER ;
SELECT routes_trainer(1) AS 'Total Routes for Trainer';
-- 13. Verificar si un camper puede ser graduado.
DELIMITER //
CREATE FUNCTION can_camper_graduate(p_camper_id INT) RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE completed_modules INT;
    DECLARE total_modules INT;
    
    -- Contar módulos aprobados por el camper
    SELECT COUNT(DISTINCT rs.id_skill_planned) INTO completed_modules
    FROM final_grade fg
    JOIN register_skill rs ON fg.id_register_skill = rs.id
    WHERE rs.id_camper = p_camper_id AND fg.final_grade >= 7.0;
    
    -- Contar módulos totales de su ruta
    SELECT COUNT(sp.id) INTO total_modules
    FROM camper c
    JOIN skill_planned sp ON c.id_learning_route = sp.id_route
    WHERE c.id = p_camper_id;
    
    RETURN completed_modules = total_modules;
END //
DELIMITER ;
SELECT can_camper_graduate(1) AS 'Can Camper Graduate';
-- 14. Obtener el estado actual de un camper en función de sus evaluaciones.
DELIMITER //
CREATE FUNCTION camper_status(p_camper_id INT) RETURNS VARCHAR(15)
DETERMINISTIC
BEGIN
    DECLARE avg_grade DECIMAL(5,2);
    
    SELECT average_assesment_camper(p_camper_id) INTO avg_grade;
    
    RETURN CASE 
        WHEN avg_grade >= 80 THEN 'Excelente'
        WHEN avg_grade >= 70 THEN 'Bueno'
        WHEN avg_grade >= 60 THEN 'Regular'
        ELSE 'Riesgo'
    END;
END //
DELIMITER ;
SELECT camper_status(1) AS 'Camper Status';

-- 15. Calcular la carga horaria semanal de un trainer.
DELIMITER //
CREATE FUNCTION weekly_hours_trainer(p_trainer_id INT) RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total_hours INT;
    
    SELECT SUM(TIMESTAMPDIFF(HOUR, s.start_time, s.end_time)) INTO total_hours
    FROM schedule_trainer st
    JOIN schedule s ON st.schedule_id = s.id
    WHERE st.trainer_id = p_trainer_id;
    
    RETURN IFNULL(total_hours, 0);
END //
DELIMITER ;
SELECT weekly_hours_trainer(1);
-- 16. Determinar si una ruta tiene módulos pendientes por evaluación.
DELIMITER //
CREATE FUNCTION skill_pending(p_route_id INT) RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE pending_count INT;
    
    SELECT COUNT(*) INTO pending_count
    FROM skill_planned sp
    LEFT JOIN register_skill rs ON sp.id = rs.id_skill_planned
    LEFT JOIN final_grade fg ON rs.id = fg.id_register_skill
    WHERE sp.id_route = p_route_id AND fg.final_grade IS NULL;
    
    RETURN pending_count > 0;
END //
DELIMITER ;

SELECT skill_pending(1);

-- 17. Calcular el promedio general del programa.
DELIMITER //
CREATE FUNCTION global_average() RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE avg_global DECIMAL(5,2);
    
    SELECT AVG(final_grade) INTO avg_global FROM final_grade;
    
    RETURN IFNULL(avg_global, 0);
END //
DELIMITER ;
SELECT global_average(); AS 'Global Average';

-- 18. Verificar si un horario choca con otros entrenadores en el área.
DELIMITER //
CREATE FUNCTION is_schedule_conflict(p_area_id INT, p_schedule_id INT) RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE count_conflicts INT;
    
    SELECT COUNT(*) INTO count_conflicts
    FROM schedule_trainer st
    WHERE st.area_id = p_area_id AND st.schedule_id = p_schedule_id;
    
    RETURN count_conflicts > 0;
END //
DELIMITER ;
SELECT is_schedule_conflict(1, 1);
-- 19. Calcular cuántos campers están en riesgo en una ruta específica.
DELIMITER $$
CREATE FUNCTION risk_camper(route_id INT) RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE Camper_High_Risk_Level INT;

    SELECT COUNT(c.id) INTO Camper_High_Risk_Level
    FROM camper c
    JOIN risk_level rl ON c.id_risk_level = rl.id
    WHERE c.id_learning_route = route_id AND rl.type_level = 'Alto';
    
    RETURN Camper_High_Risk_Level;
END $$

DELIMITER ;
SELECT risk_camper(1) AS 'Total High Risk Campers in Route';

-- 20. Consultar el número de módulos evaluados por un camper.
DELIMITER //
CREATE FUNCTION evaluated_skills(p_camper_id INT) RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE skill_count INT;
    
    SELECT COUNT(DISTINCT rs.id_skill_planned) INTO skill_count
    FROM final_grade fg
    JOIN register_skill rs ON fg.id_register_skill = rs.id
    WHERE rs.id_camper = p_camper_id;
    
    RETURN IFNULL(skill_count, 0);
END //
DELIMITER ;
SELECT evaluated_skills(2) AS 'Total Skills Evaluated';
