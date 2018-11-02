SELECT COUNT(*)
FROM studenti_reusita AS sr
JOIN discipline
    ON sr.Id_Disciplina = discipline.Id_Disciplina
WHERE
    YEAR(Data_Evaluare) = 2018 AND
    Tip_Evaluare = 'Testul 2' AND
    Disciplina = 'Baze de date'
