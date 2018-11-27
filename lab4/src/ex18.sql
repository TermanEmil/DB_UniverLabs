SELECT DISTINCT
    Nume_Profesor,
    Prenume_Profesor,
    Nr_ore_plan_disciplina
FROM profesori
JOIN studenti_reusita AS sr
    ON profesori.Id_Profesor = sr.Id_Profesor
JOIN discipline
    ON sr.Id_Disciplina = discipline.Id_Disciplina
WHERE
    Nr_ore_plan_disciplina < 60 AND
    1 = (
        SELECT
            COUNT(DISTINCT sr2.Id_Disciplina)
        FROM profesori
        INNER JOIN studenti_reusita AS sr2
            ON profesori.Id_Profesor = sr2.Id_Profesor
        WHERE sr2.Id_Profesor = sr.Id_Profesor
        GROUP BY sr2.Id_Profesor
    )



SELECT DISTINCT
    Nume_Profesor,
    Prenume_Profesor,
    Nr_ore_plan_disciplina
FROM profesori
JOIN studenti_reusita AS sr
    ON profesori.Id_Profesor = sr.Id_Profesor
JOIN discipline
    ON sr.Id_Disciplina = discipline.Id_Disciplina

EXCEPT

SELECT DISTINCT
    Nume_Profesor,
    Prenume_Profesor,
    Nr_ore_plan_disciplina
FROM profesori
JOIN studenti_reusita AS sr
    ON profesori.Id_Profesor = sr.Id_Profesor
JOIN discipline
    ON sr.Id_Disciplina = discipline.Id_Disciplina
WHERE
    Nr_ore_plan_disciplina >= 60
