WITH my_common_table_expr(Nume_Student, Prenume_Student) AS 
(
    SELECT Nume_Student, Prenume_Student
    FROM studenti
    WHERE Nume_Student LIKE '%u'
)
SELECT * FROM my_common_table_expr;


WITH exam_marks(Id_Disciplina, Nota) AS
(
    SELECT Id_Disciplina, Nota
    FROM studenti_reusita
    WHERE Tip_Evaluare='Examen'
)
SELECT TOP 1
    AVG(Cast(Nota as decimal(4, 2))) as avg_nota,
    Id_Disciplina
FROM exam_marks
GROUP BY Id_Disciplina
ORDER BY avg_nota DESC;