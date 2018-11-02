SELECT Disciplina
FROM discipline
JOIN studenti_reusita sr
    ON discipline.Id_Disciplina = sr.Id_Disciplina
JOIN profesori
    ON sr.Id_Profesor = profesori.Id_Profesor
GROUP BY Disciplina
HAVING
    COUNT(DISTINCT sr.Id_Profesor) >= 2