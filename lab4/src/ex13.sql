SELECT DISTINCT Disciplina
FROM discipline
JOIN studenti_reusita AS sr
    ON discipline.Id_Disciplina = sr.Id_Disciplina
JOIN studenti
    ON studenti.Id_Student = sr.Id_Student
WHERE
    Nume_Student = 'Florea' AND
    Prenume_Student = 'Ioan'