DROP FUNCTION IF EXISTS get_age
GO

CREATE FUNCTION get_age(@birth_date DATE)
RETURNS INT
BEGIN
    RETURN DATEDIFF(YEAR, @birth_date, GETDATE())
END
GO

SELECT
    Nume_Student,
    Prenume_Student,
    dbo.get_age(Data_Nastere_Student) AS Age
FROM studenti