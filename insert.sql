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

INSERT INTO learning_route(description) VALUES ('Java - Spring Boot'),('C# - ASP.NET'), ('JavaScript - Node.js'),
('Python - Django'),('PHP - Laravel'),('Ruby - Ruby on Rails'), ('C++ - Qt'), ('Swift - iOS Development'), ('Kotlin - Android Development'), ('HTML/CSS - Frontend Development'), ('SQL - Database Management'), ('Data Science with Python'), ('Machine Learning with R'), ('Web Development with React.js'), ('Mobile App Development with Flutter'),
('DevOps with Docker and Kubernetes'), ('Cybersecurity Fundamentals'), ('Blockchain Development with Solidity'),
('Game Development with Unity'), ('Game Development with Unreal Engine'), ('Artificial Intelligence with TensorFlow'),
('Cloud Computing with AWS'), ('Cloud Computing with Azure'), ('Cloud Computing with Google Cloud'), ('Embedded Systems with C'), ('Internet of Things (IoT) Development'), ('Functional Programming with Haskell'), ('Scala - Big Data Processing'),('Go - High-Performance Backend Development'), ('Rust - Systems Programming'), ('Networking and System Administration'), ('Big Data Analytics with Apache Spark'), ('Software Testing and QA Automation'), ('UI/UX Design with Figma'), ('AR/VR Development with Unity'), ('Microservices Architecture with Spring Cloud'), ('Full Stack Development with MERN'),('Full Stack Development with MEAN'), ('Progressive Web Apps (PWA) Development'),
('Data Engineering with Apache Kafka'), ('Computer Vision with OpenCV'), ('Ethical Hacking and Penetration Testing'),
('Robotics with ROS'), ('Business Intelligence with Power BI'), ('NoSQL Databases (MongoDB, Firebase)'), ('Software Architecture and Design Patterns'), ('Low-Code/No-Code Development'), ('Natural Language Processing with NLP'),('GraphQL API Development'), ('Quantum Computing Basics');

INSERT INTO data_base(description) VALUES
('MySQL'),('PostgreSQL'),('MongoDB'),('SQLite'),('Oracle Database'),('Microsoft SQL Server'),('MariaDB'),('Cassandra'),('Redis'),('Firebase Realtime Database'),('Amazon DynamoDB'),('Google Cloud Firestore'),('Neo4j'),('Couchbase'),('IBM Db2'),('SAP HANA'),('Amazon Aurora'),('Microsoft Access'),('Teradata'),('Apache Hive'),('Apache HBase'),('ClickHouse'),('InfluxDB'),('TimescaleDB');

INSERT INTO state_skill(description) VALUES
('Inactivo'),('Activo'),('En Progreso'),('Finalizado'),('Suspendido'),('Cancelado'),('Pendiente de Evaluación'),('Aprobado'),('Rechazado'),('En Espera');
INSERT INTO skill(name) VALUES
('Java'),('C#'),('Python'),('JavaScript'),('PHP'),('HTML'),('CSS'),('SQL'),('C++'),('C'),('Ruby'),('Express'),('Go'),('NodeJS'),('Dart'),('Rust'),('Scala'),('Perl'),('R'),('MATLAB'),('Assembly'),('MYSQL'),('PostgreSQL'),('MongoDB'),('Kotlin'),('Swift'),('TypeScript'),('Vue.js'),('React.js'),('Angular.js'),('Scrum'),('GIT'),('Docker'),('Kubernetes'),('Jenkins'),('GraphQL'),('Firebase'),('TensorFlow'),('PyTorch'),('Hadoop'),('Apache Spark'),('Linux'),('Bash'),('PowerShell'),('Figma'),('Adobe XD'),('CI/CD'),('Agile'),('Trello'),('JIRA'),('Unit Testing');

INSERT INTO skill_planned(id_skill, start_date, end_date, id_state_skill) VALUES (1, '2025-01-08', '2025-03-30', 3),(2, '2025-02-01', '2025-04-15', 2),(3, '2025-02-10', '2025-05-20', 1),(4, '2025-03-01', '2025-06-10', 3),(5, '2025-03-15', '2025-07-01', 2),(6, '2025-04-01', '2025-07-30', 1),(7, '2025-04-10', '2025-08-15', 3),(8, '2025-05-05', '2025-09-10', 2),(9, '2025-05-20', '2025-09-30', 1),(10, '2025-06-01', '2025-10-15', 3),(11, '2025-06-10', '2025-11-01', 2),(12, '2025-07-01', '2025-11-20', 1),(13, '2025-07-15', '2025-12-05', 3),(14, '2025-08-01', '2025-12-20', 2),(15, '2025-08-10', '2026-01-10', 1),(16, '2025-09-01', '2026-01-30', 3),(17, '2025-09-15', '2026-02-15', 2),(18, '2025-10-01', '2026-03-01', 1),(19, '2025-10-10', '2026-03-15', 3),(20, '2025-11-01', '2026-04-01', 2),(21, '2025-11-15', '2026-04-20', 1),(22, '2025-12-01', '2026-05-01', 3),(23, '2025-12-10', '2026-05-15', 2),(24, '2026-01-01', '2026-06-01', 1),(25, '2026-01-15', '2026-06-15', 3),(26, '2026-02-01', '2026-07-01', 2),(27, '2026-02-10', '2026-07-15', 1),(28, '2026-03-01', '2026-08-01', 3),(29, '2026-03-15', '2026-08-15', 2),(30, '2026-04-01', '2026-09-01', 1),(31, '2026-04-10', '2026-09-15', 3),(32, '2026-05-01', '2026-10-01', 2),(33, '2026-05-15', '2026-10-15', 1),(34, '2026-06-01', '2026-11-01', 3),(35, '2026-06-10', '2026-11-15', 2),(36, '2026-07-01', '2026-12-01', 1),(37, '2026-07-15', '2026-12-15', 3),(38, '2026-08-01', '2027-01-01', 2),(39, '2026-08-10', '2027-01-15', 1),(40, '2026-09-01', '2027-02-01', 3),(41, '2026-09-15', '2027-02-15', 2),(42, '2026-10-01', '2027-03-01', 1),(43, '2026-10-10', '2027-03-15', 3),(44, '2026-11-01', '2027-04-01', 2),(45, '2026-11-15', '2027-04-15', 1),(46, '2026-12-01', '2027-05-01', 3),(47, '2026-12-10', '2027-05-15', 2),(48, '2027-01-01', '2027-06-01', 1),(49, '2027-01-15', '2027-06-15', 3),(50, '2027-02-01', '2027-07-01', 2);

