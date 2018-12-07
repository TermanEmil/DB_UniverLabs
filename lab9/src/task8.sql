DROP FUNCTION IF EXISTS reusita
GO

CREATE FUNCTION reusita (@Nume_Prenume_Student CHAR(255))
RETURNS TABLE
AS
    RETURN
    (
        SELECT
            @Nume_Prenume_Student AS Nume_Prenume_Student,
            Disciplina,
            Nota,
            Data_Evaluare
        FROM studenti_reusita sr
        JOIN discipline d ON d.Id_Disciplina = sr.Id_Disciplina
        JOIN studenti s ON s.Id_Student = sr.Id_Student
        WHERE
            Nume_Student + ' ' + Prenume_Student = @Nume_Prenume_Student
    );
GO

SELECT * FROM reusita('Brasovianu Teodora')