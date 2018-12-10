CREATE SCHEMA studenti;
GO

alter schema studenti transfer dbo.studenti_reusita
alter schema studenti transfer dbo.studenti
GO

select * from studenti.studenti_reusita
select * from studenti.studenti