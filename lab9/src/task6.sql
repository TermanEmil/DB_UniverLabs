-- First function
DROP FUNCTION IF EXISTS select_endings;
GO

CREATE FUNCTION select_endings (@ending VARCHAR(255))
RETURNS TABLE
AS
    RETURN
    (
        SELECT Id_Student, Nume_Student, Prenume_Student
        FROM studenti
        WHERE Nume_Student LIKE ('%' + @ending)
    )
GO

SELECT * FROM select_endings('u')

-- Second function
DROP FUNCTION IF EXISTS students_evaluated_on_date
GO

CREATE FUNCTION students_evaluated_on_year(@year INT)
RETURNS TABLE
AS
    RETURN
    (
        SELECT DISTINCT
            Nume_Student,
            Prenume_Student,
            Data_Evaluare
        FROM studenti
        INNER JOIN studenti_reusita AS sr
            ON studenti.Id_Student = sr.Id_Student
        WHERE
            YEAR(Data_Evaluare) = @year
    )
GO

SELECT * FROM students_evaluated_on_year(2018)