INSERT INTO session(id_skill_planned, date_session, topic) VALUES ('1','2025-01-10','Introducción a Java'),('1','2025-01-17','Sintaxis básica de Java'),('1','2025-01-24','Programación orientada a objetos en Java'),('1','2025-01-31','Manejo de excepciones en Java'),('1','2025-02-07','Java Collections Framework'),('1','2025-02-14','Java Streams API'),('1','2025-02-21','Java Concurrency'),('1','2025-02-28','Java I/O y NIO'),('1','2025-03-07','Java Networking'),('1','2025-03-14','Java JDBC y bases de datos'),('2','2025-02-02','Introducción a C#'),('2','2025-02-09','Sintaxis básica de C#'),('2','2025-02-16','Programación orientada a objetos en C#'),('2','2025-02-23','LINQ y Entity Framework'),('2','2025-03-02','ASP.NET Core MVC'),('2','2025-03-09','ASP.NET Core Web API'),('2','2025-03-16','C# Asynchronous Programming'),('2','2025-03-23','C# Collections y LINQ'),('2','2025-03-30','C# Unit Testing y TDD'),('3','2025-04-05','Introducción a Python'),('3','2025-04-12','Sintaxis y estructuras de datos en Python'),('3','2025-04-19','Programación orientada a objetos en Python'),('3','2025-04-26','Manejo de excepciones en Python'),('3','2025-05-03','Módulos y paquetes en Python'),('3','2025-05-10','Programación funcional en Python'),('3','2025-05-17','Python y bases de datos'),('3','2025-05-24','Automatización con Python'),('3','2025-05-31','Análisis de datos con Python'),('3','2025-06-07','Machine Learning con Python'),('4','2025-06-14','Introducción a JavaScript'),('4','2025-06-21','Sintaxis y estructuras de control en JavaScript'),('4','2025-06-28','Funciones y eventos en JavaScript'),('4','2025-07-05','Manipulación del DOM'),('4','2025-07-12','Asincronismo en JavaScript'),('4','2025-07-19','JavaScript y APIs REST'),('4','2025-07-26','Frameworks de JavaScript'),('4','2025-08-02','Pruebas en JavaScript'),('4','2025-08-09','Desarrollo con Node.js'),('4','2025-08-16','Seguridad en JavaScript'),('5','2025-08-23','Introducción a PHP'),('5','2025-08-30','Sintaxis y estructuras de datos en PHP'),('5','2025-09-06','Programación orientada a objetos en PHP'),('5','2025-09-13','Manejo de sesiones y cookies en PHP'),('5','2025-09-20','PHP y bases de datos'),('5','2025-09-27','Seguridad en PHP'),('5','2025-10-04','Frameworks de PHP'),('5','2025-10-11','Pruebas en PHP'),('5','2025-10-18','Desarrollo de API REST con PHP'),('5','2025-10-25','Optimización y rendimiento en PHP');

INSERT INTO state_assesment(description) VALUES
('Pendiente'),('Aprobado'),('Rechazado'),('En Progreso'),('Finalizado'),('Cancelado'),('Suspendido'),('En Espera'),('Evaluado'),('No Evaluado');

INSERT INTO assesment_type(type_name, estimation) VALUES 
('Evaluación Teórica', 60),('Práctica', 30),('Trabajos y Quizzes', 10),('Examen Final', 25),('Presentación Oral', 15),('Proyecto Final', 50),('Autoevaluación', 5),('Evaluación por Pares', 10),('Simulación de Entrevista', 20),('Hackathon', 40),('Evaluación de Código', 35),('Desafío Técnico', 30),('Resolución de Problemas', 25),('Prueba de Concepto', 20),('Evaluación Continua', 15),('Revisión de Código', 10),('Caso de Estudio', 30),('Prueba Diagnóstica', 10),('Evaluación Grupal', 20),('Informe Escrito', 15),('Retroalimentación del Instructor', 5),('Test de Competencias', 25),('Desarrollo de Software', 50),('Diseño de Base de Datos', 40),('Análisis de Algoritmos', 30),('Simulación de Proyecto', 45),('Investigación Aplicada', 35),('Validación de Conocimientos', 20),('Examen Abierto', 30),('Experiencia en Laboratorio', 40),('Desarrollo de Caso Práctico', 50),('Demostración de Habilidades', 30),('Desafío de Seguridad', 35),('Evaluación en Tiempo Real', 25),('Prueba de Rendimiento', 20),('Estudio Comparativo', 10),('Evaluación de Producto', 45),('Revisión de Presentaciones', 15),('Diseño de Prototipo', 40),('Implementación de Algoritmos', 50),('Modelado de Datos', 35),('Desarrollo de Microservicios', 50),('Evaluación UX/UI', 30),('Planificación de Proyecto', 25),('Desarrollo en Equipo', 40),('Práctica de Infraestructura', 35),('Creación de Documentación', 20),('Aplicación de Buenas Prácticas', 30),('Estrategia de Testing', 25);

