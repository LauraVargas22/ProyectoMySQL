-- 1. Obtener las notas teóricas, prácticas y quizzes de cada camper por módulo.
SELECT c.name AS Camper_Name, c.surname AS Camper_Surname, g.grade, s.name AS Skill
FROM register_skill rs
JOIN camper c ON rs.id_camper = c.id 
JOIN skill_planned sp ON rs.id_skill_planned = sp.id 
JOIN skill s ON sp.id_skill = s.id 
JOIN grades g ON rs.id = g.id_register_skill
GROUP BY c.name, c.surname, g.grade, s.name;
-- 2. Calcular la nota final de cada camper por módulo.
SELECT 
    c.name AS Camper_Name, 
    c.surname AS Camper_Surname, 
    g.grade AS Theorical_Grade, 
    g2.grade AS Practical_Grade, 
    g3.grade AS Quiz_Grade, 
    s.name AS Skill,
    (g.grade * 0.3 + g2.grade * 0.6 + g3.grade * 0.1) AS Final_Grade
FROM register_skill rs
JOIN camper c ON rs.id_camper = c.id
JOIN skill_planned sp ON rs.id_skill_planned = sp.id
JOIN skill s ON sp.id_skill = s.id
JOIN assesment a1 ON sp.id = a1.id_skill_planned AND a1.id_assesment_type = 1  -- Teórica
JOIN assesment a2 ON sp.id = a2.id_skill_planned AND a2.id_assesment_type = 2  -- Práctica
JOIN assesment a3 ON sp.id = a3.id_skill_planned AND a3.id_assesment_type = 3  -- Quizzes
JOIN grades g ON rs.id = g.id_register_skill AND g.id_assesment = a1.id
JOIN grades g2 ON rs.id = g2.id_register_skill AND g2.id_assesment = a2.id
JOIN grades g3 ON rs.id = g3.id_register_skill AND g3.id_assesment = a3.id
GROUP BY c.name, c.surname, g.grade, g2.grade, g3.grade, s.name
ORDER BY Final_Grade DESC;

-- 3. Mostrar los campers que reprobaron algún módulo (nota < 60).
SELECT c.name AS Camper_Name, c.surname AS Camper_Surname, fg.final_grade, s.name
FROM camper c
JOIN register_skill rs ON c.id = rs.id_camper
JOIN skill_planned sp ON rs.id_skill_planned = sp.id
JOIN skill s ON sp.id_skill = s.id
JOIN final_grade fg ON rs.id = fg.id_register_skill
WHERE fg.final_grade < 60;
-- 4. Listar los módulos con más campers en bajo rendimiento.
SELECT s.name AS Skill, COUNT(rs.id_camper) AS Campers_Low_Performance
FROM skill_planned sp 
JOIN skill s ON sp.id_skill = s.id
JOIN register_skill rs ON sp.id = rs.id_skill_planned
JOIN final_grade fg ON rs.id = fg.id_register_skill
WHERE fg.final_grade < 60
GROUP BY s.name
ORDER BY Campers_Low_Performance DESC;

-- 5. Obtener el promedio de notas finales por cada módulo.
SELECT s.name AS Skill, AVG(fg.final_grade) AS Average_Final_Grade
FROM skill_planned sp 
JOIN skill s ON sp.id_skill = s.id
JOIN register_skill rs ON sp.id = rs.id_skill_planned
JOIN final_grade fg ON rs.id = fg.id_register_skill
GROUP BY s.name
ORDER BY Average_Final_Grade DESC;
-- 6. Consultar el rendimiento general por ruta de entrenamiento.
SELECT lr.description, AVG(fg.final_grade) AS Average_Learning_Route
FROM learning_route lr 
JOIN skill_planned sp ON lr.id = sp.id_route
JOIN skill s ON sp.id_skill = s.id
JOIN register_skill rs ON sp.id = rs.id_skill_planned
JOIN final_grade fg ON rs.id = fg.id_register_skill
GROUP BY lr.description
ORDER BY Average_Learning_Route DESC;
-- 7. Mostrar los trainers responsables de campers con bajo rendimiento.
SELECT t.name AS Trainer_Name, t.surname AS Trainer_Surname, COUNT(fg.final_grade) AS Campers_Low_Performance
FROM trainers t 
JOIN group_campus gc ON t.id = gc.trainer_id
JOIN learning_route lr ON gc.route_id = lr.id
JOIN skill_planned sp ON lr.id = sp.id_route
JOIN register_skill rs ON sp.id = rs.id_skill_planned
JOIN final_grade fg ON rs.id = fg.id_register_skill
WHERE fg.final_grade < 60
GROUP BY t.name, t.surname;
-- 8. Comparar el promedio de rendimiento por trainer.

SELECT t.name AS Trainer_Name, t.surname AS Trainer_Surname, AVG(fg.final_grade) AS Average_Performance
FROM trainers t 
JOIN group_campus gc ON t.id = gc.trainer_id
JOIN learning_route lr ON gc.route_id = lr.id
JOIN skill_planned sp ON lr.id = sp.id_route
JOIN register_skill rs ON sp.id = rs.id_skill_planned
JOIN final_grade fg ON rs.id = fg.id_register_skill
GROUP BY t.name, t.surname
ORDER BY Average_Performance DESC;
-- 9. Listar los mejores 5 campers por nota final en cada ruta.
SELECT c.name AS Camper_Name, c.surname AS Camper_Surname, fg.final_grade AS Final_Grade
FROM learning_route lr 
JOIN camper c ON lr.id = c.id_learning_route
JOIN register_skill rs ON c.id = rs.id_camper
JOIN final_grade fg ON rs.id = fg.id_register_skill
GROUP BY c.name, c.surname, final_grade
ORDER BY fg.final_grade DESC
LIMIT 5;
-- 10. Mostrar cuántos campers pasaron cada módulo por ruta.
SELECT COUNT(fg.id_register_skill) AS Campers, s.name AS Skill, lr.description AS Learning_Route
FROM learning_route lr 
JOIN skill_planned sp ON lr.id = sp.id_route
JOIN skill s ON sp.id_skill = s.id
JOIN register_skill rs ON sp.id = rs.id_skill_planned
JOIN final_grade fg ON rs.id = fg.id_register_skill
WHERE fg.final_grade > 60
GROUP BY lr.description, s.name;