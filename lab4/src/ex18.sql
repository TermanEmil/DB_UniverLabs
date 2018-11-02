SELECT DISTINCT
    Nume_Profesor,
    Prenume_Profesor
FROM profesori
JOIN studenti_reusita AS sr
    ON profesori.Id_Profesor = sr.Id_Profesor
JOIN discipline
    ON sr.Id_Disciplina = discipline.Id_Disciplina
WHERE
    Nr_ore_plan_disciplina < 60