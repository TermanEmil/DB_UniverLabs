SELECT DISTINCT Nume_Student, Prenume_Student
FROM studenti
INNER JOIN studenti_reusita AS sr
    ON studenti.Id_Student = sr.Id_Student
INNER JOIN discipline
    ON sr.Id_Disciplina = discipline.Id_Disciplina
WHERE
    Tip_Evaluare = 'Examen' AND
    Disciplina = 'Baze de date' AND
    YEAR(Data_Evaluare) = 2018 AND
    Nota < 8 AND Nota > 4