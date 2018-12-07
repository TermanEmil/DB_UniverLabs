-- Remove proc if exists
DROP PROCEDURE IF EXISTS add_new_student;
GO

-- Proc to add a new student.
CREATE PROCEDURE add_new_student
    @nume VARCHAR(50),
    @prenume VARCHAR(50),
    @data_nastere DATE,
    @adresa_postala VARCHAR(500),
    @cod_grupa VARCHAR(6),
    @verbose BIT = 0
AS
BEGIN
    DECLARE @stuent_id INT;
    SET @stuent_id = (SELECT MAX(Id_Student) FROM dbo.studenti) + 1;

    INSERT INTO dbo.studenti
    (
        [Id_Student],
        [Nume_Student],
        [Prenume_Student],
        [Data_Nastere_Student],
        [Adresa_Postala_Student]
    )
    VALUES
    (
        (SELECT MAX(Id_Student) FROM dbo.studenti) + 1,
        @nume,
        @prenume,
        @data_nastere,
        @adresa_postala
    );

    IF @cod_grupa NOT IN (SELECT Cod_Grupa FROM grupe)
        RAISERROR('No such group code', 16, 1);

    INSERT INTO dbo.studenti_reusita
    (
        Id_Student,
        Id_Disciplina,
        Id_Profesor,
        Id_Grupa,
        Tip_Evaluare,
        Nota,
        Data_Evaluare
    )
    VALUES
    (
        @stuent_id,
        (SELECT TOP 1 Id_Disciplina FROM discipline),
        (SELECT TOP 1 Id_Profesor FROM profesori),
        (SELECT Id_Grupa FROM grupe WHERE Cod_Grupa = @cod_grupa),
        'Kill me pls',
        NULL,
        NULL
    );

    if (@verbose <> 0)
    BEGIN
        SELECT *
        FROM studenti
        JOIN studenti_reusita sr ON sr.Id_Student = studenti.Id_Student
        JOIN grupe ON grupe.Id_Grupa = sr.Id_Grupa
        WHERE sr.Id_Student = @stuent_id
    END
END
GO

EXEC add_new_student
    @nume = 'Terman',
    @prenume = 'Emil',
    @data_nastere = '10/03/1997',
    @adresa_postala = 'Moldova',
    @cod_grupa = 'TI171',
    @verbose = 1