CREATE SCHEMA plan_studii
GO

alter schema plan_studii transfer dbo.discipline
GO

select * from plan_studii.discipline