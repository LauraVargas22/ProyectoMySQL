-- 1. Obtener las notas teóricas, prácticas y quizzes de cada camper por módulo.
-- 2. Calcular la nota final de cada camper por módulo.
-- 3. Mostrar los campers que reprobaron algún módulo (nota < 60).
SELECT c.name AS Camper_Name, c.surname AS Camper_Surname, fg.final_grade, s.name
FROM camper c
JOIN register_skill rs ON c.id = rs.id_camper
JOIN skill_planned sp ON rs.id_skill_planned = sp.id
JOIN skill s ON sp.id_skill = s.id
JOIN final_grade fg ON rs.id = fg.id_register_skill
WHERE fg.final_grade < 60;
-- 4. Listar los módulos con más campers en bajo rendimiento.
-- 5. Obtener el promedio de notas finales por cada módulo.
-- 6. Consultar el rendimiento general por ruta de entrenamiento.
-- 7. Mostrar los trainers responsables de campers con bajo rendimiento.
-- 8. Comparar el promedio de rendimiento por trainer.
-- 9. Listar los mejores 5 campers por nota final en cada ruta.
-- 10. Mostrar cuántos campers pasaron cada módulo por ruta.