if exists(select 1 from sys.views where name='lab4_ex3' and type='v')
    drop view lab4_ex3;
go

CREATE VIEW lab4_ex3 AS (
    SELECT DISTINCT Nume_Profesor, Prenume_Profesor, Disciplina
    FROM discipline
    JOIN studenti_reusita as sr
        ON discipline.Id_Disciplina = sr.Id_Disciplina
    JOIN profesori
        ON sr.Id_Profesor = profesori.Id_Profesor
);
GO

if exists(select 1 from sys.views where name='lab4_ex5' and type='v')
    drop view lab4_ex5;
go

CREATE VIEW lab4_ex5 AS
    SELECT Id_Student, Nume_Student, Prenume_Student
    FROM studenti
    WHERE Nume_Student LIKE '%u';
GO

-- SELECT * FROM lab4_ex3;
SELECT * FROM lab4_ex5;