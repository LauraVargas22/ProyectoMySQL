INSERT INTO country (name) VALUES('Estados Unidos'), ('Canadá'), ('México'), ('Brasil'), ('Argentina'), ('Colombia'), ('Chile'), ('Perú'), ('Venezuela'), ('Ecuador'), ('Bolivia'), ('Paraguay'), ('Uruguay'), ('Panamá'), ('Costa Rica'), ('El Salvador'), ('Guatemala'), ('Honduras'), ('Nicaragua'), ('Cuba'), ('República Dominicana'), ('Haití'), ('Jamaica'), ('Trinidad y Tobago'), ('Barbados'), ('Bahamas'), ('Belice'), ('Guyana'), ('Surinam'), ('Guayana Francesa'), ('Reino Unido'), ('Alemania'), ('Francia'), ('España'), ('Italia'), ('Portugal'), ('Países Bajos'), ('Bélgica'), ('Suiza'), ('Austria'), ('Suecia'), ('Noruega'), ('Dinamarca'), ('Finlandia'), ('Polonia'), ('República Checa'), ('Eslovaquia'), ('Hungría'), ('Rumania'), ('Bulgaria');

INSERT INTO state (name, country_id) VALUES('Santander', 6), ('Cundinamarca', 6), ('Antioquia', 6), ('Boyacá', 6), ('Norte de Santander', 6), ('Atlántico', 6),  
('Valle del Cauca', 6), ('Bolívar', 6), ('Caldas', 6), ('Cauca', 6),('Jalisco', 3), ('Nuevo León', 3), ('Chihuahua', 3), ('Puebla', 3), ('Guanajuato', 3), ('Sonora', 3),  
('Coahuila', 3), ('Veracruz', 3), ('Querétaro', 3), ('Yucatán', 3), ('São Paulo', 4), ('Río de Janeiro', 4), ('Bahía', 4), ('Paraná', 4), ('Maranhão', 4), ('Ceará', 4),  
('Pernambuco', 4), ('Amazonas', 4), ('Goiás', 4), ('Santa Catarina', 4), ('Buenos Aires', 5), ('Córdoba', 5), ('Santa Fe', 5), ('Mendoza', 5), ('Tucumán', 5), ('Salta', 5),  
('Misiones', 5), ('Corrientes', 5), ('Entre Ríos', 5), ('San Juan', 5), ('Madrid', 34), ('Barcelona', 34), ('Valencia', 34), ('Sevilla', 34), ('Zaragoza', 34), ('Málaga', 34),  
('Murcia', 34), ('Palma de Mallorca', 34), ('Bilbao', 34), ('Valladolid', 34);

INSERT INTO city (name, state_id) VALUES
('Bucaramanga', 1), ('Bogotá', 2), ('Cúcuta', 5), ('Medellín', 3), ('Duitama', 4), ('Tunja', 4), ('Barranquilla', 6), ('Cali', 7), ('Tibú', 5),  
('Cartagena', 8), ('Manizales', 9), ('Popayán', 10),  
('Guadalajara', 11), ('Monterrey', 12), ('Chihuahua', 13), ('Puebla', 14), ('León', 15), ('Hermosillo', 16), ('Saltillo', 17), ('Xalapa', 18), ('Querétaro', 19), ('Mérida', 20), ('São Paulo', 21), ('Río de Janeiro', 22), ('Salvador', 23), ('Curitiba', 24), ('São Luís', 25), ('Fortaleza', 26), ('Recife', 27), ('Manaos', 28), ('Goiânia', 29), ('Florianópolis', 30), ('Buenos Aires', 31), ('Córdoba', 32), ('Rosario', 33), ('Mendoza', 34), ('San Miguel de Tucumán', 35), ('Salta', 36), ('Posadas', 37), ('Corrientes', 38), ('Paraná', 39), ('San Juan', 40),('Madrid', 41), ('Barcelona', 42), ('Valencia', 43), ('Sevilla', 44), ('Zaragoza', 45), ('Málaga', 46), ('Murcia', 47), ('Palma', 48), ('Bilbao', 49), ('Valladolid', 50);

