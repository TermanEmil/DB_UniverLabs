DROP FUNCTION IF EXISTS idk_how_to_name_it;
GO

CREATE FUNCTION idk_how_to_name_it(
    @cod_grupa CHAR(255),
    @is_good CHAR(255)
)
RETURNS @result TABLE
(
    Grupa CHAR(255),
    Nume_Prenume_Student CHAR(255),
    Nota_Media DECIMAL(4, 2),
    is_good CHAR(255)
)
AS
BEGIN
    DECLARE @sort_order INT;

    IF (@is_good = 'sarguincios')
        SET @sort_order = -1;
    ELSE IF (@is_good = 'slab')
        SET @sort_order = 1;
    ELSE
    BEGIN
        DECLARE @error INT = CAST('is_good: unkown value' AS INT)
        RETURN
    END

    INSERT INTO @result
    SELECT TOP 1
    @cod_grupa AS Grupa,
    Nume_Student + ' ' + Prenume_Student AS Nume_Prenume_Student,
    AVG(CAST(Nota AS numeric(4, 2))) AS Nota_Media,
    @is_good AS is_good
    FROM studenti_reusita sr
    JOIN studenti s ON s.Id_Student = sr.Id_Student
    JOIN grupe g ON g.Id_Grupa = sr.Id_Grupa
    GROUP BY Nume_Student + ' ' + Prenume_Student
    ORDER BY AVG(CAST(Nota AS numeric(4, 2))) * @sort_order

    RETURN
END
GO

SELECT * FROM idk_how_to_name_it('TI171', 'sarguincios');
SELECT * FROM idk_how_to_name_it('TI171', 'slab');