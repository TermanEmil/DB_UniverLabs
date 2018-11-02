SELECT DISTINCT
    Nume_Profesor,
    Prenume_Profesor
FROM profesori
JOIN studenti_reusita AS sr
    ON profesori.Id_Profesor = sr.Id_Profesor
JOIN studenti
    ON sr.Id_Student = studenti.Id_Student
WHERE
    Nota < 5 AND
    Nume_Student LIKE '%Cosovanu%'