INSERT INTO location (address, city_id) VALUES
('Calle 26 #85-20', 2), ('Carrera 7 #32-16', 2), ('Avenida Caracas #10-45', 2), ('Calle 100 #15-80', 2), ('Carrera 50 #14-33', 2),
('Calle 72 #8-55', 2), ('Transversal 93 #45A-23', 2), ('Carrera 13 #82-77', 2), ('Avenida Suba #122-18', 2), ('Carrera 30 #45B-22', 2),
('Calle 19 #4-67', 2), ('Diagonal 40 #25-56', 2), ('Carrera 68 #20-14', 2), ('Calle 53 #23-90', 2), ('Carrera 15 #79-99', 2), ('Carrera 27 #36-24', 1), ('Calle 45 #29-67', 1), ('Carrera 33 #48-12', 1), ('Avenida Quebradaseca #12-34', 1), ('Calle 56 #17-98', 1),
('Carrera 21 #88-44', 1), ('Diagonal 15 #45-21', 1), ('Calle 34 #27-50', 1), ('Carrera 30 #20-30', 1), ('Avenida González Valencia #5-88', 1),
('Calle 17 #10-45', 1), ('Carrera 40 #22-32', 1), ('Diagonal 19 #35-67', 1), ('Carrera 12 #50-20', 1), ('Calle 60 #25A-19', 1),('Avenida 0 #14-50', 3), ('Calle 10 #8-40', 3), ('Carrera 11 #16-60', 3), ('Calle 2 #25-78', 3), ('Avenida Gran Colombia #33-12', 3),
('Calle 15 #12-23', 3), ('Carrera 7 #20-40', 3), ('Calle 18 #10-22', 3), ('Carrera 14 #30-14', 3), ('Calle 5 #7-90', 3),
('Carrera 10 #11-88', 3), ('Calle 13 #18-77', 3), ('Carrera 8 #24-50', 3), ('Avenida Libertadores #35-45', 3), ('Carrera 15 #28-60', 3), ('Carrera 5 #12-34', 4), ('Calle 8 #7-25', 4), ('Carrera 3 #10-50', 4), ('Calle 2 #4-78', 4), ('Carrera 1 #6-90', 4), ('Calle 4 #5-23', 4), ('Carrera 6 #8-10', 4), ('Calle 9 #2-11', 4), ('Carrera 2 #7-40', 4), ('Calle 3 #1-30', 4);

INSERT INTO company (name) VALUES
('Campuslands'), ('UNAB'), ('Universidad Nacional de Colombia'), ('Universidad de los Andes'), ('Pontificia Universidad Javeriana'),  
('Universidad del Rosario'), ('Universidad EAFIT'), ('Universidad de Antioquia'), ('Universidad del Norte'), ('Universidad del Valle'),  
('Universidad Industrial de Santander'), ('Universidad de la Sabana'), ('Universidad Sergio Arboleda'), ('Universidad de Medellín'), ('Universidad Autónoma de Bucaramanga'),  
('Universidad Externado de Colombia'), ('Universidad Tecnológica de Pereira'), ('Universidad del Cauca'), ('Universidad de Ibagué'), ('Universidad Francisco de Paula Santander'),  
('SENA'), ('Instituto Tecnológico Metropolitano'), ('Corporación Universitaria Minuto de Dios'), ('Escuela Colombiana de Ingeniería Julio Garavito'), ('Politécnico Grancolombiano'),  
('Harvard University'), ('Stanford University'), ('Massachusetts Institute of Technology (MIT)'), ('California Institute of Technology (Caltech)'), ('University of Oxford'),  
('University of Cambridge'), ('Yale University'), ('Princeton University'), ('Columbia University'), ('University of Chicago'),  
('University of Toronto'), ('McGill University'), ('University of British Columbia'), ('Universidad Nacional Autónoma de México (UNAM)'), ('Tecnológico de Monterrey'),  
('Universidad de Buenos Aires (UBA)'), ('Pontificia Universidad Católica de Chile'), ('Universidade de São Paulo'), ('Universidad de Salamanca'), ('Universidad Complutense de Madrid'),  
('Universidad Politécnica de Madrid'), ('Universidad de Barcelona'), ('ETH Zürich'), ('Universidad de Tokio'), ('Universidad de Melbourne');