INSERT INTO assesment(id_skill_planned, id_state_assesment, id_assesment_type, date_assesment, description) VALUES
(1, 1, 1, '2025-03-15', 'Conceptos Básicos Java'),(1, 1, 2, '2025-03-22', 'Ejercicios Prácticos Java'),(1, 1, 3, '2025-03-29', 'Quizzes Java'),
(2, 1, 1, '2025-04-05', 'Conceptos Básicos C#'),(2, 1, 2, '2025-04-12', 'Ejercicios Prácticos C#'),(2, 1, 3, '2025-04-19', 'Quizzes C#'),
(3, 1, 1, '2025-04-26', 'Conceptos Básicos Python'),(3, 1, 2, '2025-05-03', 'Ejercicios Prácticos Python'),(3, 1, 3, '2025-05-10', 'Quizzes Python'),
(4, 1, 1, '2025-05-17', 'Conceptos Básicos JavaScript'),(4, 1, 2, '2025-05-24', 'Ejercicios Prácticos JavaScript'),(4, 1, 3, '2025-05-31', 'Quizzes JavaScript'),
(5, 1, 1, '2025-06-07', 'Conceptos Básicos PHP'),(5, 1, 2, '2025-06-14', 'Ejercicios Prácticos PHP'),(5, 1, 3, '2025-06-21', 'Quizzes PHP'),
(6, 1, 1, '2025-06-28', 'Conceptos Básicos SQL'),(6, 1, 2, '2025-07-05', 'Ejercicios Prácticos SQL'),(6, 1, 3, '2025-07-12', 'Quizzes SQL'),
(7, 1, 1, '2025-07-19', 'Conceptos Básicos C++'),(7, 1, 2, '2025-07-26', 'Ejercicios Prácticos C++'),(7, 1, 3, '2025-08-02', 'Quizzes C++'),
(8, 1, 1, '2025-08-09', 'Conceptos Básicos Ruby'),(8, 1, 2, '2025-08-16', 'Ejercicios Prácticos Ruby'),(8, 1, 3, '2025-08-23', 'Quizzes Ruby'),
(9, 1, 1, '2025-08-30', 'Conceptos Básicos Go'),(9, 1, 2, '2025-09-06', 'Ejercicios Prácticos Go'),(9, 1, 3, '2025-09-13', 'Quizzes Go'),
(10, 1, 1, '2025-09-20', 'Conceptos Básicos TypeScript'),(10, 1, 2, '2025-09-27', 'Ejercicios Prácticos TypeScript'),(10, 1, 3, '2025-10-04', 'Quizzes TypeScript'),
(11, 1, 1, '2025-10-11', 'Conceptos Básicos Swift'),(11, 1, 2, '2025-10-18', 'Ejercicios Prácticos Swift'),(11, 1, 3, '2025-10-25', 'Quizzes Swift'),
(12, 1, 1, '2025-11-01', 'Conceptos Básicos Kotlin'),(12, 1, 2, '2025-11-08', 'Ejercicios Prácticos Kotlin'),(12, 1, 3, '2025-11-15', 'Quizzes Kotlin'),
(13, 1, 1, '2025-11-22', 'Conceptos Básicos React.js'),(13, 1, 2, '2025-11-29', 'Ejercicios Prácticos React.js'),(13, 1, 3, '2025-12-06', 'Quizzes React.js'),
(14, 1, 1, '2025-12-13', 'Conceptos Básicos Angular'),(14, 1, 2, '2025-12-20', 'Ejercicios Prácticos Angular'),(14, 1, 3, '2025-12-27', 'Quizzes Angular'),
(15, 1, 1, '2026-01-03', 'Conceptos Básicos Vue.js'),(15, 1, 2, '2026-01-10', 'Ejercicios Prácticos Vue.js'),(15, 1, 3, '2026-01-17', 'Quizzes Vue.js');

INSERT INTO tutor(name, surname, identification, phone_number) VALUES
('Mónica', 'Rojas', '1052340374', '3001234567'),('Andrés', 'García', '1052340375', '3002345678'),('Laura', 'Martínez', '1052340376', '3003456789'),('Carlos', 'Hernández', '1052340377', '3004567890'),('Sofía', 'López', '1052340378', '3005678901'),('Diego', 'Ramírez', '1052340379', '3006789012'),('Valentina', 'Cruz', '1052340380', '3007890123'),('Sebastián', 'Torres', '1052340381', '3008901234'),('Camila', 'Pérez', '1052340382', '3009012345'),('Felipe', 'González', '1052340383', '3000123456'),
('Daniela', 'Fernández', '1052340384', '3011234567'),('Julián', 'Rodríguez', '1052340385', '3012345678'),('Natalia', 'Ortega', '1052340386', '3013456789'),('Manuel', 'Suárez', '1052340387', '3014567890'),('Paula', 'Castro', '1052340388', '3015678901'),('Esteban', 'Morales', '1052340389', '3016789012'),('Gabriela', 'Vargas', '1052340390', '3017890123'),('Ricardo', 'Navarro', '1052340391', '3018901234'),('Lucía', 'Mendoza', '1052340392', '3019012345'),('Fernando', 'Reyes', '1052340393', '3010123456'),
('Andrea', 'Silva', '1052340394', '3021234567'),('Pablo', 'Cortés', '1052340395', '3022345678'),('Liliana', 'Peña', '1052340396', '3023456789'),('Mauricio', 'Guzmán', '1052340397', '3024567890'),('Diana', 'Muñoz', '1052340398', '3025678901'),('Alejandro', 'Herrera', '1052340399', '3026789012'),('Cristina', 'Jiménez', '1052340400', '3027890123'),('José', 'Maldonado', '1052340401', '3028901234'),('Verónica', 'Rincón', '1052340402', '3029012345'),('Óscar', 'Arroyo', '1052340403', '3020123456'),
('Luisa', 'Beltrán', '1052340404', '3031234567'),('Hernán', 'Salazar', '1052340405', '3032345678'),('Patricia', 'Velásquez', '1052340406', '3033456789'),('Camilo', 'Delgado', '1052340407', '3034567890'),('Mariana', 'Santos', '1052340408', '3035678901'),('Raúl', 'Quintero', '1052340409', '3036789012'),('Tatiana', 'Esquivel', '1052340410', '3037890123'),('Javier', 'Bermúdez', '1052340411', '3038901234'),('Isabela', 'Patiño', '1052340412', '3039012345'),('Emilio', 'Fonseca', '1052340413', '3030123456'),
('Ximena', 'Castañeda', '1052340414', '3041234567'),('Samuel', 'Orozco', '1052340415', '3042345678'),('Rosa', 'Villalba', '1052340416', '3043456789'),('Gustavo', 'Naranjo', '1052340417', '3044567890'),('Elena', 'Bautista', '1052340418', '3045678901'),('Vicente', 'Gálvez', '1052340419', '3046789012'),('Adriana', 'Mejía', '1052340420', '3047890123'),('Rodrigo', 'Benítez', '1052340421', '3048901234'),('Cecilia', 'Sarmiento', '1052340422', '3049012345'),('Fabián', 'Cáceres', '1052340423', '3040123456');

