-- Proc1
DROP PROCEDURE IF EXISTS proc1;
GO

CREATE PROCEDURE proc1
    @letter NVARCHAR(1)
AS
(
    SELECT Id_Student, Nume_Student, Prenume_Student
    FROM studenti
    WHERE Nume_Student LIKE ('%' + @letter)
);
GO

EXEC proc1 @letter = 'u';

-- Proc2
DROP PROCEDURE IF EXISTS proc2;
GO

CREATE PROCEDURE proc2
    @nb_of_letters INT
AS
(
    SELECT Disciplina
    FROM discipline
    WHERE LEN(Disciplina) > @nb_of_letters
);
GO

EXEC proc2 @nb_of_letters = 10