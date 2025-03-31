-- 1. Listar los campers que han aprobado todos los módulos de su ruta (nota_final >= 60).

-- 2. Mostrar las rutas que tienen más de 10 campers inscritos actualmente.
SELECT lr.description AS Learning_Route, COUNT(c.id_learning_route) AS Campers_Route
FROM learning_route lr
JOIN camper c ON lr.id = c.id_learning_route
GROUP BY lr.description
HAVING COUNT(c.id_learning_route) > 10;
-- 3. Consultar las áreas que superan el 80% de su capacidad con el número actual de campers
-- asignados.
-- 4. Obtener los trainers que imparten más de una ruta diferente.
-- 5. Listar las evaluaciones donde la nota práctica es mayor que la nota teórica.
-- 6. Mostrar campers que están en rutas cuyo SGDB principal es MySQL.
-- 7. Obtener los nombres de los módulos donde los campers han tenido bajo rendimiento.
-- 8. Consultar las rutas con más de 3 módulos asociados.
-- 9. Listar las inscripciones realizadas en los últimos 30 días con sus respectivos campers y rutas.
-- 10. Obtener los trainers que están asignados a rutas con campers en estado de “Alto Riesgo”.