INSERT INTO headquarters (id_company, description) VALUES (1, 'Campuslands Zona Franca'), (1, 'EAN Campuslands'), (1, 'Campuslands Cajasan'), (1, 'Campuslands UniMinuto'), (1, 'Campuslands IETDH'),  
(1, 'Campuslands SENA'), (1, 'Campuslands UNAB'), (1, 'Campuslands UCC'), (1, 'Campuslands UIS'), (1, 'Campuslands UTP'), (2, 'UNAB Campus Bucaramanga'), (2, 'UNAB Campus Bogotá'), (2, 'UNAB Campus Medellín'), (2, 'UNAB Campus Cali'), (2, 'UNAB Virtual'),  (3, 'UNAL Sede Bogotá'), (3, 'UNAL Sede Medellín'), (3, 'UNAL Sede Manizales'), (3, 'UNAL Sede Palmira'), (3, 'UNAL Amazonia'), (4, 'Uniandes Campus Principal'), (4, 'Uniandes Campus Norte'), (4, 'Uniandes Campus Caribe'), (4, 'Uniandes Virtual'), (4, 'Uniandes Centro de Innovación'), (5, 'Javeriana Sede Bogotá'), (5, 'Javeriana Sede Cali'), (5, 'Javeriana Sede Medellín'), (5, 'Javeriana Virtual'), (5, 'Javeriana Centro de Investigación'),  (6, 'Rosario Sede Centro Histórico'), (6, 'Rosario Sede Norte'), (6, 'Rosario Sede Empresarial'), (6, 'Rosario Virtual'), (6, 'Rosario Centro de Innovación'),  (7, 'EAFIT Sede Medellín'), (7, 'EAFIT Sede Bogotá'), (7, 'EAFIT Virtual'), (7, 'EAFIT Centro de Investigación'), (7, 'EAFIT Centro Empresarial'),  (8, 'UdeA Sede Central'), (8, 'UdeA Sede Oriente'), (8, 'UdeA Sede Urabá'), (8, 'UdeA Virtual'), (8, 'UdeA Centro de Emprendimiento');

INSERT INTO headquarters_address (headquarters_id, location_id) VALUES (1, 27), (2, 2), (3, 18), (4, 44), (5, 50), (6, 10), (7, 15), (8, 22), (9, 33), (10, 40), (11, 5), (12, 8), (13, 12), (14, 25), (15, 30), (16, 3), (17, 6), (18, 9), (19, 20), (20, 35), (21, 7), (22, 11), (23, 16), (24, 26), (25, 38),   (26, 4), (27, 13), (28, 21), (29, 28), (30, 45), (31, 1), (32, 14), (33, 19), (34, 29), (35, 39), (36, 17), (37, 23), (38, 31), (39, 36), (40, 48),  
(41, 24), (42, 32), (43, 37), (44, 41), (45, 46);

INSERT INTO especialization (description) VALUES
('C#'), ('Python'), ('Java'), ('Javascript'), ('PHP'), ('HTML'), ('CSS'), ('SQL'), ('C++'), ('C'),  
('Ruby'), ('Express'), ('Go'), ('NodeJS'), ('Dart'), ('Rust'), ('Scala'), ('Perl'), ('R'), ('MATLAB'),  
('Assembly'), ('MYSQL'), ('PostgreSQL'), ('MongoDB'), ('Kotlin'), ('Swift'), ('TypeScript'), ('Vue.js'), ('React'), ('Angular'), ('Svelte'), ('Bootstrap'), ('Tailwind CSS'), ('Next.js'), ('Nuxt.js'), ('FastAPI'), ('Flask'), ('Django'), ('Spring Boot'), ('Laravel'), ('Symfony'), ('ASP.NET'), ('GraphQL'), ('TensorFlow'), ('Vue'), ('Keras'), ('Hadoop'), ('Spark'), ('Kubernetes'), ('Docker');

