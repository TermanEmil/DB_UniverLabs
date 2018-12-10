CREATE SCHEMA cadre_didactice
GO

ALTER SCHEMA cadre_didactice TRANSFER dbo.profesori;
GO

select * from  cadre_didactice.profesori;
GO