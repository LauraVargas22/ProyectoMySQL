CREATE DATABASE sgdbCampus;
USE sgdbCampus;

CREATE TABLE IF NOT EXISTS country (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS state (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    country_id INT,
    CONSTRAINT contry_id_FK FOREIGN KEY (country_id) REFERENCES country(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS city (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    state_id INT,
    CONSTRAINT state_id_FK FOREIGN KEY (state_id) REFERENCES state(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS location(
    id INT PRIMARY KEY AUTO_INCREMENT,
    address VARCHAR(250),
    city_id INT,
    CONSTRAINT city_id_FK FOREIGN KEY (city_id) REFERENCES city(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS company(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) UNIQUE
);

CREATE TABLE IF NOT EXISTS headquarters(
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_company INT,
    description VARCHAR(100),
    CONSTRAINT company_id_FK FOREIGN KEY (id_company) REFERENCES company(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS headquarters_address(
    id INT PRIMARY KEY AUTO_INCREMENT,
    headquarters_id INT,
    location_id INT,
    CONSTRAINT headquarters_id_FK FOREIGN KEY (headquarters_id) REFERENCES headquarters(id) ON DELETE CASCADE,
    CONSTRAINT location_id_FK FOREIGN KEY (location_id) REFERENCES location(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS especialization(
    id INT PRIMARY KEY AUTO_INCREMENT,
    description VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS schedule (
    id INT PRIMARY KEY AUTO_INCREMENT,
    start_time TIME,
    end_time TIME,
    time_slot VARCHAR(30)
);

CREATE TABLE IF NOT EXISTS state_area(
    id INT PRIMARY KEY AUTO_INCREMENT,
    description VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS area(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    capacity INT,
    state_id INT,
    CONSTRAINT id_state_area_FK FOREIGN KEY (state_id) REFERENCES state(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS trainers(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    surname VARCHAR(50),
    identification VARCHAR(50),
    headquarters_id INT,
    CONSTRAINT id_headquarter_trainer_FK FOREIGN KEY (headquarters_id) REFERENCES headquarters(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS skill_trainer(
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_trainer INT,
    id_especialization INT,
    CONSTRAINT trainer_id_FK FOREIGN KEY (id_trainer) REFERENCES trainers(id) ON DELETE CASCADE,
    CONSTRAINT especialization_id_FK FOREIGN KEY (id_especialization) REFERENCES especialization(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS schedule_trainer(
    trainer_id INT,
    schedule_id INT,
    area_id INT,
    PRIMARY KEY (trainer_id, schedule_id, area_id),
    CONSTRAINT schedule_trainer_id_FK FOREIGN KEY (trainer_id) REFERENCES trainers(id) ON DELETE CASCADE,
    CONSTRAINT schedule_id_FK FOREIGN KEY (schedule_id) REFERENCES schedule(id) ON DELETE CASCADE,
    CONSTRAINT area_id_FK FOREIGN KEY (area_id) REFERENCES area(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS learning_route(
    id INT PRIMARY KEY AUTO_INCREMENT,
    description VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS data_base(
    id INT PRIMARY KEY AUTO_INCREMENT,
    description VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS sgdb_route(
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_route INT,
    id_Main_SGBD INT,
    id_Second_SGBD INT,
    CONSTRAINT db_route_id_FK FOREIGN KEY (id_route) REFERENCES learning_route(id) ON DELETE CASCADE,
    CONSTRAINT Main_SGBD_id_FK FOREIGN KEY (id_Main_SGBD) REFERENCES data_base(id) ON DELETE CASCADE,
    CONSTRAINT Second_SGBD_id_FK FOREIGN KEY (id_Second_SGBD) REFERENCES data_base(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS state_skill(
    id INT PRIMARY KEY AUTO_INCREMENT,
    description VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS skill(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS skill_planned(
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_skill INT,
    start_date DATE,
    end_date DATE,
    id_state_skill INT,
    id_route INT,
    CONSTRAINT skill_route_id_FK FOREIGN KEY (id_route) REFERENCES learning_route(id) ON DELETE CASCADE,
    CONSTRAINT skill_id_FK FOREIGN KEY (id_skill) REFERENCES skill(id) ON DELETE CASCADE,
    CONSTRAINT state_skill_id_FK FOREIGN KEY (id_state_skill) REFERENCES state_skill(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS session(
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_skill_planned INT,
    date_session DATE,
    topic VARCHAR(50),
    CONSTRAINT skill_planned_id_FK FOREIGN KEY (id_skill_planned) REFERENCES skill_planned(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS state_assesment(
    id INT PRIMARY KEY AUTO_INCREMENT,
    description VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS assesment_type(
    id INT PRIMARY KEY AUTO_INCREMENT,
    type_name VARCHAR(50),
    estimation DECIMAL(10,2)
);

CREATE TABLE IF NOT EXISTS assesment(
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_skill_planned INT,
    id_state_assesment INT,
    id_assesment_type INT,
    date_assesment DATE,
    description VARCHAR(50),
    CONSTRAINT assesment_skillPlanned_FK FOREIGN KEY (id_skill_planned) REFERENCES skill_planned(id) ON DELETE CASCADE,
    CONSTRAINT state_assesment_id_FK FOREIGN KEY (id_state_assesment) REFERENCES state_assesment(id) ON DELETE CASCADE,
    CONSTRAINT assesment_type_id_FK FOREIGN KEY (id_assesment_type) REFERENCES assesment_type(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS tutor(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    surname VARCHAR(50),
    identification VARCHAR(50),
    phone_number VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS risk_level(
    id INT PRIMARY KEY AUTO_INCREMENT,
    type_level VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS state_camper(
    id INT PRIMARY KEY AUTO_INCREMENT,
    type_state VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS camper(
    id INT PRIMARY KEY AUTO_INCREMENT,
    identification VARCHAR(50) UNIQUE,
    name VARCHAR(50),
    surname VARCHAR(50),
    date_registration DATE,
    id_headquarters INT,
    id_state_camper INT,
    id_risk_level INT,
    id_tutor INT,
    id_learning_route INT,
    CONSTRAINT headquarters_id_camper_FK FOREIGN KEY (id_headquarters) REFERENCES headquarters(id) ON DELETE CASCADE,
    CONSTRAINT state_camper_id_FK FOREIGN KEY (id_state_camper) REFERENCES state_camper(id) ON DELETE CASCADE,
    CONSTRAINT risk_level_id_FK FOREIGN KEY (id_risk_level) REFERENCES risk_level(id) ON DELETE CASCADE,
    CONSTRAINT tutor_id_FK FOREIGN KEY (id_tutor) REFERENCES tutor(id) ON DELETE CASCADE,
    CONSTRAINT learning_route_camper_id_FK FOREIGN KEY (id_learning_route) REFERENCES learning_route(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS camper_address(
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_camper INT,
    id_location INT,
    CONSTRAINT camper_address_id_FK FOREIGN KEY (id_camper) REFERENCES camper(id) ON DELETE CASCADE,
    CONSTRAINT location_camper_id_FK FOREIGN KEY (id_location) REFERENCES location(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS group_campus(
    id INT PRIMARY KEY AUTO_INCREMENT,
    route_id INT,
    trainer_id INT,
    name VARCHAR(50),
    CONSTRAINT route_group_id_FK FOREIGN KEY (route_id) REFERENCES learning_route(id) ON DELETE CASCADE,
    CONSTRAINT trainer_group_id_FK FOREIGN KEY (trainer_id) REFERENCES trainers(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS group_details(
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_camper INT,
    id_group INT,
    CONSTRAINT group_camper_id_FK FOREIGN KEY (id_camper) REFERENCES camper(id) ON DELETE CASCADE,
    CONSTRAINT group_id_FK FOREIGN KEY (id_group) REFERENCES group_campus(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS graduates(
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_camper INT,
    date_graduation DATE,
    CONSTRAINT graduates_id_FK FOREIGN KEY (id_camper) REFERENCES camper(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS camper_history(
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_camper INT,
    date_change DATE,
    previous_state VARCHAR(50), 
    new_state VARCHAR(50),
    CONSTRAINT camper_history_id_FK FOREIGN KEY (id_camper) REFERENCES camper(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS telephone(
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_camper INT,
    phone_number VARCHAR(50),
    CONSTRAINT camper_telephone_id_FK FOREIGN KEY (id_camper) REFERENCES camper(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS attendance(
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_camper INT,
    id_session INT,
    CONSTRAINT attendance_camper_id_FK FOREIGN KEY (id_camper) REFERENCES camper(id) ON DELETE CASCADE,
    CONSTRAINT session_id_FK FOREIGN KEY (id_session) REFERENCES session(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS register_skill(
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_camper INT,
    id_skill_planned INT,
    date_registration DATE,
    CONSTRAINT register_camper_id_FK FOREIGN KEY (id_camper) REFERENCES camper(id) ON DELETE CASCADE,
    CONSTRAINT id_skill_planned_FK FOREIGN KEY (id_skill_planned) REFERENCES skill_planned(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS final_grade(
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_register_skill INT,
    final_grade DECIMAL(10,2),
    CONSTRAINT register_skill_id_FK FOREIGN KEY (id_register_skill) REFERENCES register_skill(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS grades(
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_register_skill INT,
    id_assesment INT,
    grade DECIMAL(10,2),
    CONSTRAINT register_grade_id_FK FOREIGN KEY (id_register_skill) REFERENCES register_skill(id) ON DELETE CASCADE,
    CONSTRAINT assesment_id_FK FOREIGN KEY (id_assesment) REFERENCES assesment(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS notification_log (
    id INT AUTO_INCREMENT PRIMARY KEY,
    message VARCHAR(100),
    target_type VARCHAR(50),
    id_trainer INT,
    time_notification TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT notification_trainer_FK FOREIGN KEY (id_trainer) REFERENCES trainers(id) ON DELETE CASCADE
);
