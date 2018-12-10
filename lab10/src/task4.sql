DROP TRIGGER IF EXISTS trigger_10_4 ON DATABASE
GO

CREATE TRIGGER trigger_10_4 ON DATABASE
FOR ALTER_TABLE
AS
    SET NOCOUNT ON;
BEGIN
    IF
    (
        eventdata().value('(/EVENT_INSTANCE/AlterTableActionList/*/Columns/Name)[1]','nvarchar(max)') =
        'Id_Disciplina'
    )
    BEGIN
        RAISERROR('Nu e permis de modificat Id_Disciplina', 16, 1);
        ROLLBACK
    END
END
GO

BEGIN TRANSACTION
    -- No errors
    ALTER TABLE studenti_reusita
    DROP CONSTRAINT PK_studenti_reusita;

    -- Errors
    ALTER TABLE studenti_reusita
    ALTER COLUMN Id_Disciplina INT
ROLLBACK TRANSACTION;

