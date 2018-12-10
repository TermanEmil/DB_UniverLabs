DROP TRIGGER IF EXISTS trigger_10_6 ON DATABASE;
GO

DROP TRIGGER IF EXISTS trigger_10_5 ON DATABASE;
GO

CREATE TRIGGER trigger_10_6 ON DATABASE
AFTER ALTER_TABLE
AS
    SET NOCOUNT ON;
BEGIN
    DECLARE @column_name VARCHAR(64) =
        EVENTDATA().value('(/EVENT_INSTANCE/AlterTableActionList/*/Columns/Name)[1]', 'NVARCHAR(MAX)');
    
    IF (@column_name IS NULL OR @column_name <> 'Id_Profesor')
        RETURN

    DECLARE @command VARCHAR(255) = 
        EVENTDATA().value ('(/EVENT_INSTANCE/TSQLCommand/CommandText)[1]', 'nvarchar(max)');
    
    DECLARE @table VARCHAR(255) =
        EVENTDATA().value ('(/EVENT_INSTANCE/ObjectName)[1]','nvarchar(max)');

    DECLARE @new_cmd VARCHAR(255);

    -- studenti_reusita
    SET @new_cmd = REPLACE(@command, @table, 'studenti_reusita')

    ALTER TABLE studenti_reusita
    DROP CONSTRAINT PK_studenti_reusita
    
    EXECUTE (@new_cmd)

    ALTER TABLE studenti_reusita
    ADD CONSTRAINT PK_studenti_reusita PRIMARY KEY(
        Id_Student, Id_Disciplina, Id_Profesor, Id_Grupa, Tip_Evaluare
    )
END
GO

-- BEGIN TRANSACTION
    ALTER TABLE studenti_reusita
    DROP CONSTRAINT FK_studenti_reusita_profesori

    -- This may differ
    ALTER TABLE profesori
    DROP CONSTRAINT PK__profesor__45D4152A1260D244

    ALTER TABLE profesori
    ALTER COLUMN Id_Profesor VARCHAR(25) NOT NULL;

    ALTER TABLE profesori
    ADD PRIMARY KEY (Id_Profesor)
-- ROLLBACK TRANSACTION;