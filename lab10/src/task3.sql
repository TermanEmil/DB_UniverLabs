DROP TRIGGER IF EXISTS tirgger_10_3;
GO

CREATE TRIGGER tirgger_10_3 ON studenti_reusita
FOR UPDATE
AS
    SET NOCOUNT ON;
BEGIN
    IF NOT UPDATE(Nota) AND NOT UPDATE(Data_Evaluare)
        RETURN;

    IF EXISTS (
        SELECT *
        FROM
            deleted,
            (
                inserted
                JOIN grupe g ON g.Id_Grupa = inserted.Id_Grupa
            )
        WHERE
            Cod_Grupa = 'CIB171' AND
            (
                (inserted.Nota IS NOT NULL AND inserted.Nota < deleted.Nota) OR
                (inserted.Data_Evaluare IS NOT NULL AND inserted.Data_Evaluare <> deleted.Data_Evaluare)
            )
    )
    BEGIN
        RAISERROR('Este interzis de scazut Nota sau de schimbat Data_Evaluare la grupa CIB171', 16, 1);
        ROLLBACK;
    END
END
GO

-- Valid example of UPDATE
UPDATE studenti_reusita
SET Nota = Nota - 1
WHERE
    NOTA > 1 AND
    Id_Grupa IN (SELECT Id_Grupa FROM grupe WHERE Cod_Grupa <> 'CIB171')

-- Example with Nota - 1
UPDATE studenti_reusita
SET Nota = Nota - 1;
GO

-- Example for Data_Evaluare
UPDATE studenti_reusita
SET Data_Evaluare = '2018-01-01'
GO