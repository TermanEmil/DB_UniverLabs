DECLARE @except_grades TABLE (val INT)
insert @except_grades(val) VALUES(6), (8), (11)

-- Raise error and Exit if one of the specified except_grades is invalid
BEGIN TRY
    IF EXISTS(SELECT * FROM @except_grades WHERE val < 0 OR val > 10)
        RAISERROR ('Invalid grade', 16, 1);
END TRY
BEGIN CATCH
    PRINT 'ERROR: ' + ERROR_MESSAGE()
    RETURN
END CATCH

SELECT Nume_Student, Prenume_Student, Nota, Data_Evaluare
FROM studenti
JOIN studenti_reusita sr
    ON studenti.Id_Student = sr.Id_Student
JOIN discipline
    ON sr.Id_Disciplina = discipline.Id_Disciplina
WHERE
    Tip_Evaluare = 'Testul 1' AND
    Disciplina = 'Baze de date' AND
    Nota IN (SELECT IIF(Nota IN (SELECT val FROM @except_grades), NULL, Nota))