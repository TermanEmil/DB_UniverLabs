SELECT
    Nume_Profesor,
    Prenume_Profesor,
    COUNT(DISTINCT sr.Id_Disciplina) AS 'Nr de discipline'
FROM profesori
INNER JOIN studenti_reusita AS sr
    ON profesori.Id_Profesor = sr.Id_Profesor
GROUP BY Nume_Profesor, Prenume_Profesor
ORDER BY Nume_Profesor, Prenume_Profesor