INSERT INTO risk_level(type_level) VALUES ('Alto'), ('Medio'), ('Moderado'), ('Bajo'), ('Crítico'), ('Extremo'), ('Leve'), ('Severo'), ('Grave'), ('Inaceptable');

INSERT INTO state_camper(type_state) VALUES ('En proceso de ingreso'), ('Inscrito'), ('Aprobado'), ('Cursando'), ('Graduado'), ('Expulsado'), ('Retirado'), ('Suspendido'), ('Reprobado'), ('En espera de evaluación'), ('Evaluado'), ('No evaluado'), ('En revisión'), ('Aceptado'), ('Rechazado'), ('En lista de espera'), ('En proceso de admisión'), ('En proceso de selección'), ('En proceso de matrícula'), ('En proceso de evaluación');

INSERT INTO camper(identification, name, surname, date_registration, id_headquarters, id_state_camper, id_risk_level, id_tutor, id_learning_route) VALUES
('1052340500', 'Laura', 'Vargas', '2023-01-15', 1, 1, 2, 1, 1),
('1052340501', 'Valentina', 'Caballero', '2023-02-10', 2, 1, 1, 2, 2),
('1052340502', 'Isabela', 'Galvis', '2023-03-05', 3, 2, 3, 3, 3),
('1052340503', 'Andrés', 'Araque', '2023-04-22', 1, 1, 2, 4, 1),
('1052340504', 'Eduardo', 'Pérez', '2023-05-19', 2, 2, 1, 5, 2),
('1052340505', 'Felipe', 'Castillo', '2023-06-11', 3, 1, 3, 6, 3),
('1052340506', 'Gabriela', 'Torres', '2023-07-14', 1, 1, 2, 7, 1),
('1052340507', 'Hernán', 'Suárez', '2023-08-07', 2, 2, 1, 8, 2),
('1052340508', 'Isabela', 'Martínez', '2023-09-30', 3, 1, 3, 9, 3),
('1052340509', 'Javier', 'Ríos', '2023-10-25', 1, 1, 2, 10, 1),
('1052340510', 'Karen', 'Vega', '2023-11-18', 2, 2, 1, 11, 2),
('1052340511', 'Luis', 'Hernández', '2023-12-09', 3, 1, 3, 12, 3),
('1052340512', 'Mariana', 'Bustos', '2024-01-12', 1, 1, 2, 13, 1),
('1052340513', 'Nicolás', 'Delgado', '2024-02-05', 2, 2, 1, 14, 2),
('1052340514', 'Olga', 'Reyes', '2024-03-28', 3, 1, 3, 15, 3),
('1052340515', 'Pedro', 'Córdoba', '2024-04-20', 1, 1, 2, 16, 1),
('1052340516', 'Quintín', 'Moreno', '2024-05-09', 2, 2, 1, 17, 2),
('1052340517', 'Rosa', 'Navarro', '2024-06-30', 3, 1, 3, 18, 3),
('1052340518', 'Sergio', 'Álvarez', '2024-07-25', 1, 1, 2, 19, 1),
('1052340519', 'Teresa', 'Mendoza', '2024-08-15', 2, 2, 1, 20, 2),
('1052340520', 'Ulises', 'García', '2024-09-10', 3, 1, 3, 21, 3),
('1052340521', 'Valeria', 'Salinas', '2024-10-02', 1, 1, 2, 22, 1),
('1052340522', 'Walter', 'Cifuentes', '2024-11-19', 2, 2, 1, 23, 2),
('1052340523', 'Ximena', 'Escobar', '2024-12-27', 3, 1, 3, 24, 3),
('1052340524', 'Yahir', 'Osorio', '2025-01-05', 1, 1, 2, 25, 1),
('1052340525', 'Zulma', 'Beltrán', '2025-02-10', 2, 2, 1, 26, 2),
('1052340526', 'Alfonso', 'Vargas', '2025-03-03', 3, 1, 3, 27, 3),
('1052340527', 'Brenda', 'Pinto', '2025-03-22', 1, 1, 2, 28, 1),
('1052340528', 'Cristian', 'Montoya', '2025-03-25', 2, 2, 1, 29, 2),
('1052340529', 'Diana', 'Santos', '2025-03-28', 3, 1, 3, 30, 3),
('1052340530', 'Elías', 'Ramírez', '2025-03-29', 1, 1, 2, 31, 1),
('1052340531', 'Fernanda', 'Gómez', '2025-03-30', 2, 2, 1, 32, 2),
('1052340532', 'Gonzalo', 'Mendoza', '2025-03-30', 3, 1, 3, 33, 3),
('1052340533', 'Helena', 'Guzmán', '2025-03-30', 1, 1, 2, 34, 1),
('1052340534', 'Ignacio', 'Peña', '2025-03-30', 2, 2, 1, 35, 2),
('1052340535', 'Joaquín', 'Rivera', '2025-03-30', 3, 1, 3, 36, 3),
('1052340536', 'Karla', 'Silva', '2025-03-30', 1, 1, 2, 37, 1),
('1052340537', 'Leonardo', 'Vargas', '2025-03-30', 2, 2, 1, 38, 2),
('1052340538', 'Margarita', 'Delgado', '2025-03-30', 3, 1, 3, 39, 3),
('1052340539', 'Nelson', 'Castaño', '2025-03-30', 1, 1, 2, 40, 1),
('1052340540', 'Oriana', 'Ramos', '2025-03-30', 2, 2, 1, 41, 2),
('1052340541', 'Pablo', 'Mejía', '2025-03-30', 3, 1, 3, 42, 3),
('1052340542', 'Quirina', 'Cortés', '2025-03-30', 1, 1, 2, 43, 1),
('1052340543', 'Rodrigo', 'Figueroa', '2025-03-30', 2, 2, 1, 44, 2),
('1052340544', 'Sonia', 'Aguilar', '2025-03-30', 3, 1, 3, 45, 3),
('1052340545', 'Tomás', 'Galeano', '2025-03-30', 1, 1, 2, 46, 1),
('1052340546', 'Úrsula', 'Nieves', '2025-03-30', 2, 2, 1, 47, 2);

