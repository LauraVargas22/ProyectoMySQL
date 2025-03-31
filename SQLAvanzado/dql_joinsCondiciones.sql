-- 1. Listar los campers que han aprobado todos los módulos de su ruta (nota_final >= 60).
SELECT c.name AS Camper_Name, c.surname AS Camper_Surname, lr.description AS Learning_Route
FROM camper c
JOIN learning_route lr ON c.id_learning_route = lr.id
JOIN register_skill rs ON c.id = rs.id_camper
JOIN final_grade fg ON rs.id = fg.id_register_skill
JOIN skill_planned sp ON lr.id = sp.id_route
GROUP BY c.id, c.name, c.surname, lr.description
HAVING COUNT(DISTINCT CASE WHEN fg.final_grade >= 60 THEN sp.id END) = COUNT(DISTINCT sp.id);

-- 2. Mostrar las rutas que tienen más de 10 campers inscritos actualmente.
SELECT lr.description AS Learning_Route, COUNT(c.id_learning_route) AS Campers_Route
FROM learning_route lr
JOIN camper c ON lr.id = c.id_learning_route
GROUP BY lr.description
HAVING COUNT(c.id_learning_route) > 10;
-- 3. Consultar las áreas que superan el 80% de su capacidad con el número actual de campers asignados.
SELECT a.name AS Area, COUNT(c.id) AS Current_Campers, a.capacity AS Area_Capacity, (COUNT(DISTINCT gd.id_camper) / a.capacity) * 100 AS Occupancy_Percentage, gc.name AS Group_Campus
FROM area a
JOIN schedule_trainer st ON a.id = st.area_id
JOIN trainers t ON st.trainer_id = t.id 
JOIN group_campus gc ON t.id = gc.trainer_id
JOIN group_details gd ON gc.id = gd.id_group
JOIN camper c ON gd.id_camper = c.id
GROUP BY a.name, a.capacity, gc.name
HAVING (COUNT(c.id) / a.capacity) * 100 > 80;
-- 4. Obtener los trainers que imparten más de una ruta diferente.
SELECT t.name AS Trainer_Name, t.surname AS Trainer_Surname, COUNT(DISTINCT lr.id) AS Route_Count
FROM trainers t
JOIN group_campus gc ON t.id = gc.trainer_id
JOIN learning_route lr ON gc.route_id = lr.id
GROUP BY t.id, t.name, t.surname
HAVING COUNT(DISTINCT lr.id) > 1;

-- 5. Listar las evaluaciones donde la nota práctica es mayor que la nota teórica.
SELECT c.name AS Camper_Name, c.surname AS Camper_Surname, g.grade AS Practical_Grade, g2.grade AS Theorical_Grade, a.description AS Practical_Assesment, a2.description AS Theorical_Assesment
FROM camper c
JOIN register_skill rs ON c.id = rs.id_camper
JOIN grades g ON rs.id = g.id_register_skill
JOIN grades g2 ON rs.id = g2.id_register_skill
JOIN assesment a ON g.id_assesment = a.id
JOIN assesment a2 ON g2.id_assesment = a2.id
WHERE a.id_assesment_type = 2
AND a2.id_assesment_type = 1
AND g.grade > g2.grade;

-- 6. Mostrar campers que están en rutas cuyo SGDB principal es MySQL.
SELECT c.name AS Camper_Name, c.surname AS Camper_Surname, lr.description, db.description AS Main_SGDB
FROM camper c
JOIN learning_route lr ON c.id_learning_route = lr.id
JOIN sgdb_route sr ON lr.id = sr.id_route
JOIN data_base db ON sr.id_Main_SGBD = db.id
WHERE c.id_learning_route = 2;
-- 7. Obtener los nombres de los módulos donde los campers han tenido bajo rendimiento.
SELECT DISTINCT s.name AS Skill_Low_Performance
FROM skill s
JOIN skill_planned sp ON s.id = sp.id_skill
JOIN register_skill rs ON sp.id = rs.id_skill_planned
JOIN final_grade fg ON rs.id = fg.id_register_skill
WHERE fg.final_grade < 60;
-- 8. Consultar las rutas con más de 3 módulos asociados.
SELECT lr.description AS Learning_Route, COUNT(lr.id) AS Skills_Route
FROM learning_route lr
JOIN skill_planned sp ON lr.id = sp.id_route
GROUP BY lr.description
HAVING COUNT(lr.id) > 3;
-- 9. Listar las inscripciones realizadas en los últimos 30 días con sus respectivos campers y rutas.
SELECT c.date_registration, c.name AS Camper_Name, c.surname AS Camper_Surname, lr.description AS Learning_Route
FROM camper c
JOIN learning_route lr ON c.id_learning_route = lr.id
WHERE c.date_registration >= DATE_SUB(NOW(), INTERVAL 30 DAY);
-- 10. Obtener los trainers que están asignados a rutas con campers en estado de “Alto Riesgo”.
SELECT DISTINCT t.name AS Trainer_Name, t.surname AS Trainer_Surname, rl.type_level AS Risk_Level_Camper
FROM trainers t 
JOIN group_campus gc ON t.id = gc.trainer_id
JOIN group_details gd ON gc.id = gd.id_group
JOIN camper c ON gd.id_camper = c.id
JOIN risk_level rl ON c.id_risk_level = rl.id
WHERE c.id_risk_level = 1;
