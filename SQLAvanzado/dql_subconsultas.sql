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
SELECT lr.description AS Learning_Route, AVG(fg.final_grade) AS Average_Final_Grade, (SELECT AVG(fg.final_grade) FROM final_grade fg) AS Global_Average
FROM learning_route lr
JOIN skill_planned sp ON lr.id = sp.id_route
JOIN register_skill rs ON sp.id = rs.id_skill_planned
JOIN final_grade fg ON rs.id = fg.id_register_skill
GROUP BY lr.id, lr.description;
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
SELECT t.name AS Trainer_Name, t.surname AS Trainer_Surname, AVG(fg.final_grade) AS Average_Performance
FROM trainers t
JOIN group_campus gc ON t.id = trainer_id
JOIN learning_route lr ON gc.route_id = lr.id
JOIN skill_planned sp ON lr.id = sp.id_route
JOIN register_skill rs ON sp.id = rs.id_skill_planned
JOIN final_grade fg ON rs.id = fg.id_register_skill
GROUP BY t.name, t.surname
HAVING AVG(fg.final_grade) < 70;
-- 5. Consultar los campers cuyo promedio está por debajo del promedio general.
SELECT c.name AS Camper_Name, c.surname AS Camper_Surname, AVG(fg.final_grade) AS Average_Final_Grade,  (SELECT AVG(fg.final_grade) FROM final_grade fg) AS Global_Average
FROM camper c 
JOIN register_skill rs ON c.id = rs.id_camper
JOIN final_grade fg ON rs.id = fg.id_register_skill
GROUP BY c.name, c.surname
HAVING AVG(fg.final_grade) < (SELECT AVG(fg.final_grade) FROM final_grade fg);

-- 6. Obtener los módulos con la menor tasa de aprobación.
SELECT s.name AS Skill, COUNT(rs.id) AS total_campers,
    SUM(fg.final_grade > 60) AS Pass_Mark,
    (SUM(fg.final_grade > 60)/COUNT(rs.id) *100) AS Approval_Rate
FROM skill s
JOIN skill_planned sp ON s.id = sp.id_skill
JOIN register_skill rs ON sp.id = rs.id_skill_planned
JOIN final_grade fg ON rs.id = fg.id_register_skill
GROUP BY s.name
ORDER BY Approval_Rate ASC;
-- 7. Listar los campers que han aprobado todos los módulos de su ruta.

-- 8. Mostrar rutas con más de 10 campers en bajo rendimiento.
SELECT lr.description AS Learning_Route, COUNT(c.id) AS Campers_Low_Performance
FROM learning_route lr
JOIN camper c ON lr.id = c.id_learning_route
JOIN register_skill rs ON c.id = rs.id_camper
JOIN final_grade fg ON rs.id = fg.id_register_skill
WHERE final_grade < 60
GROUP BY lr.description
HAVING COUNT(c.id) > 10
ORDER BY Campers_Low_Performance DESC;
-- 9. Calcular el promedio de rendimiento por SGDB principal.
SELECT db.description AS Main_SGDB, AVG(fg.final_grade) AS Average_Performace
FROM data_base db
JOIN sgdb_route sr ON db.id = sr.id_Main_SGBD
JOIN learning_route lr ON sr.id_route = lr.id
JOIN skill_planned sp ON lr.id = sp.id_route
JOIN register_skill rs ON sp.id = rs.id_skill_planned
JOIN final_grade fg ON rs.id = fg.id_register_skill
GROUP BY db.description;
-- 10. Listar los módulos con al menos un 30% de campers reprobados.
SELECT s.name AS Skill, COUNT(rs.id) AS total_campers,
    SUM(fg.final_grade < 60) AS Failed,
    (SUM(fg.final_grade < 60)/COUNT(rs.id) *100) AS Failed_Percentage