INSERT INTO camper(identification, name, surname, date_registration, id_headquarters, id_state_camper, id_risk_level, id_tutor, id_learning_route) VALUES
('100000001', 'Juan', 'Pérez', '2023-01-15', 1, 1, 1, 1, 1),
('100000002', 'María', 'Gómez', '2023-02-20', 2, 2, 2, 2, 2),
('100000003', 'Carlos', 'Rodríguez', '2023-03-10', 3, 3, 3, 3, 3),
('100000004', 'Laura', 'Fernández', '2023-04-05', 1, 1, 1, 4, 1),
('100000005', 'Andrés', 'López', '2023-05-18', 2, 2, 2, 5, 2),
('100000006', 'Camila', 'Díaz', '2023-06-25', 3, 3, 3, 6, 3),
('100000007', 'Felipe', 'Martínez', '2023-07-30', 1, 1, 1, 7, 1),
('100000008', 'Valentina', 'Torres', '2023-08-12', 2, 2, 2, 8, 2),
('100000009', 'Santiago', 'Ramírez', '2023-09-03', 3, 3, 3, 9, 3),
('100000010', 'Daniela', 'Castro', '2023-10-21', 1, 1, 1, 10, 1),
('100000011', 'Diego', 'Vargas', '2023-11-11', 2, 2, 2, 11, 2),
('100000012', 'Natalia', 'Jiménez', '2023-12-05', 3, 3, 3, 12, 3),
('100000013', 'Esteban', 'Suárez', '2024-01-08', 1, 1, 1, 13, 1),
('100000014', 'Paola', 'Ortega', '2024-02-19', 2, 2, 2, 14, 2),
('100000015', 'Luis', 'Rojas', '2024-03-25', 3, 3, 3, 15, 3),
('100000016', 'Julián', 'Mendoza', '2024-04-14', 1, 1, 1, 16, 1),
('100000017', 'Andrea', 'Mejía', '2024-05-29', 2, 2, 2, 17, 2),
('100000018', 'Ricardo', 'Guzmán', '2024-06-09', 3, 3, 3, 18, 3),
('100000019', 'Sara', 'Muñoz', '2024-07-16', 1, 1, 1, 19, 1),
('100000020', 'Manuel', 'Paredes', '2024-08-23', 2, 2, 2, 20, 2),
('100000021', 'Tatiana', 'Álvarez', '2024-09-30', 3, 3, 3, 21, 3),
('100000022', 'Emilio', 'Navarro', '2024-10-08', 1, 1, 1, 22, 1),
('100000023', 'Fernanda', 'Salazar', '2024-11-17', 2, 2, 2, 23, 2),
('100000024', 'Oscar', 'Cabrera', '2024-12-24', 3, 3, 3, 24, 3),
('100000025', 'Patricia', 'Galeano', '2025-01-05', 1, 1, 1, 25, 1),
('100000026', 'Hugo', 'Sarmiento', '2025-01-15', 2, 2, 2, 26, 2),
('100000027', 'Gloria', 'Quintero', '2025-02-03', 3, 3, 3, 27, 3),
('100000028', 'Jorge', 'Gutiérrez', '2025-02-18', 1, 1, 1, 28, 1),
('100000029', 'Eliana', 'Bermúdez', '2025-03-01', 2, 2, 2, 29, 2),
('100000030', 'Raúl', 'Pinto', '2025-03-15', 3, 3, 3, 30, 3),
('100000031', 'Diana', 'Reyes', '2025-03-28', 1, 1, 1, 31, 1),
('100000032', 'Mauricio', 'Escobar', '2025-03-30', 2, 2, 2, 32, 2),
('100000033', 'Liliana', 'Fuentes', '2025-03-31', 3, 3, 3, 33, 3),
('100000034', 'Pablo', 'Valencia', '2025-03-31', 1, 1, 1, 34, 1),
('100000035', 'Lucía', 'Hoyos', '2025-03-31', 2, 2, 2, 35, 2),
('100000036', 'Rodrigo', 'Ocampo', '2025-03-31', 3, 3, 3, 36, 3),
('100000037', 'Beatriz', 'Herrera', '2025-03-31', 1, 1, 1, 37, 1),
('100000038', 'Samuel', 'Perdomo', '2025-03-31', 2, 2, 2, 38, 2),
('100000039', 'Verónica', 'Tamayo', '2025-03-31', 3, 3, 3, 39, 3),
('100000040', 'Álvaro', 'Bautista', '2025-03-31', 1, 1, 1, 40, 1),
('100000041', 'Silvia', 'Medina', '2025-03-31', 2, 2, 2, 41, 2),
('100000042', 'René', 'Villalobos', '2025-03-31', 3, 3, 3, 42, 3),
('100000043', 'Adriana', 'Maldonado', '2025-03-31', 1, 1, 1, 43, 1),
('100000044', 'Cristian', 'Peña', '2025-03-31', 2, 2, 2, 44, 2),
('100000045', 'Mónica', 'Cardozo', '2025-03-31', 3, 3, 3, 45, 3),
('100000046', 'Fabián', 'Lara', '2025-03-31', 1, 1, 1, 46, 1),
('100000047', 'Lorena', 'Rico', '2025-03-31', 2, 2, 2, 47, 2),
('100000048', 'Javier', 'Soto', '2025-03-31', 3, 3, 3, 48, 3),
('100000049', 'Isabel', 'Guerrero', '2025-03-31', 1, 1, 1, 49, 1),
('100000050', 'Oscar', 'Mora', '2025-03-31', 2, 2, 2, 50, 2);

