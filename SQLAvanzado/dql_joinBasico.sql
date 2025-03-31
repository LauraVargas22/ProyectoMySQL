-- 1. Obtener los nombres completos de los campers junto con el nombre de la ruta a la que están inscritos.
SELECT c.name AS Camper_Name, c.surname AS Camper_Surname, lr.description AS Learning_Route
FROM camper c
JOIN learning_route lr ON c.id_learning_route = lr.id;
-- 2. Mostrar los campers con sus evaluaciones (nota teórica, práctica, quizzes y nota final) por cada módulo.
SELECT c.name AS Camper_Name, c.surname AS Camper_Surname, g.grade, s.name AS Skill
FROM register_skill rs
JOIN camper c ON rs.id_camper = c.id 
JOIN skill_planned sp ON rs.id_skill_planned = sp.id 
JOIN skill s ON sp.id_skill = s.id 
JOIN grades g ON rs.id = g.id_register_skill
GROUP BY c.name, c.surname, g.grade, s.name;
-- 3. Listar todos los módulos que componen cada ruta de entrenamiento.
SELECT s.name AS Skill, lr.description AS Learning_Route
FROM learning_route lr 
JOIN skill_planned sp ON lr.id = sp.id_route
JOIN skill s ON sp.id_skill = s.id
GROUP BY s.name, lr.description;
-- 4. Consultar las rutas con sus trainers asignados y las áreas en las que imparten clases.
SELECT lr.description AS LEARNING_ROUTE, t.name AS NAME_TRAINER, t.surname AS SURNAME_TRAINER, a.name AS AREA
FROM learning_route lr
JOIN group_campus gc ON lr.id = gc.route_id
JOIN trainers t ON gc.trainer_id = t.id
JOIN schedule_trainer st ON t.id = st.trainer_id
JOIN area a ON st.area_id = a.id;
-- 5. Mostrar los campers junto con el trainer responsable de su ruta actual.
SELECT c.name AS Name_Camper, c.surname AS Surname_Camper, t.name AS Name_Trainer, t.surname AS Surname_Trainer, lr.description AS Learning_Route
FROM camper c 
JOIN learning_route lr ON c.id_learning_route = lr.id
JOIN group_campus gc ON lr.id = gc.route_id
JOIN trainers t ON gc.trainer_id = t.id
GROUP BY c.name, c.surname, t.name, t.surname, lr.description;
-- 6. Obtener el listado de evaluaciones realizadas con nombre de camper, módulo y ruta.
        SELECT c.name AS Name_Camper, c.surname AS Surname_Camper, s.name AS Skill, lr.description AS Learning_Route, as.assesment AS Assesment
        FROM camper c 
        JOIN learning_route lr ON c.id_learning_route = lr.id
        JOIN skill_planned sp ON lr.id = sp.id_route
        JOIN skill s ON sp.id_skill = s.id
        JOIN assesment as ON sp.id = as.id_skill_planned;
-- 7. Listar los trainers y los horarios en que están asignados a las áreas de entrenamiento.
SELECT t.name, t.surname, s.start_time AS START_CLASS, s.end_time AS END_CLASS, s.time_slot AS TIME_SLOT, a.name AS Classromm
FROM trainers t
JOIN schedule_trainer st ON t.id = st.trainer_id
JOIN schedule s ON st.schedule_id = s.id
JOIN area a ON st.area_id = a.id;
-- 8. Consultar todos los campers junto con su estado actual y el nivel de riesgo.
SELECT c.name AS Name_Camper, c.surname AS Surname_Camper, sc.type_state AS Camper_State, rl.type_level AS Risk_Level
FROM camper c 
LEFT JOIN state_camper sc ON c.id_state_camper = sc.id
LEFT JOIN risk_level rl ON c.id_risk_level = rl.id;
-- 9. Obtener todos los módulos de cada ruta junto con su porcentaje teórico, práctico y de quizzes.
-- 10. Mostrar los nombres de las áreas junto con los nombres de los campers que están asistiendo en esos espacios.
