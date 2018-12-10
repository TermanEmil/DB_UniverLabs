DROP TRIGGER IF EXISTS trigger_10_5 ON DATABASE;
GO

CREATE TRIGGER trigger_10_5 ON DATABASE
FOR ALTER_TABLE
AS
    SET NOCOUNT ON
BEGIN
    DECLARE @current_hour INT = DATEPART(HOUR, GETDATE());

    IF
    (
        DATENAME(DW, GETDATE()) IN ('Saturday', 'Sunday') OR
        (@current_hour < 8 OR @current_hour > 18)
    )
    BEGIN
        ROLLBACK;
        Raiserror('Nu este permis de modificat tabelele inafara orelor de lucru', 16, 1);
    END
END
GO

BEGIN TRANSACTION
    ALTER TABLE studenti_reusita
    DROP CONSTRAINT PK_studenti_reusita;
ROLLBACK TRANSACTION;