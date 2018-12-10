-- 1
SELECT * FROM studenti.studenti
WHERE Nume_Student LIKE '%u';

-- 2
SELECT
    Disciplina,
    Nr_ore_plan_disciplina
FROM plan_studii.discipline
ORDER BY Nr_ore_plan_disciplina DESC;

-- 3
SELECT
    Nume_Student,
    Prenume_Student,
    avg(Nota) as Media,
    Id_Grupa
FROM studenti.studenti s
JOIN studenti.studenti_reusita sr on s.Id_Student = sr.Id_Student
GROUP BY Nume_Student, Prenume_Student, Id_Grupa