-- 1. Mostrar todas las rutas de entrenamiento disponibles.
SELECT description AS LEARNING_ROUTE
FROM learning_route;
-- 2. Obtener las rutas con su SGDB principal y alternativo.
SELECT lr.description, db.description AS Main_SGBD, dt.description AS Second_SGBD
FROM learning_route lr 
JOIN sgdb_route sr ON lr.id = sr.id_route
JOIN data_base db ON sr.id_Main_SGBD = db.id
JOIN data_base dt ON sr.id_Second_SGBD = dt.id;
-- 3. Listar los módulos asociados a cada ruta.
SELECT s.name AS SKILL, lr.description AS LEARNING_ROUTE
FROM learning_route lr
JOIN skill_planned sp ON lr.id = sp.id_route
JOIN skill s ON sp.id_skill = s.id
ORDER BY lr.description, s.name ASC;
-- 4. Consultar cuántos campers hay en cada ruta.
SELECT COUNT(c.id) AS Campers_Route, lr.description AS LEARNING_ROUTE
FROM learning_route lr 
JOIN camper c ON lr.id = c.id_learning_route
GROUP BY lr.description;
-- 5. Mostrar las áreas de entrenamiento y su capacidad máxima.
SELECT name, capacity
FROM area;
-- 6. Obtener las áreas que están ocupadas al 100%.
SELECT a.name AS Area_Name, a.capacity AS Capacity_Area, COUNT(gd.id_camper) AS Number_Group_Campers
FROM area a
JOIN schedule_trainer st ON a.id = st.area_id
JOIN trainers t ON st.trainer_id = t.id
JOIN group_campus gc ON t.id = gc.trainer_id
JOIN group_details gd ON gc.id = gd.id_group
GROUP BY a.id, a.name, a.capacity
HAVING COUNT(gd.id_camper) = a.capacity;
-- 7. Verificar la ocupación actual de cada área
SELECT a.name AS Area_Name, COUNT(gd.id_camper) AS Currently_Occupied
FROM area a
JOIN schedule_trainer st ON a.id = st.area_id
JOIN trainers t ON st.trainer_id = t.id
JOIN group_campus gc ON t.id = gc.trainer_id
LEFT JOIN group_details gd ON gc.id = gd.id_group
GROUP BY a.id, a.name, a.capacity
ORDER BY Currently_Occupied DESC;

-- 8. Consultar los horarios disponibles por cada área.
-- 9. Mostrar las áreas con más campers asignados.
SELECT a.name AS AREA, COUNT(gd.id_camper) AS total_campers
FROM group_details gd
JOIN group_campus gc ON gd.id_group = gc.id
JOIN trainers t ON gc.trainer_id = t.id
JOIN schedule_trainer st ON t.id = st.trainer_id
JOIN area a ON st.area_id = a.id
GROUP BY a.name
ORDER BY total_campers DESC
LIMIT 3;

-- 10. Listar las rutas con sus respectivos trainers y áreas asignadas.
SELECT lr.description AS LEARNING_ROUTE, t.name AS NAME_TRAINER, t.surname AS SURNAME_TRAINER, a.name AS AREA
FROM learning_route lr
JOIN group_campus gc ON lr.id = gc.route_id
JOIN trainers t ON gc.trainer_id = t.id
JOIN schedule_trainer st ON t.id = st.trainer_id
JOIN area a ON st.area_id = a.id;