INSERT INTO schedule(start_time, end_time, time_slot) VALUES("06:00:00", "09:00:00", 'AM'), ("10:00:00", "13:00:00", 'AM'), ("14:00:00", "17:00:00", 'PM'), ("18:00:00", "21:00:00", 'PM');

INSERT INTO state_area(description) VALUES('Ocupada'), ('Disponible'), ('Inactiva'), ('Mantenimiento'), ('Reservada'), ('Desactivada'), ('Activa'), ('Limpieza');

INSERT INTO area (name, capacity, state_id) VALUES
('Apolo', 33, 1), ('Artemis', 33, 2), ('Spuntik', 33, 1), ('SkyLab', 35, 3), ('Naves', 35, 2),  
('Cosmos', 23, 2), ('Auditorio', 45, 5), ('Salón Azul', 20, 3), ('Aula 101', 20, 1), ('Aula 102', 20, 2),  
('Aula 103', 20, 3), ('Aula 104', 20, 4), ('Aula 105', 20, 5), ('Aula 106', 20, 6), ('Aula 107', 20, 7),  
('Aula 108', 20, 8), ('Aula 109', 20, 9), ('Aula 110', 20, 10), ('Laboratorio Alfa', 25, 1), ('Laboratorio Beta', 25, 2),  
('Laboratorio Gamma', 25, 3), ('Laboratorio Delta', 25, 4), ('Laboratorio Sigma', 25, 5), ('Laboratorio Omega', 25, 6), ('Sala de Innovación', 30, 7),  
('Sala de Conferencias', 40, 8), ('Espacio Maker', 28, 9), ('Taller de Robótica', 22, 10), ('Taller de Software', 22, 1), ('Sala de Networking', 26, 2),  
('Sala de Simulación', 30, 3), ('Aula Inteligente 201', 18, 4), ('Aula Inteligente 202', 18, 5), ('Aula Inteligente 203', 18, 6), ('Aula Inteligente 204', 18, 7),  
('Aula Inteligente 205', 18, 8), ('Aula Inteligente 206', 18, 9), ('Aula Inteligente 207', 18, 10), ('Laboratorio de Datos', 27, 1), ('Laboratorio de IA', 27, 2),  
('Centro de Investigación', 50, 3), ('Centro de Desarrollo', 50, 4), ('Aula Magna', 60, 5), ('Planetario', 80, 6), ('Espacio de Coworking', 32, 7),  
('Hackerspace', 24, 8), ('Zona de Realidad Virtual', 21, 9), ('Estudio de Grabación', 19, 10), ('Pabellón Tecnológico', 55, 1), ('Foro de Innovación', 65, 2);

