-- 1. Obtener todos los campers inscritos actualmente.
SELECT identification, name, surname, date_registration
FROM camper;

-- 2. Listar los campers con estado "Aprobado".
SELECT c.identification, c.name, c.surname, sc.type_state
FROM camper c 
JOIN state_camper sc ON c.id_state_camper = sc.id
WHERE sc.type_state = 'Aprobado';

-- 3. Mostrar los campers que ya están cursando alguna ruta.
SELECT identification, name, surname, date_registration, id_learning_route AS id_learning_route
FROM camper
WHERE id_learning_route IS NOT NULL; 

-- 4. Consultar los campers graduados por cada ruta.
SELECT c.identification, c.name, c.surname, c.date_registration, lr.description AS LEARNING_ROUTE, c.id_state_camper AS ID_Graduado
FROM camper c
JOIN learning_route lr ON c.id_learning_route = lr.id
WHERE c.id_state_camper = 5
GROUP BY lr.description, c.identification, c.name, c.surname, c.date_registration;

-- 5. Obtener los campers que se encuentran en estado "Expulsado" o "Retirado".
SELECT c.identification, c.name, c.surname, sc.type_state
FROM camper c 
JOIN state_camper sc ON c.id_state_camper = sc.id
WHERE sc.type_state = 'Expulsado' OR sc.type_state = 'Retirado';
-- 6. Listar campers con nivel de riesgo “Alto”.
SELECT c.identification, c.name, c.surname, rl.type_level
FROM camper c
JOIN risk_level rl ON c.id_risk_level = rl.id
WHERE rl.type_level = 'Alto';
-- 7. Mostrar el total de campers por cada nivel de riesgo.
SELECT rl.type_level AS Risk_Level, COUNT(c.id) AS Campers_Count
FROM camper c
JOIN risk_level rl ON c.id_risk_level = rl.id
GROUP BY rl.type_level;
-- 8. Obtener campers con más de un número telefónico registrado.

-- 9. Listar los campers y sus respectivos acudientes y teléfonos.
SELECT c.name AS Name_Camper, c.surname AS Surname_Camper, t.name AS Name_Tutor, t.surname AS Surname_Tutor, t.phone_number AS Tutor_Telephone
FROM camper c
JOIN tutor t ON c.id_tutor = t.id;
-- 10. Mostrar campers que aún no han sido asignados a una ruta.
SELECT identification, name, surname, date_registration, id_learning_route AS id_learning_route
FROM camper
WHERE id_learning_route IS NULL; 