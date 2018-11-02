SELECT Disciplina
FROM discipline
JOIN studenti_reusita sr
    ON discipline.Id_Disciplina = sr.Id_Disciplina
WHERE
    Tip_Evaluare = 'Examen'
GROUP BY Disciplina
HAVING AVG(Cast(Nota as decimal(4, 2))) > 7
ORDER BY Disciplina DESC