INSERT INTO trainers (name, surname, identification, headquarters_id) VALUES
('Jolhver José', 'Pardo', '123456789', 1), ('Miguel', 'González', '987654321', 1), ('Juan', 'Mariño', '234567809', 1),  
('Pedro', 'Gómez', '345678901', 1), ('José', 'Tarazona', '456789012', 1), ('Michael', 'Garzón', '567890123', 1),  
('Orbin', 'Pabon', '678901234', 1), ('Angie', 'Suarez', '789012345', 3), ('David', 'Hernández', '890123456', 1),  
('Diego', 'Ramírez', '901234567', 1), ('Camilo', 'Castañeda', '012345678', 5), ('Felipe', 'Ceballos', '12347890', 3),  
('Sebastián', 'Pérez', '2345678901', 1), ('Nicolás', 'Mendoza', '3456789012', 4), ('Juan Pablo', 'Salazar', '4567890123', 3),  
('Anderson David', 'Bermúdez', '5678901234', 6), ('Cristian Camilo', 'González Pérez', '6789012345', 6),  
('Alejandro Andrés', 'García Martínez', '7890123456', 14), ('Juan Sebastián', 'Hernández Ramírez', '8901234567', 2),  
('Santiago Andrés', 'Martínez Castañeda', '9012345678', 2), ('Luis', 'García', '1122334455', 3), ('Andrés', 'Díaz', '2233445566', 5),  
('Carlos', 'Torres', '3344556677', 4), ('Diego', 'Rojas', '4455667788', 2), ('Felipe', 'Castro', '5566778899', 3),  
('Kevin', 'Ortiz', '6677889900', 6), ('Ricardo', 'Navarro', '7788990011', 7), ('Héctor', 'Mejía', '8899001122', 8),  
('Javier', 'Fernández', '9900112233', 9), ('Mauricio', 'Morales', '0011223344', 10), ('Alejandro', 'López', '1122334456', 11),  
('Fernando', 'Ramírez', '2233445567', 12), ('Esteban', 'Jiménez', '3344556678', 13), ('Jonathan', 'Silva', '4455667789', 14),  
('Bryan', 'Méndez', '5566778890', 15), ('Germán', 'Rincón', '6677889901', 16), ('Roberto', 'Sánchez', '7788990012', 17),  
('Oscar', 'Figueroa', '8899001123', 18), ('Mateo', 'Peralta', '9900112234', 19), ('Marcos', 'Patiño', '0011223345', 20),  
('Juan Manuel', 'Beltrán', '1122334457', 21), ('Rodrigo', 'Espinosa', '2233445568', 22), ('Lucas', 'Peña', '3344556679', 23),  
('Samuel', 'Becerra', '4455667780', 24), ('Henry', 'Vega', '5566778891', 25), ('Brayan', 'Cortés', '6677889902', 26),  
('Wilson', 'Guerra', '7788990013', 27), ('Eduardo', 'Pérez', '8899001124', 28), ('Daniel', 'Reyes', '9900112235', 29),  
('Ernesto', 'León', '0011223346', 30);

INSERT INTO skill_trainer (id_trainer, id_especialization) VALUES
(1, 2), (1, 3), (1, 8), (2, 4), (2, 5), (2, 6), (3, 1), (3, 7), (3, 9), (4, 10),  
(4, 11), (4, 12), (5, 13), (5, 14), (5, 15), (6, 16), (6, 17), (6, 18), (7, 19), (7, 20),  
(7, 21), (8, 22), (8, 23), (8, 24), (9, 25), (9, 26), (9, 27), (10, 28), (10, 29), (10, 30),  
(1, 31), (2, 32), (3, 33), (4, 34), (5, 35), (6, 36), (7, 37), (8, 38), (9, 39), (10, 40),  
(1, 41), (2, 42), (3, 43), (4, 44), (5, 45), (6, 46), (7, 47), (8, 48), (9, 49), (10, 50);

INSERT INTO schedule_trainer (trainer_id, schedule_id, area_id) VALUES
(1, 1, 1), (1, 2, 2), (1, 3, 3), (1, 4, 4),  
(2, 1, 5), (2, 2, 6), (2, 3, 7), (2, 4, 8),  
(3, 1, 9), (3, 2, 10), (3, 3, 11), (3, 4, 12),  
(4, 1, 13), (4, 2, 14), (4, 3, 15), (4, 4, 16),  
(5, 1, 17), (5, 2, 18), (5, 3, 19), (5, 4, 20),  
(6, 1, 21), (6, 2, 22), (6, 3, 23), (6, 4, 24),  
(7, 1, 25), (7, 2, 26), (7, 3, 27), (7, 4, 28),  
(8, 1, 29), (8, 2, 30), (8, 3, 1), (8, 4, 2),  
(9, 1, 3), (9, 2, 4), (9, 3, 5), (9, 4, 6),  
(10, 1, 7), (10, 2, 8), (10, 3, 9), (10, 4, 10),  
(1, 1, 11), (2, 2, 12), (3, 3, 13), (4, 4, 14),  
(5, 1, 15), (6, 2, 16), (7, 3, 17), (8, 4, 18);