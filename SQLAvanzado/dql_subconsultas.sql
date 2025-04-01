-- 1. Obtener los campers con la nota más alta en cada módulo.
SELECT c.name AS Camper_Name, c.surname AS Camper_Surname, fg.final_grade, s.name AS Skill
FROM camper c
JOIN learning_route lr ON c.id_learning_route = lr.id
JOIN skill_planned sp ON lr.id = sp.id_route
JOIN skill s ON sp.id_skill = s.id
JOIN register_skill rs ON sp.id = rs.id_skill_planned
JOIN final_grade fg ON rs.id = fg.id_register_skill
WHERE (s.id, fg.final_grade) IN (
    SELECT s.id, MAX(fg.final_grade)
    FROM camper c
    JOIN learning_route lr ON c.id_learning_route = lr.id
    JOIN skill_planned sp ON lr.id = sp.id_route
    JOIN skill s ON sp.id_skill = s.id
    JOIN register_skill rs ON sp.id = rs.id_skill_planned
    JOIN final_grade fg ON rs.id = fg.id_register_skill
    GROUP BY s.id
);
-- 2. Mostrar el promedio general de notas por ruta y comparar con el promedio global.
-- 3. Listar las áreas con más del 80% de ocupación.
SELECT a.name AS Area, COUNT(c.id) AS Current_Campers, a.capacity AS Area_Capacity, (COUNT(DISTINCT gd.id_camper) / a.capacity) * 100 AS Occupancy_Percentage, gc.name AS Group_Campus
FROM area a
JOIN schedule_trainer st ON a.id = st.area_id
JOIN trainers t ON st.trainer_id = t.id 
JOIN group_campus gc ON t.id = gc.trainer_id
JOIN group_details gd ON gc.id = gd.id_group
JOIN camper c ON gd.id_camper = c.id
GROUP BY a.name, a.capacity, gc.name
HAVING (COUNT(c.id) / a.capacity) * 100 > 80;
-- 4. Mostrar los trainers con menos del 70% de rendimiento promedio.
SELECT t.name AS Trainer_Name, t.surname AS Trainer_Surname, 
-- 5. Consultar los campers cuyo promedio está por debajo del promedio general.
-- 6. Obtener los módulos con la menor tasa de aprobación.
-- 7. Listar los campers que han aprobado todos los módulos de su ruta.
-- 8. Mostrar rutas con más de 10 campers en bajo rendimiento.
-- 9. Calcular el promedio de rendimiento por SGDB principal.
-- 10. Listar los módulos con al menos un 30% de campers reprobados.
-- 11. Mostrar el módulo más cursado por campers con riesgo alto.
-- 12. Consultar los trainers con más de 3 rutas asignadas.
-- 13. Listar los horarios más ocupados por áreas.
-- 14. Consultar las rutas con el mayor número de módulos.

SELECT COUNT(s.id) AS Skills_Route, lr.description AS LEARNING_ROUTE
FROM learning_route lr
JOIN skill_planned sp ON lr.id = sp.id_route
JOIN skill s ON sp.id_skill = s.id
WHERE (lr.id, COUNT(s.id)) IN (
    SELECT lr.id, MAX(s.id)
    FROM learning_route lr
    JOIN skill_planned sp ON lr.id = sp.id_route
    JOIN skill s ON sp.id_skill = s.id
);
-- 15. Obtener los campers que han cambiado de estado más de una vez.
-- 16. Mostrar las evaluaciones donde la nota teórica sea mayor a la práctica.
-- 17. Listar los módulos donde la media de quizzes supera el 9.
-- 18. Consultar la ruta con mayor tasa de graduación.
-- 19. Mostrar los módulos cursados por campers de nivel de riesgo medio o alto.
-- 20. Obtener la diferencia entre capacidad y ocupación en cada área.