SELECT DISTINCT Nume_Profesor, Prenume_Profesor
FROM profesori
JOIN studenti_reusita AS sr
    ON profesori.Id_Profesor = sr.Id_Profesor
JOIN discipline AS d
    ON sr.Id_Disciplina = d.Id_Disciplina
WHERE
    Disciplina = 'Baze de date' AND
    YEAR(Data_Evaluare) = 2018 AND
    Nota < 5