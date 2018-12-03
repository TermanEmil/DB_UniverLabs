if exists(select 1 from sys.views where name='lab4_ex5_unmodif' and type='v')
    drop view lab4_ex5_unmodif;
go

CREATE VIEW lab4_ex5_unmodif (Id_Student, Nume_Student, Prenume_Student) WITH SCHEMABINDING AS
    SELECT Id_Student, Nume_Student, Prenume_Student
    FROM dbo.studenti
    WHERE (Nume_Student LIKE '%u')
    WITH CHECK OPTION
GO