INSERT INTO camper_address(id_camper, id_location) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9), (10, 10),
(11, 11), (12, 12), (13, 13), (14, 14), (15, 15), (16, 16), (17, 17), (18, 18), (19, 19), (20, 20),
(21, 21), (22, 22), (23, 23), (24, 24), (25, 25), (26, 26), (27, 27), (28, 28), (29, 29), (30, 30),
(31, 31), (32, 32), (33, 33), (34, 34), (35, 35), (36, 36), (37, 37), (38, 38), (39, 39), (40, 40),
(41, 41), (42, 42), (43, 43), (44, 44), (45, 45), (46, 46), (47, 47);

INSERT INTO camper_address(id_camper, id_location) VALUES
(48, 1), (49, 2), (50, 3), (51, 4), (52, 5), (53, 6), (54, 7), (55, 8), (56, 9), (57, 10),
(58, 11), (59, 12), (60, 13), (61, 14), (62, 15), (63, 16), (64, 17), (65, 18), (66, 19), (67, 20),
(68, 21), (69, 22), (70, 23), (71, 24), (72, 25), (73, 26), (74, 27), (75, 28), (76, 29), (77, 30),
(78, 31), (79, 32), (80, 33), (81, 34), (82, 35), (83, 36), (84, 37), (85, 38), (86, 39), (87, 40),
(88, 41), (89, 42), (90, 43), (91, 44), (92, 45), (93, 46), (94, 47), (95, 48), (96, 49), (97, 50);


INSERT INTO group_campus(route_id, trainer_id, name) VALUES (1, 1, 'J1'), (2, 1, 'J2'), (3, 1, 'J3'), (1, 2, 'M1'), (2, 3, 'M2'), (3, 2, 'M3'),
(1, 3, 'U1'), (3, 3, 'U2'), (1, 4, 'P1'), (3, 4, 'P2'), (4, 3, 'P3'), (2, 5, 'G1'), (3, 5, 'G2'),
(1, 6, 'T1'), (2, 6, 'T2'), (3, 6, 'T3'), (1, 7, 'L1'), (2, 7, 'L2'), (3, 7, 'L3'), (1, 8, 'K1'),
(2, 8, 'K2'), (3, 8, 'K3'), (1, 9, 'H1'), (2, 9, 'H2'), (3, 9, 'H3'), (1, 10, 'C1'), (2, 10, 'C2'),
(3, 10, 'C3'), (1, 11, 'B1'), (2, 11, 'B2'), (3, 11, 'B3'), (1, 12, 'D1'), (2, 12, 'D2'), (3, 12, 'D3'),
(1, 13, 'E1'), (2, 13, 'E2'), (3, 13, 'E3'), (1, 14, 'F1'), (2, 14, 'F2'), (3, 14, 'F3'), (1, 15, 'A1'),
(2, 15, 'A2'), (3, 15, 'A3'), (1, 16, 'S1'), (2, 16, 'S2'), (3, 16, 'S3');

INSERT INTO group_details(id_camper, id_group) VALUES
(1, 1), (2, 2), (3, 1), (4, 2), (5, 1), (6, 2), (7, 1), (8, 2), (9, 1), (10, 2),
(11, 1), (12, 2), (13, 1), (14, 2), (15, 1), (16, 2), (17, 1), (18, 2), (19, 1), (20, 2),
(21, 1), (22, 2), (23, 1), (24, 2), (25, 1), (26, 2), (27, 1), (28, 2), (29, 1), (30, 2),
(31, 1), (32, 2), (33, 1), (34, 2), (35, 1), (36, 2), (37, 1), (38, 2), (39, 1), (40, 2),
(41, 1), (42, 2), (43, 1), (44, 2), (45, 1), (46, 2), (47, 1);

INSERT INTO group_details(id_camper, id_group) VALUES
(48, 1), (49, 2), (50, 3), (51, 1), (52, 2), (53, 3), (54, 1), (55, 2), (56, 3), (57, 1),
(58, 2), (59, 3), (60, 1), (61, 2), (62, 3), (63, 1), (64, 2), (65, 3), (66, 1), (67, 2),
(68, 3), (69, 1), (70, 2), (71, 3), (72, 1), (73, 2), (74, 3), (75, 1), (76, 2), (77, 3),
(78, 1), (79, 2), (80, 3), (81, 1), (82, 2), (83, 3), (84, 1), (85, 2), (86, 3), (87, 1),
(88, 2), (89, 3), (90, 1), (91, 2), (92, 3), (93, 1), (94, 2), (95, 3), (96, 1), (97, 2);

INSERT INTO graduates(id_camper, date_graduation) VALUES
(70, '2024-01-15'), (71, '2024-02-20'), (72, '2024-03-10'), (73, '2024-04-05'), (74, '2024-05-18'), 
(75, '2024-06-22'), (76, '2024-07-30'), (77, '2024-08-15'), (78, '2024-09-12'), (79, '2024-10-25'), 
(80, '2024-11-18'), (81, '2024-12-05'), (82, '2025-01-10'), (83, '2025-02-14'), (84, '2025-03-20'), 
(85, '2025-04-08'), (86, '2025-05-12'), (87, '2025-06-25'), (88, '2025-07-19'), (89, '2025-08-10'), 
(90, '2025-09-05'), (91, '2025-10-18'), (92, '2025-11-22'), (93, '2025-12-15'), (94, '2026-01-08'), 
(95, '2025-02-14'), (96, '2025-03-18'), (97, '2025-04-22');

