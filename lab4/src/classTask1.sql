SELECT DISTINCT Nume_Profesor, Prenume_Profesor, Disciplina, Nr_ore_plan_disciplina
FROM profesori
JOIN studenti_reusita sr
    ON profesori.Id_Profesor = sr.Id_Profesor
JOIN discipline
    ON sr.Id_Disciplina = discipline.Id_Disciplina
WHERE
    Nr_ore_plan_disciplina = (SELECT MAX(Nr_ore_plan_disciplina) FROM discipline)