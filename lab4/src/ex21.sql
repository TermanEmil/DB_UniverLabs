SELECT
    -- *
    Nume_Student,
    Prenume_Student,
    COUNT(Nota) AS 'Nr de note'
FROM studenti
JOIN studenti_reusita AS sr
    ON studenti.Id_Student = sr.Id_Student
GROUP BY Nume_Student, Prenume_Student
ORDER BY Nume_Student, Prenume_Student