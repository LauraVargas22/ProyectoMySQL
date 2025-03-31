-- 1. Obtener el promedio de nota final por módulo.
SELECT s.name AS Skill, AVG(fg.final_grade) AS Average_Final_Grade
FROM skill s
JOIN skill_planned sp ON s.id = sp.id_skill
JOIN register_skill rs ON sp.id = rs.id_skill_planned
JOIN final_grade fg ON rs.id = fg.id_register_skill
GROUP BY s.name;

-- 2. Calcular la cantidad total de campers por ruta.
SELECT COUNT(c.id) AS Campers_Route, lr.description AS LEARNING_ROUTE
FROM learning_route lr 
JOIN camper c ON lr.id = c.id_learning_route
GROUP BY lr.description;

-- 3. Mostrar la cantidad de evaluaciones realizadas por cada trainer (según las rutas que imparte).
SELECT t.name AS Trainer_Name, t.surname AS Trainer_Surname, COUNT(a.id) AS Assesment_Trainer
FROM trainers t
JOIN group_campus gc ON t.id = gc.trainer_id
JOIN learning_route lr ON gc.route_id = lr.id
JOIN skill_planned sp ON lr.id = sp.id_route
JOIN assesment a ON sp.id = a.id_skill_planned
GROUP BY t.name, t.surname;

-- 4. Consultar el promedio general de rendimiento por cada área de entrenamiento.
SELECT a.name AS Area, AVG(fg.final_grade) AS Average_Area
FROM area a
JOIN schedule_trainer st ON a.id = st.area_id
JOIN trainers t ON st.trainer_id = t.id
JOIN group_campus gc ON t.id = gc.trainer_id
JOIN learning_route lr ON gc.route_id = lr.id
JOIN skill_planned sp ON lr.id = sp.id_route
JOIN register_skill rs ON sp.id = rs.id_skill_planned
JOIN final_grade fg ON rs.id = fg.id_register_skill
GROUP BY a.name
ORDER BY Average_Area DESC;

-- 5. Obtener la cantidad de módulos asociados a cada ruta de entrenamiento.
SELECT COUNT(s.id) AS Skills_Route, lr.description AS LEARNING_ROUTE
FROM learning_route lr
JOIN skill_planned sp ON lr.id = sp.id_route
JOIN skill s ON sp.id_skill = s.id
GROUP BY lr.description
ORDER BY Skills_Route ASC;

-- 6. Mostrar el promedio de nota final de los campers en estado “Cursando”.
SELECT AVG(fg.final_grade) AS Average_Campers
FROM camper c
JOIN register_skill rs ON c.id = rs.id_camper
JOIN final_grade fg ON rs.id = fg.id_register_skill
JOIN state_camper sc ON c.id_state_camper = sc.id
WHERE sc.type_state = 'Cursando';

-- 7. Listar el número de campers evaluados en cada módulo.
SELECT COUNT(rs.id_camper) AS Campers_Evaluated, s.name AS Skill
FROM skill s
JOIN skill_planned sp ON s.id = sp.id_skill
JOIN register_skill rs ON sp.id = rs.id_skill_planned
JOIN final_grade fg ON rs.id = fg.id_register_skill
GROUP BY s.name;

-- 8. Consultar el porcentaje de ocupación actual por cada área de entrenamiento.
SELECT a.name AS Area, COUNT(c.id) AS Current_Campers, a.capacity AS Area_Capacity, ((COUNT(DISTINCT gd.id_camper) * 100) / a.capacity) AS Occupancy_Percentage, gc.name AS Group_Campus
FROM area a
JOIN schedule_trainer st ON a.id = st.area_id
JOIN trainers t ON st.trainer_id = t.id 
JOIN group_campus gc ON t.id = gc.trainer_id
JOIN group_details gd ON gc.id = gd.id_group
JOIN camper c ON gd.id_camper = c.id
GROUP BY a.name, a.capacity, gc.name
HAVING ((COUNT(c.id) * 100) / a.capacity);

-- 9. Mostrar cuántos trainers tiene asignados cada área.
SELECT COUNT(DISTINCT st.trainer_id) Trainers_Area, a.name
FROM area a
JOIN schedule_trainer st ON a.id = st.area_id
GROUP BY a.name;

-- 10. Listar las rutas que tienen más campers en riesgo alto.
SELECT lr.description AS Learning_Route, COUNT(c.id) AS Campers
FROM learning_route lr
JOIN camper c ON lr.id = c.id_learning_route
WHERE c.id_state_camper = 1
GROUP BY lr.description
ORDER BY Campers DESC
LIMIT 2;