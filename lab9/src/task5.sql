DROP PROCEDURE IF EXISTS reward_the_good_guys
GO

CREATE PROCEDURE reward_the_good_guys
    @disciplina CHAR(255)
AS
BEGIN
    DECLARE @result TABLE
    (
        Id_Student INT,
        Cod_Grupa CHAR(255),
        Nume_Prenume_Student CHAR(255),
        Disciplina CHAR(255),
        Nota_Veche TINYINT,
        Nota_Noua TINYINT
    );

    INSERT INTO @result
    (
        Id_Student,
        Cod_Grupa,
        Nume_Prenume_Student,
        Disciplina,
        Nota_Veche,
        Nota_Noua
    )
    SELECT DISTINCT TOP 3
        studenti.Id_Student,
        Cod_Grupa,
        Nume_Student + ' ' + Prenume_Student,
        Disciplina,
        sr.Nota AS Nota_Veche,
        sr.Nota AS Nota_Noua
    FROM studenti
    JOIN studenti_reusita sr ON sr.Id_Student = studenti.Id_Student
    JOIN discipline ON sr.Id_Disciplina = discipline.Id_Disciplina
    JOIN grupe ON sr.Id_Grupa = grupe.Id_Grupa
    WHERE
        Disciplina = @disciplina AND
        Nota IS NOT NULL
    ORDER BY Nota DESC;

    UPDATE studenti_reusita
    SET Nota = Nota + 1
    WHERE
        Id_Student IN (SELECT Id_Student FROM @result) AND
        Nota < 10;

    UPDATE @result
    SET Nota_Noua = Nota_Veche + 1
    WHERE Nota_Veche < 10;
    
    SELECT * FROM @result;
    RETURN SELECT
        Cod_Grupa,
        Nume_Prenume_Student,
        Disciplina,
        Nota_Veche,
        Nota_Noua
    FROM @result;
END
GO

-- UPDATE studenti_reusita
-- SET Nota = Nota - 1
-- WHERE Nota > 1

EXEC reward_the_good_guys @disciplina = 'Sisteme de operare';