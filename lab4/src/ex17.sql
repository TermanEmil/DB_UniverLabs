SELECT DISTINCT Nume_Profesor, Prenume_Profesor
FROM profesori
JOIN studenti_reusita AS sr
    ON profesori.Id_Profesor = sr.Id_Profesor
WHERE
    Id_Student = 100