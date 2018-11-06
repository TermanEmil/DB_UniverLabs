DECLARE @except_grades TABLE (val INT)
insert @except_grades(val) VALUES(6), (8)

SELECT TOP 10 Nume_Student, Prenume_Student, Nota, Data_Evaluare
FROM studenti
JOIN studenti_reusita sr
    ON studenti.Id_Student = sr.Id_Student
JOIN discipline
    ON sr.Id_Disciplina = discipline.Id_Disciplina
WHERE
    Tip_Evaluare = 'Testul 1' AND
    Disciplina = 'Baze de date' AND
    Nota IN (SELECT IIF(Nota IN (SELECT val FROM @except_grades), NULL, Nota))