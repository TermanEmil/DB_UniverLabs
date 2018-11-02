SELECT DISTINCT Nume_Student, Adresa_Postala_Student, Id_Disciplina
FROM studenti
INNER JOIN studenti_reusita AS sr
    ON studenti.Id_Student = sr.Id_Student
WHERE
    Nota > 8 AND
    YEAR(Data_Evaluare) = 2018