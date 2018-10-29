CREATE DATABASE university;
USE university;

CREATE TABLE groups (
    id_group SMALLINT NOT NULL,
    group_code CHAR(6) NOT NULL,
    speciality VARCHAR(255),
    faculty_name VARCHAR(255)
);

CREATE TABLE disciplines (
    id_discipline INT NOT NULL,
    discipline VARCHAR(255) NOT NULL,
    nb_planned_hours SMALLINT
);
