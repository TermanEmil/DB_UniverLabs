SELECT *, LEN(Disciplina) AS 'Len'
FROM discipline
WHERE LEN(Disciplina) > 20;