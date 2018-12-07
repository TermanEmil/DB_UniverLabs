DROP PROCEDURE IF EXISTS task2_proc;
GO

CREATE PROCEDURE task2_proc
AS
    RETURN
    (
        SELECT COUNT(*)
        FROM studenti_reusita
        WHERE Nota < 5 OR Nota = NULL
    )
GO

DECLARE @nb_of_loosers INT;

EXEC @nb_of_loosers = task2_proc;
SELECT 'Loosers' = @nb_of_loosers;