INSERT INTO camper_history(id_camper, date_change, previous_state, new_state) VALUES
(1, '2023-01-15', 'Inscrito', 'Cursando'), (2, '2023-02-10', 'Inscrito', 'Cursando'), (3, '2023-03-05', 'Inscrito', 'Cursando'),
(4, '2023-04-20', 'Inscrito', 'Cursando'), (5, '2023-05-18', 'Inscrito', 'Cursando'), (6, '2023-06-12', 'Inscrito', 'Cursando'),
(7, '2023-07-30', 'Inscrito', 'Cursando'), (8, '2023-08-15', 'Inscrito', 'Cursando'), (9, '2023-09-25', 'Inscrito', 'Cursando'),
(10, '2023-10-10', 'Inscrito', 'Cursando'), (11, '2023-11-22', 'Inscrito', 'Cursando'), (12, '2023-12-05', 'Inscrito', 'Cursando'),
(13, '2024-01-12', 'Inscrito', 'Cursando'), (14, '2024-02-18', 'Inscrito', 'Cursando'), (15, '2024-03-25', 'Inscrito', 'Cursando'),
(16, '2024-04-05', 'Inscrito', 'Cursando'), (17, '2024-05-10', 'Inscrito', 'Cursando'), (18, '2024-06-15', 'Inscrito', 'Cursando'),
(19, '2024-07-20', 'Inscrito', 'Cursando'), (20, '2024-08-12', 'Inscrito', 'Cursando'), (21, '2024-09-05', 'Inscrito', 'Cursando'),
(22, '2024-10-08', 'Inscrito', 'Cursando'), (23, '2024-11-15', 'Inscrito', 'Cursando'), (24, '2024-12-22', 'Inscrito', 'Cursando'),
(25, '2025-01-05', 'Inscrito', 'Cursando'), (26, '2025-02-10', 'Inscrito', 'Cursando'), (27, '2025-03-01', 'Inscrito', 'Cursando'), (48, '2023-01-15', 'Cursando', 'Aprobado'), (49, '2023-02-10', 'Cursando', 'Aprobado'), (50, '2023-03-05', 'Cursando', 'Aprobado'),
(51, '2023-04-20', 'Cursando', 'Aprobado'), (52, '2023-05-18', 'Cursando', 'Aprobado'), (53, '2023-06-12', 'Cursando', 'Aprobado'),
(54, '2023-07-30', 'Cursando', 'Aprobado'), (55, '2023-08-15', 'Cursando', 'Aprobado'), (56, '2023-09-25', 'Cursando', 'Aprobado'),
(57, '2023-10-10', 'Cursando', 'Aprobado'), (58, '2023-11-22', 'Cursando', 'Aprobado'), (59, '2023-12-05', 'Cursando', 'Aprobado'),
(60, '2024-01-12', 'Cursando', 'Aprobado'), (61, '2024-02-18', 'Cursando', 'Aprobado'), (62, '2024-03-25', 'Cursando', 'Aprobado'),
(63, '2024-04-05', 'Cursando', 'Aprobado'), (64, '2024-05-10', 'Cursando', 'Aprobado'), (65, '2024-06-15', 'Cursando', 'Aprobado'),
(66, '2024-07-20', 'Cursando', 'Aprobado'), (67, '2024-08-12', 'Cursando', 'Aprobado'), (68, '2024-09-05', 'Cursando', 'Aprobado'),
(69, '2024-10-08', 'Cursando', 'Aprobado'),(70, '2023-01-15', 'Aprobado', 'Graduado'), (71, '2023-02-10', 'Aprobado', 'Graduado'), (72, '2023-03-05', 'Aprobado', 'Graduado'),
(73, '2023-04-20', 'Aprobado', 'Graduado'), (74, '2023-05-18', 'Aprobado', 'Graduado'), (75, '2023-06-12', 'Aprobado', 'Graduado'),
(76, '2023-07-30', 'Aprobado', 'Graduado'), (77, '2023-08-15', 'Aprobado', 'Graduado'), (78, '2023-09-25', 'Aprobado', 'Graduado'),
(79, '2023-10-10', 'Aprobado', 'Graduado'), (80, '2023-11-22', 'Aprobado', 'Graduado'), (81, '2023-12-05', 'Aprobado', 'Graduado'),
(82, '2024-01-12', 'Aprobado', 'Graduado'), (83, '2024-02-18', 'Aprobado', 'Graduado'), (84, '2024-03-25', 'Aprobado', 'Graduado'),
(85, '2024-04-05', 'Aprobado', 'Graduado'), (86, '2024-05-10', 'Aprobado', 'Graduado'), (87, '2024-06-15', 'Aprobado', 'Graduado'),
(88, '2024-07-20', 'Aprobado', 'Graduado'), (89, '2024-08-12', 'Aprobado', 'Graduado'), (90, '2024-09-05', 'Aprobado', 'Graduado'),
(91, '2024-10-08', 'Aprobado', 'Graduado'), (92, '2024-11-15', 'Aprobado', 'Graduado'), (93, '2024-12-22', 'Aprobado', 'Graduado'),
(94, '2025-01-05', 'Aprobado', 'Graduado'), (95, '2025-02-10', 'Aprobado', 'Graduado'), (96, '2025-02-20', 'Aprobado', 'Graduado'),
(97, '2025-03-01', 'Aprobado', 'Graduado');