FROM skill s
JOIN skill_planned sp ON s.id = sp.id_skill
JOIN register_skill rs ON sp.id = rs.id_skill_planned
JOIN final_grade fg ON rs.id = fg.id_register_skill
GROUP BY s.name
HAVING Failed_Percentage >= 30
ORDER BY Failed_Percentage DESC;
-- 11. Mostrar el módulo más cursado por campers con riesgo alto.
SELECT s.name AS Skill, COUNT(rs.id) AS Campers_High_Risk_Level
FROM skill s
JOIN skill_planned sp ON s.id = sp.id_skill
JOIN register_skill rs ON sp.id = rs.id_skill_planned
JOIN camper c ON rs.id_camper = c.id
JOIN risk_level rl ON c.id_risk_level = rl.id
WHERE rl.type_level = 'Alto'
GROUP BY s.name
ORDER BY Campers_High_Risk_Level DESC
LIMIT 1;
-- 12. Consultar los trainers con más de 3 rutas asignadas.
SELECT t.name AS Trainer_Name, t.surname AS Trainer_Surname, COUNT(DISTINCT gc.route_id) AS Routes_Trainer
FROM trainers t
JOIN group_campus gc ON t.id = gc.trainer_id
GROUP BY t.name, t.surname
HAVING COUNT(DISTINCT gc.route_id) > 3
ORDER BY Routes_Trainer DESC;
-- 13. Listar los horarios más ocupados por áreas.

-- 14. Consultar las rutas con el mayor número de módulos.
SELECT lr.description AS LEARNING_ROUTE, 
       COUNT(s.id) AS Skills_Route
FROM learning_route lr
JOIN skill_planned sp ON lr.id = sp.id_route
JOIN skill s ON sp.id_skill = s.id
GROUP BY lr.id, lr.description
HAVING COUNT(s.id) = (
    SELECT MAX(skill_count)
    FROM (
        SELECT lr.id AS route_id, COUNT(s.id) AS skill_count
        FROM learning_route lr
        JOIN skill_planned sp ON lr.id = sp.id_route
        JOIN skill s ON sp.id_skill = s.id
        GROUP BY lr.id
    ) AS subquery
);

-- 15. Obtener los campers que han cambiado de estado más de una vez.
SELECT c.name AS Camper_Name, c.surname AS Camper_Surname,COUNT(ch.id) AS Changes_State_Camper
FROM camper c
JOIN camper_history ch ON c.id = ch.id_camper
GROUP BY c.name, c.surname
HAVING COUNT(ch.id) > 1
ORDER BY Changes_State_Camper DESC;
-- 16. Mostrar las evaluaciones donde la nota teórica sea mayor a la práctica.
SELECT c.name AS Camper_Name, c.surname AS Camper_Surname, g.grade AS Practical_Grade, g2.grade AS Theorical_Grade, a.description AS Practical_Assesment, a2.description AS Theorical_Assesment
FROM camper c
JOIN register_skill rs ON c.id = rs.id_camper
JOIN grades g ON rs.id = g.id_register_skill
JOIN grades g2 ON rs.id = g2.id_register_skill
JOIN assesment a ON g.id_assesment = a.id
JOIN assesment a2 ON g2.id_assesment = a2.id
WHERE a.id_assesment_type = 2
AND a2.id_assesment_type = 1
AND g2.grade > g.grade;

-- 17. Listar los módulos donde la media de quizzes supera el 9.


-- 18. Consultar la ruta con mayor tasa de graduación.
SELECT 
    lr.description AS Learning_Route,
    COUNT(DISTINCT c.id) AS Campers,
    COUNT(DISTINCT g.id_camper) AS Graduates,
    (COUNT(DISTINCT g.id_camper) / COUNT(DISTINCT c.id) * 100) AS Graduation_Rate
FROM learning_route lr
JOIN camper c ON lr.id = c.id_learning_route
LEFT JOIN graduates g ON c.id = g.id_camper
GROUP BY lr.id, lr.description
ORDER BY Graduation_Rate DESC
LIMIT 1;

-- 19. Mostrar los módulos cursados por campers de nivel de riesgo medio o alto.
SELECT s.name AS Skill, rl.type_level AS nivel_riesgo, COUNT(DISTINCT c.id) AS Campers
FROM skill s
JOIN skill_planned sp ON s.id = sp.id_skill
JOIN register_skill rs ON sp.id = rs.id_skill_planned
JOIN camper c ON rs.id_camper = c.id
JOIN risk_level rl ON c.id_risk_level = rl.id
WHERE rl.type_level = 'Medio' OR rl.type_level = 'Alto'
GROUP BY s.id, s.name, rl.type_level
ORDER BY Campers DESC;
-- 20. Obtener la diferencia entre capacidad y ocupación en cada área.
