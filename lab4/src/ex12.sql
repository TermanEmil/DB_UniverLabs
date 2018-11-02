SELECT Nume_Student, Prenume_Student, Disciplina, Nota, YEAR(Data_Evaluare) AS 'Anul'
FROM studenti
JOIN studenti_reusita AS sr
    ON studenti.Id_Student = sr.Id_Student
JOIN discipline AS d
    ON sr.Id_Disciplina = d.Id_Disciplina
WHERE
    Prenume_Student = 'Alex'