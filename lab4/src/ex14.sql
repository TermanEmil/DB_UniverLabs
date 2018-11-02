SELECT DISTINCT Nume_Student, Prenume_Student, Disciplina
FROM studenti_reusita AS sr
JOIN studenti
    ON sr.Id_Student = studenti.Id_Student
JOIN discipline AS d
    ON sr.Id_Disciplina = d.Id_Disciplina
WHERE
    Nota > 8 AND
    Tip_Evaluare LIKE 'Examen%'