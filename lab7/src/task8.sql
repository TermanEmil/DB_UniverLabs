--Create synonyms--
DROP SYNONYM IF EXISTS Discipline;
CREATE SYNONYM Discipline
FOR universitatea.plan_studii.discipline

DROP SYNONYM IF EXISTS Studenti_Reusita;
CREATE SYNONYM Studenti_Reusita 
for universitatea.studenti.studenti_reusita

DROP SYNONYM IF EXISTS Studenti;
CREATE SYNONYM Studenti
for universitatea.studenti.studenti

DROP SYNONYM IF EXISTS Profesori;
CREATE SYNONYM Profesori
for universitatea.cadre_didactice.profesori 

-- 1
SELECT * FROM Studenti
WHERE Nume_Student LIKE '%u';

-- 2
SELECT
    Disciplina,
    Nr_ore_plan_disciplina
FROM Discipline
ORDER BY Nr_ore_plan_disciplina DESC;

-- 3
SELECT
    Nume_Student,
    Prenume_Student,
    avg(Nota) as Media,
    Id_Grupa
FROM Studenti s
JOIN Studenti_Reusita sr on s.Id_Student = sr.Id_Student
GROUP BY Nume_Student, Prenume_Student, Id_Grupa