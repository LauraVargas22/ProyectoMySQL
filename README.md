# Seguimiento Académico para CampusLands
El objetivo del proyecto es diseñar y desarrollar una base de datos que permita gestionar de
manera eficiente todas las operaciones relacionadas con el seguimiento académico de los
**campers** matriculados en el programa intensivo de programación de CampusLands. Este
sistema debe facilitar la gestión de inscripciones, rutas de aprendizaje, evaluaciones, reportes, y
asignaciones de entrenadores y áreas de entrenamiento, garantizando una solución robusta y
optimizada.

## Instalación:
Para el correcto funcionamiento de la base de datos se recomienda seguir la siguiente tabla de contenido, en donde se creará la base de datos con sus respectivas tablas y atributos, con el fin de garantizar la correcta inserción de datos y el desarrolló de las consultas.

## Tabla de Contenidos:
1. [Modelado Base de Datos](./Diagrama.jpg)
2. [Creación Base de Datos](./ddl.sql)
3. [Inserción de Datos](./dml.sql)
4. **Consultas SQL**
    1. [Campers](./consultasSQL/dql_selectCamper.sql)
    2. [Evaluaciones](./consultasSQL/dql_selectEvaluacion.sql)
    3. [Rutas y áreas de aprendizaje](./consultasSQL/dql_selectRuta.sql)
    4. [Trainers](./consultasSQL/dql_selectTrainer.sql)
    5. [Subconsultas y Cálculos Avanzados](./SQLAvanzado/dql_subconsultas.sql)
    6. [JOINs Básicos (INNER JOIN, LEFT JOIN, etc.)](./SQLAvanzado/dql_joinBasico.sql)
    7. [JOINs con condiciones específicas](./SQLAvanzado/dql_joinsCondiciones.sql)
    8. [JOINs con funciones de agregación](./SQLAvanzado/dql_joinsFunciones.sql)
    9. [Procedimientos Almacenados](./SQLAvanzado/dql_procedimientos.sql)
    10. [Funciones](./SQLAvanzado/dql_funciones.sql)
    11. [Triggers](./SQLAvanzado/dql_triggers.sql)

## Modelo Base de Datos
Teniendo en cuenta, la problemática planteada se desarrolló el siguiente modelo ER para la creación de la base de datos.
![alt text](./ERDDiagram.jpg)

La base de datos se compone de algunas entidades tales como:
- **Company**: Hace referencia a la empresa o institución educativa en este caso Campuslands.
- **Headquarters**: Sedes de las institución educativa.
- **Camper**: Hace referencia a los estudiantes que se encuentran en el campus, en esta se relacionan entidades como: nivel de riesgo, estado, sede a la cual pertenece, historial de los estados, acudiente, número de teléfono, ruta de aprendizaje asignada, dirección, asistencias.
- **Trainer**: Hace referencia a los profesores que se encuentran en el campus, en esta se relacionan entidades como: sede a la cual pertenece, habilidades técnicas, horario, grupo asignado, área de entrenamiento.
- **Learning Route**: En esta se tienen las rutas de aprendizaje que se asignarán al camper, esta tiene entidades que se relacionan como:
    - **Skills**: Modulos que se pueden impartir en las rutas de aprendizaje.
    - **Skill Planned**: Modulos que se programan en determinada ruta de aprendizaje.
    - **Data Base**: Bases de datos que se pueden relacionar a la ruta de aprendizaje.
    - **SGDB Route**: Se especifica la base de datos principal y la alternativa.
    - **Sessions**: De acuerdo al modulo programado se tiene las sesiones programadas para el skill, así mismo se relaciona con la asistencia de los Campers.
- **Assesment**: Las evaluaciones se relacionan con el modulo programado, además se identifica el tipo de evaluación.
- **Assesment_type**: Se define el tipo de evaluación y la ponderación evaluación teórica (30%), práctica (60%), y trabajos/quizzes (10%).
- **Grades**: Calificación de la evaluación
- **Register_Skill**: En esta se matricula el camper a los modulos, lo cual permite el registro de la nota final de acuerdo al número de matricula.