INSERT INTO telephone(id_camper, phone_number) VALUES
(1, '3001000001'), (2, '3001000002'), (3, '3001000003'), (4, '3001000004'), (5, '3001000005'),
(6, '3001000006'), (7, '3001000007'), (8, '3001000008'), (9, '3001000009'), (10, '3001000010'),
(11, '3001000011'), (12, '3001000012'), (13, '3001000013'), (14, '3001000014'), (15, '3001000015'),
(16, '3001000016'), (17, '3001000017'), (18, '3001000018'), (19, '3001000019'), (20, '3001000020'),
(21, '3001000021'), (22, '3001000022'), (23, '3001000023'), (24, '3001000024'), (25, '3001000025'),
(26, '3001000026'), (27, '3001000027'), (28, '3001000028'), (29, '3001000029'), (30, '3001000030'),
(31, '3001000031'), (32, '3001000032'), (33, '3001000033'), (34, '3001000034'), (35, '3001000035'),
(36, '3001000036'), (37, '3001000037'), (38, '3001000038'), (39, '3001000039'), (40, '3001000040'),
(41, '3001000041'), (42, '3001000042'), (43, '3001000043'), (44, '3001000044'), (45, '3001000045'),
(46, '3001000046'), (47, '3001000047'), (48, '3001000048'), (49, '3001000049'), (50, '3001000050'), (10, '3002000010'), (11, '3002000011'), (12, '3002000012'), (13, '3002000013'), (14, '3002000014'),
(15, '3002000015'), (16, '3002000016'), (17, '3002000017'), (18, '3002000018'), (19, '3002000019'),
(20, '3002000020'), (21, '3002000021'), (22, '3002000022'), (23, '3002000023'), (24, '3002000024'),
(25, '3002000025'), (26, '3002000026'), (27, '3002000027'), (28, '3002000028'), (29, '3002000029'),
(30, '3002000030');

INSERT INTO attendance (id_camper, id_session) VALUES
(1, 5), (2, 10), (3, 15), (4, 20), (5, 25), (6, 30), (7, 35), (8, 1), (9, 6), (10, 11),
(11, 16), (12, 21), (13, 26), (14, 31), (15, 36), (16, 2), (17, 7), (18, 12), (19, 17), (20, 22),
(21, 27), (22, 32), (23, 37), (24, 3), (25, 8), (26, 13), (27, 18), (28, 23), (29, 28), (30, 33),
(31, 38), (32, 4), (33, 9), (34, 14), (35, 19), (36, 24), (37, 29), (38, 34), (39, 39), (40, 5),
(41, 10), (42, 15), (43, 20), (44, 25), (45, 30), (46, 35), (47, 1), (48, 6), (49, 11), (50, 16);

INSERT INTO register_skill(id_camper, id_skill_planned, date_registration) VALUES
(1, 1, '2025-01-08'), (2, 2, '2025-02-01'), (3, 1, '2025-01-08'), (4, 2, '2025-02-01'), (5, 1, '2025-01-08'),
(6, 2, '2025-02-01'), (7, 1, '2025-01-08'), (8, 2, '2025-02-01'), (9, 1, '2025-01-08'), (10, 2, '2025-02-01'),
(11, 1, '2025-01-08'), (12, 2, '2025-02-01'), (13, 1, '2025-01-08'), (14, 2, '2025-02-01'), (15, 1, '2025-01-08'),
(16, 2, '2025-02-01'), (17, 1, '2025-01-08'), (18, 2, '2025-02-01'), (19, 1, '2025-01-08'), (20, 2, '2025-02-01'),
(21, 1, '2025-01-08'), (22, 2, '2025-02-01'), (23, 1, '2025-01-08'), (24, 2, '2025-02-01'), (25, 1, '2025-01-08'),
(26, 2, '2025-02-01'), (27, 1, '2025-01-08'), (28, 2, '2025-02-01'), (29, 1, '2025-01-08'), (30, 2, '2025-02-01'),
(31, 1, '2025-01-08'), (32, 2, '2025-02-01'), (33, 1, '2025-01-08'), (34, 2, '2025-02-01'), (35, 1, '2025-01-08'),
(36, 2, '2025-02-01'), (37, 1, '2025-01-08'), (38, 2, '2025-02-01'), (39, 1, '2025-01-08'), (40, 2, '2025-02-01'),
(41, 1, '2025-01-08'), (42, 2, '2025-02-01'), (43, 1, '2025-01-08'), (44, 2, '2025-02-01'), (45, 1, '2025-01-08'),
(46, 2, '2025-02-01'), (47, 1, '2025-01-08'), (48, 2, '2025-02-01'), (49, 1, '2025-01-08'), (50, 2, '2025-02-01');

INSERT INTO final_grade(id_register_skill, final_grade) VALUES
(1, 85), (2, 73), (3, 90), (4, 67), (5, 88), (6, 92), (7, 76), (8, 81), (9, 95), (10, 60),
(11, 87), (12, 74), (13, 98), (14, 55), (15, 89), (16, 79), (17, 93), (18, 68), (19, 77), (20, 84),
(21, 91), (22, 62), (23, 100), (24, 70), (25, 80), (26, 75), (27, 97), (28, 56), (29, 82), (30, 99),
(31, 66), (32, 72), (33, 94), (34, 59), (35, 83), (36, 86), (37, 78), (38, 63), (39, 96), (40, 50),
(41, 69), (42, 71), (43, 53), (44, 65), (45, 57), (46, 58), (47, 61), (48, 64), (49, 54), (50, 52);

INSERT INTO grades(id_register_skill, id_assesment, grade) VALUES
(1, 3, 85), (2, 7, 73), (3, 10, 90), (4, 5, 67), (5, 12, 88), (6, 1, 92), (7, 8, 76), (8, 4, 81), (9, 9, 95), (10, 2, 60),
(11, 6, 87), (12, 11, 74), (13, 3, 98), (14, 7, 55), (15, 10, 89), (16, 5, 79), (17, 12, 93), (18, 1, 68), (19, 8, 77), (20, 4, 84),
(21, 9, 91), (22, 2, 62), (23, 6, 100), (24, 11, 70), (25, 3, 80), (26, 7, 75), (27, 10, 97), (28, 5, 56), (29, 12, 82), (30, 1, 99),
(31, 8, 66), (32, 4, 72), (33, 9, 94), (34, 2, 59), (35, 6, 83), (36, 11, 86), (37, 3, 78), (38, 7, 63), (39, 10, 96), (40, 5, 50),
(41, 12, 69), (42, 1, 71), (43, 8, 53), (44, 4, 65), (45, 9, 57), (46, 2, 58), (47, 6, 61), (48, 11, 64), (49, 3, 54), (50, 7, 52);













