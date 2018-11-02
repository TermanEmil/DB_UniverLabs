USE universitatea;
GO

SELECT DISTINCT Nume_Profesor, Prenume_Profesor, Disciplina
FROM discipline
JOIN studenti_reusita as sr
    ON discipline.Id_Disciplina = sr.Id_Disciplina
JOIN profesori
    ON sr.Id_Profesor = profesori.Id_Profesor
ORDER BY Nume_Profesor, Prenume_Profesor;
