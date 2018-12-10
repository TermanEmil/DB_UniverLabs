DROP TRIGGER IF EXISTS safe_add_to_studenti_reusita;
GO

-- Insert the lines that have valid Student Ids.
-- If it has invalid student Ids, select error messages.
CREATE TRIGGER safe_add_to_studenti_reusita ON studenti_reusita
INSTEAD OF INSERT
AS
    SET NOCOUNT ON;
BEGIN
    INSERT INTO studenti_reusita
    SELECT * FROM inserted
    WHERE Id_Student IN (SELECT Id_Student FROM studenti)

    IF EXISTS (
        SELECT *
        FROM inserted
        WHERE Id_Student NOT IN (SELECT Id_Student FROM studenti)
    )
    BEGIN
        SELECT
            'The student with id = ' + CAST(Id_Student AS VARCHAR)
            + ' does not exist.'
            AS Error
        FROM inserted
        WHERE Id_Student NOT IN (SELECT Id_Student FROM studenti)
    END;
END
GO

-- Prepare a valid INSERT example.
DELETE FROM studenti_reusita
WHERE
    Id_Student = 100
    AND Id_Disciplina = 101
    AND Id_Profesor = 101
    AND Id_Grupa = 1;

INSERT INTO studenti_reusita VALUES
    (235, 101, 101, 1, 'Testul 1', 9, null),
    (100, 101, 101, 1, 'Testul 1', 9, null);