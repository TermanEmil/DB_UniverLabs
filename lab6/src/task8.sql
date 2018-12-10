DROP PROCEDURE IF EXISTS long_proc
GO

CREATE PROCEDURE long_proc
AS
BEGIN
    DECLARE @i INT = 0;

    SET FMTONLY OFF
    WHILE @i < 500
    BEGIN
        SELECT *
        FROM studenti_reusita sr
        JOIN grupe ON grupe.Id_Grupa = sr.Id_Grupa
        WHERE Cod_Grupa = 'TI171'

        SET @i = @i + 1;
    END
END
GO

-- Test performance without index
DROP INDEX IF EXISTS ix_grupe_cod_grupa ON grupe;
GO

EXEC long_proc;
GO

-- Test performance with index
DROP INDEX IF EXISTS ix_grupe_cod_grupa ON grupe;
GO

CREATE UNIQUE INDEX ix_grupe_cod_grupa
ON grupe(Cod_Grupa);
GO

EXEC long_proc;
GO

EXEC sp_helpindex grupe