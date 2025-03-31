-- 1. Listar todos los entrenadores registrados.
SELECT name AS NAME_TRAINER, surname AS SURNAME_TRAINER
FROM trainers;

-- 2. Mostrar los trainers con sus horarios asignados.
SELECT t.name, t.surname, s.start_time AS START_CLASS, s.end_time AS END_CLASS, s.time_slot AS TIME_SLOT
FROM trainers t
JOIN schedule_trainer st ON t.id = st.trainer_id
JOIN schedule s ON st.schedule_id = s.id;

-- 3. Consultar los trainers asignados a más de una ruta.
SELECT t.name AS Trainer_Name, t.surname AS Trainer_Surname, COUNT(DISTINCT lr.id) AS Teach_Route
FROM trainers t
JOIN group_campus gc ON t.id = gc.trainer_id
JOIN learning_route lr ON gc.route_id = lr.id
GROUP BY t.id, t.name, t.surname
HAVING COUNT(DISTINCT lr.id) > 1;

-- 4. Obtener el número de campers por trainer.
SELECT COUNT(gd.id_camper) AS Campers_Por_Trainer, t.name AS Trainer_Name, t.surname AS Trainer_Surname
FROM group_details gd
JOIN group_campus gc ON gd.id_group = gc.id
JOIN trainers t ON gc.trainer_id = t.id
GROUP BY t.id, t.name, t.surname;
-- 5. Mostrar las áreas en las que trabaja cada trainer.
SELECT t.name AS Trainer_Name, t.surname AS Trainer_Surname, a.name AS Area_Trainer
FROM trainers t
JOIN schedule_trainer st ON t.id = st.trainer_id
JOIN area a ON st.area_id = a.id;

-- 6. Listar los trainers sin asignación de área o ruta.
SELECT t.name AS Trainer_Name, t.surname AS Trainer_Surname
FROM trainers t
LEFT JOIN group_campus gc ON t.id = gc.trainer_id
LEFT JOIN schedule_trainer st ON t.id = st.trainer_id
WHERE gc.route_id IS NULL AND st.area_id IS NULL;

-- 7. Mostrar cuántos módulos están a cargo de cada trainer.
SELECT COUNT(sp.id_skill) AS Skills_Trainer, t.name AS Trainer_Name, t.surname AS Trainer_Surname
FROM trainers t
JOIN group_campus gc ON t.id = gc.trainer_id
JOIN learning_route lr ON gc.route_id = lr.id
JOIN skill_planned sp ON lr.id = sp.id_route
GROUP BY t.id, t.name, t.surname;
-- 8. Obtener el trainer con mejor rendimiento promedio de campers.
SELECT AVG(fg.final_grade) AS Average_Campers, t.name AS Trainer_Name, t.surname AS Trainer_Surname
FROM trainers t
JOIN group_campus gc ON t.id = gc.trainer_id
JOIN learning_route lr ON gc.route_id = lr.id
JOIN skill_planned sp ON lr.id = sp.id_route
JOIN register_skill rs ON sp.id = rs.id_skill_planned
JOIN final_grade fg ON rs.id = fg.id_register_skill
GROUP BY t.name, t.surname
ORDER BY Average_Campers DESC;
-- 9. Consultar los horarios ocupados por cada trainer.
SELECT t.name AS Trainer_Name, t.surname AS Trainer_Surname, s.start_time AS Start_Class, s.end_time AS End_Class
FROM trainers t
JOIN schedule_trainer st ON t.id = st.trainer_id
JOIN schedule s ON st.schedule_id = s.id
ORDER BY t.name, t.surname ASC;
-- 10. Mostrar la disponibilidad semanal de cada trainer.

