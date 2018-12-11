DROP PROCEDURE IF EXISTS long_proc
GO

CREATE PROCEDURE long_proc
AS
BEGIN
    DECLARE @i INT = 0;

    SET FMTONLY OFF
    WHILE @i < 50
    BEGIN
        SELECT Id_Student, Cod_Grupa
        FROM studenti_reusita sr
        JOIN grupe ON grupe.Id_Grupa = sr.Id_Grupa
        WHERE
            Cod_Grupa = 'TI171' AND
            Nota > 5

        SET @i = @i + 1;
    END
END
GO

-- Test performance without index
DROP INDEX IF EXISTS ix_grupe_cod_grupa ON studenti_reusita
;
GO

EXEC long_proc;
GO

-- Test performance with index
DROP INDEX IF EXISTS ix_grupe_cod_grupa ON studenti_reusita;
GO

CREATE UNIQUE NONCLUSTERED INDEX ix_grupe_cod_grupa
ON studenti_reusita(Id_Student, Id_Disciplina, Id_Grupa, Id_Profesor, Tip_Evaluare, Nota ASC)
WHERE Nota > 5 AND Id_Grupa = 3 -- Cod_Grupa = TI171
GO

EXEC long_proc;
GO

EXEC sp_helpindex grupe