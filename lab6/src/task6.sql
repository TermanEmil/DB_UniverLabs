DROP TABLE IF EXISTS orarul;

create table orarul
(
    Id_Disciplina int not null,
    Id_Profesor int,
    Id_Grupa SMALLINT,
    Zi VARCHAR(20),
    Ora TIME,
    Auditoriu int,
    Bloc VARCHAR(2) not null default('A')
);

insert into orarul values
    (107, 101, 1, 'Luni', '08:00', 202, 'B'),
    (108, 101, 1, 'Luni', '11:30', 501, 'B'),
    (119, 117, 1, 'Luni', '13:30', 501, 'B');