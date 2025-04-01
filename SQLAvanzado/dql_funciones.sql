-- 1. Calcular el promedio ponderado de evaluaciones de un camper.
-- 2. Determinar si un camper aprueba o no un módulo específico.
-- 3. Evaluar el nivel de riesgo de un camper según su rendimiento promedio.
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
-- 6. Validar si hay cupos disponibles en una determinada área.
-- 7. Calcular el porcentaje de ocupación de un área de entrenamiento.
-- 8. Determinar la nota más alta obtenida en un módulo.
-- 9. Calcular la tasa de aprobación de una ruta.
-- 10. Verificar si un trainer tiene horario disponible.
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
-- 14. Obtener el estado actual de un camper en función de sus evaluaciones.
-- 15. Calcular la carga horaria semanal de un trainer.
-- 16. Determinar si una ruta tiene módulos pendientes por evaluación.
-- 17. Calcular el promedio general del programa.
-- 18. Verificar si un horario choca con otros entrenadores en el área.
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