SELECT DISTINCT TOP 5 WITH TIES Nume_Student, Prenume_Student, Disciplina, Nota, Tip_Evaluare
FROM studenti_reusita AS rs
INNER JOIN studenti
    ON rs.Id_Student = studenti.Id_Student
INNER JOIN discipline
    ON rs.Id_Disciplina = discipline.Id_Disciplina
WHERE
    Disciplina = 'Baze de date' AND
    Tip_Evaluare = 'Testul 2' AND
    Nota IS NOT NULL
ORDER BY Nota DESC