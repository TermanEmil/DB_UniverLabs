SELECT DISTINCT Nume_Student, Prenume_Student, Id_Profesor
FROM studenti
JOIN studenti_reusita AS sr
    ON studenti.Id_Student = sr.Id_Student
JOIN discipline AS d
    ON sr.Id_Disciplina = d.Id_Disciplina
WHERE
    Nr_ore_plan_disciplina < 60
    